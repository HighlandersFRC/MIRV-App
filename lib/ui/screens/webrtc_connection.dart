// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/gamepad/gamepad_command_type.dart';
import 'package:mirv/models/rover/rover_state.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/services/gamepad_controller.dart';
import 'package:mirv/services/joystick_controller.dart';
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/home_page.dart';

class JoystickValue extends Observable {
  final double x;
  final double y;
  final DateTime ts;

  JoystickValue(this.x, this.y, this.ts);
}

class WebRTCConnection {
  var logger = Logger();

  late MirvApi mirvApi = MirvApi();
  RTCPeerConnection? peerConnection;
  get_pkg.Rx<RTCDataChannelState?> dataChannelState = get_pkg.Rx<RTCDataChannelState?>(null);

  get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState = get_pkg.Rx<RTCPeerConnectionState?>(null);

  get_pkg.Rx<RTCVideoRenderer> localRenderer = get_pkg.Rx<RTCVideoRenderer>(RTCVideoRenderer());
  final RoverGarageState roverGarageState;
  late get_pkg.Rx<RoverGarageState> roverMetricsObs = get_pkg.Rx<RoverGarageState>(roverGarageState);
  StreamSubscription? garageStateSubscription;

  GamepadController gamepadController = GamepadController();
  JoystickController joystickController = JoystickController();
  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;
  String transformType = "none";
  var messageBoxController = TextEditingController();
  final StreamController<RoverCommand> _commandStreamController = StreamController<RoverCommand>.broadcast();
  Stream<RoverCommand> get commandStream => _commandStreamController.stream.asBroadcastStream();
  get_pkg.Rx<bool> useGamepad = false.obs;
  BehaviorSubject<RoverCommand> periodicRoverCommandUpdates = BehaviorSubject<RoverCommand>();
  Duration secondsElapsed = const Duration(seconds: 10);
  DateTime prevHeartbeatDebugTime = DateTime.now();

  DateTime? recentStatusMessage;

  RoverCommand? mostRecentCommand;

  // MediaStream? _localStream;
  bool inCalling = false;
  get_pkg.Rx<bool> loading = false.obs;

  Timer? peerConnectionTimer;
  Timer? timerJoy;
  Timer? timer;
  Timer? heartbeatTimer;

  int GATHERING_RETRY_THRESHOLD = 90; //seconds
  int GATHERING_HEARTBEAT = 500;

  WebRTCConnection(this.roverGarageState) {
    init();
    peerConnectionTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      peerConnectionState.value = peerConnection?.connectionState;
    });
  }

  Future<void> init() async {
    RTCVideoRenderer val = localRenderer.value;
    await val.initialize();
    localRenderer.value = val;
    _startGarageUpdates();
  }

  _startGarageUpdates() {
    mirvApi.garageMetricsObs.listen((value) {
      roverMetricsObs.value = roverMetricsObs.value.updateGarageState(value);
    });
    garageStateSubscription = roverMetricsObs.listen((value) {
      if (value.garage != null) {
        mirvApi.startGarageMetricUpdates(roverMetricsObs.value.garage!.garage_id);
        garageStateSubscription?.cancel();
      }
    });
  }

  _showFailedConnectionDialog({
    required String error,
    required String roverId,
  }) {
    get_pkg.Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: const Text('Failed Connection'),
        content: Text(error),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                get_pkg.Get.back();
                get_pkg.Get.offAll(() => HomePage());
              },
              child: const Text('Home page'))
        ],
      ),
    );
  }

  sendRoverCommand(RoverCommand command) {
    if (peerConnection?.connectionState == RTCPeerConnectionState.RTCPeerConnectionStateConnected &&
        _dataChannel?.state == RTCDataChannelState.RTCDataChannelOpen) {
      _dataChannel?.send(RTCDataChannelMessage(json.encode(command.toJson())));
      if (command != RoverHeartbeatCommands.heartbeat) {
        mostRecentCommand = command;
        logger.i("WebRTCConnection; sendRoverCommand; Sending non-heartbeat rover command: ${json.encode(command.toJson())}");
      }
    }

    // updateRoverState(command);
  }

  void updateRoverState(command) {
    var tempRoverMetrics = roverMetricsObs.value;
    RoverStateType state = tempRoverMetrics.state;
    if (command == RoverGeneralCommands.eStop) {
      state = RoverStateType.e_stop;
    } else if (command == RoverGeneralCommands.disable) {
      state = RoverStateType.disabled;
    } else if (command == RoverGeneralCommands.enable) {
      state = RoverStateType.idle;
    } else if (command == RoverGeneralCommands.deploy) {
      state = RoverStateType.idle;
    } else if (command == RoverGeneralCommands.cancel) {
      state = RoverStateType.idle;
    } else if (command == RoverGeneralCommands.stow) {
      state = RoverStateType.docked;
    } else if (command == RoverGeneralCommands.deployPiLits) {
      state = RoverStateType.autonomous;
    } else if (command == RoverGeneralCommands.retrievePiLits) {
      state = RoverStateType.autonomous;
    } else if (command == RoverGeneralCommands.enableRemoteOperation) {
      state = RoverStateType.remote_operation;
    } else if (command == RoverGeneralCommands.disableRemoteOperation) {
      state = RoverStateType.idle;
    }
    logger.d("WebRTCConnection; updateRoverState; Automatically updating rover sate from ${tempRoverMetrics.state} to $state");
    roverMetricsObs.value = tempRoverMetrics.copyWith(state: state);
  }

  final Map<String, dynamic> offerSdpConstraints = {
    "mandatory": {
      "OfferToReceiveAudio": true,
      "OfferToReceiveVideo": true,
    },
    "optional": [],
  };

  final Map<String, dynamic> offerOptions = {"offerToReceiveVideo": true};

  // This Data Channel function receives data send on the rover created data channels
  void _onDataChannel(RTCDataChannel dataChannel) {
    dataChannel.messageStream.listen((message) {
      if (message.type == MessageType.text) {
        logger.d("WebRTCConnection; _onDataChannel; receiving message over WebRTC data channel: ${message.text}");
        roverMetricsObs.value = roverMetricsObs.value.updateState(RoverState.fromJson(json.decode(message.text)));
        recentStatusMessage = DateTime.now();
      }
    });
  }

  // This Data Channel Function receives data sent on the data channel created by the flutter app
  void _onDataChannelMessage(RTCDataChannelMessage message) {
    if (message.type == MessageType.text) {
      if (message.text.isNotEmpty) {
        logger.d("WebRTCConnection; _onDataChannelMessage; receiving message over WebRTC data channel: ${message.text}");
        try {
          roverMetricsObs.value = RoverGarageState.fromJson(json.decode(message.text));
          roverMetricsObs.trigger(RoverGarageState.fromJson(json.decode(message.text)));
          recentStatusMessage = DateTime.now();
        } catch (e) {
          logger.w(
              "WebRTCConnection; _onDataChannelMessage; Error processing received WebRTC message: ${message.text}, because: $e");
        }
      }
    }
  }

//shows pop up if inactive for over 10 seconds
  messagesDuration(String roverId) {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (recentStatusMessage == null) return;
      final messageDifference = DateTime.now().difference(recentStatusMessage!).inSeconds.abs();
      if (messageDifference >= 10) {
        get_pkg.Get.dialog(
            barrierDismissible: false,
            AlertDialog(
              title: const Text('Failed Connection'),
              content: const Text('No Heartbeat Messages Received'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      get_pkg.Get.back();
                    },
                    child: const Text('back')),
                TextButton(
                    onPressed: () {
                      stopCall();
                      get_pkg.Get.back();
                      get_pkg.Get.offAll(() => HomePage());
                    },
                    child: const Text('Disconnect and Go to Home page'))
              ],
            ));
        timer?.cancel();
      }
    });
  }

  void _onTrack(RTCTrackEvent event) {
    if (event.track.kind == "video") {
      RTCVideoRenderer val = localRenderer.value;
      val.srcObject = event.streams[0];
      localRenderer.value = val;
      localRenderer.trigger(val);
    }
  }

//?
  void _onDataChannelState(RTCDataChannelState? state) {
    logger.w("WebRTCConnection; _onDataChannelState; Data channel state changed: $state");
    dataChannelState.value = state;
  }

//checks connection state  until it is connected up to 1.5 minutes
  Future<bool> _waitForGatheringComplete(int count) async {
    if (peerConnection == null) {
      logger.i("WebRTCConnection; _waitForGatheringComplete; peerConnection is null");
      return false;
    } else if (peerConnection!.iceGatheringState == RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return true;
    } else if (count >= GATHERING_RETRY_THRESHOLD) {
      logger.i("WebRTCConnection; _waitForGatheringComplete; Ice Gathering Timed Out");
      return false;
    } else {
      count++;
      await Future.delayed(const Duration(seconds: 1));
      return await _waitForGatheringComplete(count);
    }
  }

  Future<void> _negotiateRemoteConnection(String roverId) async {
    return peerConnection!
        .createOffer(offerOptions)
        .then((offer) {
          logger.d("WebRTCConnection; _negotiateRemoteConnection; Setting offer to local description");
          return peerConnection!.setLocalDescription(offer);
        })
        .then((_) => _waitForGatheringComplete(0))
        .then((success) async {
          logger.d("WebRTCConnection; _negotiateRemoteConnection; ICE Gathering Complete");
          if (!success && peerConnection != null) {
            logger.d(
                "WebRTCConnection; _negotiateRemoteConnection; ICE Gathering failed or peerConnection is null. Stopping connection");
            await stopCall();
            return _showFailedConnectionDialog(error: 'Connection timed out', roverId: roverId);
          } else if (!success) {
            stopCall();
            _showFailedConnectionDialog(error: 'Failed to comunicate with rover', roverId: roverId);
          }
          try {
            var des = await peerConnection!.getLocalDescription();

            http.StreamedResponse response = await mirvApi.startRoverConnection(roverId, des);

            String data = "";
            if (response.statusCode == 200) {
              data = await response.stream.bytesToString();

              var dataMap = json.decode(data);
              var answerMap = json.decode(dataMap["answer"]);
              await peerConnection!.setRemoteDescription(
                RTCSessionDescription(
                  answerMap["sdp"],
                  answerMap["type"],
                ),
              );

              loading.value = false;
            } else {
              stopCall();
              _showFailedConnectionDialog(error: 'Failed to comunicate with rover', roverId: roverId);
            }
          } on TimeoutException catch (_) {
            stopCall();
            _showFailedConnectionDialog(error: 'Request to connect timed out', roverId: roverId);
          } on SocketException catch (_) {
            stopCall();
            _showFailedConnectionDialog(error: 'No internet connection', roverId: roverId);
          } catch (e) {
            stopCall();
            _showFailedConnectionDialog(error: 'Failed to negotiate connection: $e', roverId: roverId);
          }
        });
  }

//starts listener for checking rover connection
  _startNotificationsFromWebRTC(String roverId) {
    peerConnectionState.listen((cs) {
      switch (cs) {
        case RTCPeerConnectionState.RTCPeerConnectionStateFailed:
        case RTCPeerConnectionState.RTCPeerConnectionStateClosed:
        case RTCPeerConnectionState.RTCPeerConnectionStateDisconnected:
        case null:
          stopCall();

          _showFailedConnectionDialog(error: 'Invalid Connection State', roverId: roverId);
          break;
        case RTCPeerConnectionState.RTCPeerConnectionStateNew:
        case RTCPeerConnectionState.RTCPeerConnectionStateConnected:
          // get_pkg.Get.snackbar("Rover Connection", 'Peer Connection Connected');
          break;
        case RTCPeerConnectionState.RTCPeerConnectionStateConnecting:
          // get_pkg.Get.snackbar("Rover Connection", 'Peer Connection Connecting');
          break;
      }
    });

    dataChannelState.listen((dcs) {
      switch (dcs) {
        case RTCDataChannelState.RTCDataChannelClosing:
        case RTCDataChannelState.RTCDataChannelClosed:
          stopCall();
          _showFailedConnectionDialog(error: 'Invalid Data Channel State', roverId: roverId);
          break;
        case RTCDataChannelState.RTCDataChannelConnecting:
          // get_pkg.Get.snackbar("Rover Connection", 'Data Chanel Connecting');
          break;
        case RTCDataChannelState.RTCDataChannelOpen:
          // get_pkg.Get.snackbar("Rover Connection", 'Data Chanel Connected');
          break;
        case null:
          break;
      }
    });
  }

  _stopNotificationsFromWebRTC() {
    peerConnectionTimer?.cancel();
  }

  _startHeartbeatMessages() {
    heartbeatTimer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      sendRoverCommand(RoverHeartbeatCommands.heartbeat);
      int duration = DateTime.now().difference(prevHeartbeatDebugTime).inMilliseconds;
      if (duration > 1.2 * 1000) {
        logger.w("MISSED HEARTBEAT COMMAND!!! $duration");
      }
      prevHeartbeatDebugTime = DateTime.now();
    });
  }

  _stopHeartbeatMessages() {
    heartbeatTimer?.cancel();
  }

  //public Commands
  Future<void> makeCall(String roverId) async {
    try {
      loading.value = true;
      var configuration = <String, dynamic>{
        'sdpSemantics': 'unified-plan',
        "iceServers": [
          // {"url": "stun:stun.l.google.com:19302"},
        ]
      };
      //* Create Peer Connection
      if (peerConnection != null) return;
      peerConnection = await createPeerConnection(configuration, offerSdpConstraints);
      peerConnection!.onTrack = _onTrack;
      peerConnection!.onDataChannel = _onDataChannel;
      //* Create Data Channel
      _dataChannelDict = RTCDataChannelInit();
      _dataChannelDict!.ordered = true;
      _dataChannel = await peerConnection!.createDataChannel(
        "RoverStatus",
        _dataChannelDict!,
      );
      _dataChannel!.onDataChannelState = _onDataChannelState;
      _dataChannel!.onMessage = _onDataChannelMessage;
      final mediaConstraints = <String, dynamic>{
        'audio': false,
        'video': {
          // 'facingMode': 'user',
          'facingMode': 'environment',
          'optional': [],
        }
      };

      var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);

      stream.getTracks().forEach((element) {
        peerConnection!.addTrack(element, stream);
      });
      await _negotiateRemoteConnection(roverId);
      _startNotificationsFromWebRTC(roverId);
      _startHeartbeatMessages();
      // TODO: add back when status messages are replying
      // messagesDuration(roverId);
    } catch (e) {
      stopCall();
      _showFailedConnectionDialog(error: 'Failed to create connection: $e', roverId: roverId);
    }
  }

  Future<void> stopCall() async {
    await _dataChannel?.close();
    await peerConnection?.close();
    peerConnection = null;
    _stopHeartbeatMessages();
    _stopNotificationsFromWebRTC();

    RTCVideoRenderer val = localRenderer.value;
    val.srcObject = null;
    localRenderer.value = val;
  }

  onJoystickChanged(GamepadAxisType axis, double x, double y) {
    GamepadCommand command = GamepadCommand(type: GamepadCommandType.axis, command: GamepadAxisCommand(type: axis, x: x, y: y));
    joystickController.addJoystickCommand(command);
  }

  startJoystickUpdates() {
    joystickController.drivetrainCommandStream.listen((value) {
      sendRoverCommand(value);
    });

    gamepadController.setJoystickListener();
    gamepadController.drivetrainCommandStream.listen((value) {
      sendRoverCommand(value);
    });
  }
}
