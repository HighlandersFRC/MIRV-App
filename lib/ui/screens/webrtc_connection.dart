import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:http/http.dart' as http;
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/gamepad/gamepad_command_type.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/ui_connection_state.dart';
import 'package:mirv/services/gamepad_controller.dart';
import 'package:mirv/services/joystick_controller.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
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
  late GarageMetrics garageMetrics;

  late MirvApi mirvApi = MirvApi();
  RTCPeerConnection? peerConnection;
  get_pkg.Rx<RTCDataChannelState?> dataChannelState = get_pkg.Rx<RTCDataChannelState?>(null);

  get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState = get_pkg.Rx<RTCPeerConnectionState?>(null);

  get_pkg.Rx<RTCVideoRenderer> localRenderer = get_pkg.Rx<RTCVideoRenderer>(RTCVideoRenderer());
  final RoverMetrics roverMetrics;

  late get_pkg.Rx<RoverMetrics> roverMetricsObs = get_pkg.Rx<RoverMetrics>(roverMetrics);

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

  DateTime? recentStatusMessage;

  // MediaStream? _localStream;
  bool inCalling = false;
  get_pkg.Rx<bool> loading = false.obs;

  Timer? peerConnectionTimer;
  Timer? timerJoy;
  Timer? timer;
  Timer? heartbeatTimer;

  int GATHERING_RETRY_THRESHOLD = 90; //seconds
  int GATHERING_HEARTBEAT = 100;

  WebRTCConnection(this.roverMetrics) {
    init();
    peerConnectionTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      peerConnectionState.value = peerConnection?.connectionState;
    });
  }

  Future<void> init() async {
    RTCVideoRenderer val = localRenderer.value;
    await val.initialize();
    localRenderer.value = val;
  }

  _showReconnectDialog({
    required String error,
    required String roverId,
  }) {
    get_pkg.Get.dialog(
        barrierDismissible: true,
        AlertDialog(
          title: const Text('Failed Connection'),
          content: Text('$error'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  makeCall(roverId);
                  get_pkg.Get.back();
                },
                child: const Text('Reconnect?')),
            TextButton(
                onPressed: () {
                  get_pkg.Get.back();
                  get_pkg.Get.offAll(() => const HomePage());
                },
                child: const Text('Home page'))
          ],
        ));
  }

  sendRoverCommand(RoverCommand command) {
    // print("Sending rover command: ${json.encode(command.toJson())}");
    if (peerConnection?.connectionState == RTCPeerConnectionState.RTCPeerConnectionStateConnected &&
        _dataChannel?.state == RTCDataChannelState.RTCDataChannelOpen) {
      _dataChannel?.send(RTCDataChannelMessage(json.encode(command.toJson())));
    }

    // TODO: Remove this before deployment
    // updateRoverState(command);
  }

  // TODO: Remove this before deployment
  void updateRoverState(command) {
    var tempRoverMetrics = roverMetricsObs.value;
    RoverStateType state = tempRoverMetrics.state;
    if (command == RoverGeneralCommands.eStop) {
      state = RoverStateType.e_stop;
    } else if (command == RoverGeneralCommands.disable) {
      state = RoverStateType.connected_disabled;
    } else if (command == RoverGeneralCommands.enable) {
      state = RoverStateType.connected_idle_roaming;
    } else if (command == RoverGeneralCommands.deploy) {
      state = RoverStateType.connected_idle_roaming;
    } else if (command == RoverGeneralCommands.cancel) {
      state = RoverStateType.connected_idle_roaming;
    } else if (command == RoverGeneralCommands.stow) {
      state = RoverStateType.connected_idle_docked;
    } else if (command == RoverGeneralCommands.deployPiLits) {
      state = RoverStateType.autonomous;
    } else if (command == RoverGeneralCommands.retrievePiLits) {
      state = RoverStateType.autonomous;
    } else if (command == RoverGeneralCommands.enableRemoteOperation) {
      state = RoverStateType.remote_operation;
    } else if (command == RoverGeneralCommands.disableRemoteOperation) {
      state = RoverStateType.connected_idle_roaming;
    }
    roverMetricsObs.value = tempRoverMetrics.copyWith(state: state);
  }

  void setStateInFunction({required Function function}) {
    function;
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
    // or alternatively:
    dataChannel.messageStream.listen((message) {
      if (message.type == MessageType.text) {
      } else {
        // do something with message.binary
      }
    });
  }

  // This Data Channel Function receives data sent on the data channel created by the flutter app
  void _onDataChannelMessage(RTCDataChannelMessage message) {
    if (message.type == MessageType.text) {
      try {
        roverMetricsObs.value = RoverMetrics.fromJson(json.decode(message.text));
        recentStatusMessage = DateTime.now();
      } catch (e) {
        // ignore: avoid_print
        print("Failed to process status message: $message");
      }
    } else {
      // do something with message.binary
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
                      get_pkg.Get.offAll(() => const HomePage());
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
    switch (state) {
      case RTCDataChannelState.RTCDataChannelClosed:
        break;
      case RTCDataChannelState.RTCDataChannelOpen:
        break;
      default:
        break;
    }
  }

//checks connection state  until it is connected up to 1.5 minutes
  Future<bool> _waitForGatheringComplete(int count) async {
    if (peerConnection == null) {
      return false;
    } else if (peerConnection!.iceGatheringState == RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return true;
    } else if (count >= GATHERING_RETRY_THRESHOLD) {
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
          return peerConnection!.setLocalDescription(offer);
        })
        .then((_) => _waitForGatheringComplete(0))
        .then((success) async {
          if (!success && peerConnection != null) {
            await stopCall();
            return _showReconnectDialog(error: 'Connection timed out', roverId: roverId);
          } else if (!success) {
            return;
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
              _showReconnectDialog(error: 'Failed to comunicate with rover', roverId: roverId);
            }
          } catch (e) {
            stopCall();
            _showReconnectDialog(error: 'Failed to negotiate connection: $e', roverId: roverId);
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

          _showReconnectDialog(error: 'Invalid Connection State', roverId: roverId);
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
          _showReconnectDialog(error: 'Invalid Data Channel State', roverId: roverId);
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
          {"url": "stun:stun.l.google.com:19302"},
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
      _showReconnectDialog(error: 'Failed to create connection: $e', roverId: roverId);
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
