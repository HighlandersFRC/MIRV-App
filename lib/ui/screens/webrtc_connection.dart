import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:http/http.dart' as http;
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';
import 'package:mirv/services/gamepad_controller.dart';
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/home_page.dart';

import 'package:fluttertoast/fluttertoast.dart';

class JoystickValue extends Observable {
  final double x;
  final double y;
  final DateTime ts;

  JoystickValue(this.x, this.y, this.ts);
}

class WebRTCConnection {
  BehaviorSubject<String> recievedCommands = BehaviorSubject<String>();
  MirvApi mirvApi = MirvApi();
  RTCPeerConnection? peerConnection;
  get_pkg.Rx<RTCDataChannelState?> dataChannelState = get_pkg.Rx<RTCDataChannelState?>(null);

  get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState = get_pkg.Rx<RTCPeerConnectionState?>(null);

  get_pkg.Rx<RTCVideoRenderer> localRenderer = get_pkg.Rx<RTCVideoRenderer>(RTCVideoRenderer());

  MediaStream? _localStream;
  GamepadController gamepadController = GamepadController();
  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;
  String transformType = "none";
  var messageBoxController = TextEditingController();
  final StreamController<RoverCommand> _commandStreamController = StreamController<RoverCommand>.broadcast();
  Stream<RoverCommand> get commandStream => _commandStreamController.stream.asBroadcastStream();
  get_pkg.Rx<bool> useGamepad = false.obs;

  // MediaStream? _localStream;
  bool inCalling = false;
  double prevX = 0;
  double prevY = 0;
  get_pkg.Rx<bool> loading = false.obs;

  DateTime lastSendTime = DateTime.now();

  Timer? timerJoy;

  final joystickStream = BehaviorSubject<List<double>>();

  get_pkg.Rx<JoystickValue> joystickPublish = get_pkg.Rx<JoystickValue>(JoystickValue(0.0, 0.0, DateTime.now()));

  int GATHERING_RETRY_THRESHOLD = 90; //seconds

  WebRTCConnection() {
    init();
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      peerConnectionState.value = peerConnection?.connectionState;
    });
  }

  Future<void> init() async {
    RTCVideoRenderer val = localRenderer.value;
    await val.initialize();
    localRenderer.value = val;
  }

  sendRoverCommand(RoverCommand command) {
    if (peerConnection?.connectionState == RTCPeerConnectionState.RTCPeerConnectionStateConnected &&
        _dataChannel?.state == RTCDataChannelState.RTCDataChannelOpen) {
      _dataChannel?.send(RTCDataChannelMessage(json.encode(command.toJson())));
    }
  }

  void setStateInFunction({required Function function}) {
    function;
  }

  // void toggleCamera() async {
  //   if (_localStream == null) throw Exception('Stream is not initialized');

  //   final videoTrack = _localStream!
  //       .getVideoTracks()
  //       .firstWhere((track) => track.kind == 'video');
  //   await Helper.switchCamera(videoTrack);
  // }

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
  void _onDataChannelMessage(message) {
    print(message.text);
  }

  void _onTrack(RTCTrackEvent event) {
    if (event.track.kind == "video") {
      RTCVideoRenderer val = localRenderer.value;
      val.srcObject = event.streams[0];
      localRenderer.value = val;
      localRenderer.trigger(val);
    }
  }

  void _onDataChannelState(RTCDataChannelState? state) {
    switch (state) {
      case RTCDataChannelState.RTCDataChannelClosed:
        print("Camera Closed!!!!!!!");
        break;
      case RTCDataChannelState.RTCDataChannelOpen:
        print("Camera Opened!!!!!!!");
        break;
      default:
        print("Data Channel State: $state");
    }
  }

  Future<bool> _waitForGatheringComplete(int count) async {
    if (peerConnection!.iceGatheringState == RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return true;
    } else if (count >= GATHERING_RETRY_THRESHOLD) {
      return false;
    } else {
      count++;
      await Future.delayed(Duration(seconds: 1));
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
          if (!success) {
            await stopCall();
            return _showReconnectDialog('Connection timed out', roverId);
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
              _showReconnectDialog('Failed to comunicate with rover', roverId);
            }
          } catch (e) {
            stopCall();
            _showReconnectDialog('$e', roverId);
          }
        });
  }

  _showReconnectDialog(
    String error,
    String roverId,
  ) {
    get_pkg.Get.dialog(AlertDialog(
      title: const Text('Failed Connection'),
      content: Text('$error'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              makeCall(roverId);
              get_pkg.Get.back();
            },
            child: Text('Reconnect?')),
        TextButton(
            onPressed: () {
              get_pkg.Get.back();
              get_pkg.Get.offAll(() => HomePage());
            },
            child: Text('Home page'))
      ],
    ));
  }

//public Commands
  notificationsFromWebRTC(String roverId, context, Function() makeCallReconnect) {
    peerConnectionState.listen((cs) {
      switch (cs) {
        case RTCPeerConnectionState.RTCPeerConnectionStateFailed:
        case RTCPeerConnectionState.RTCPeerConnectionStateClosed:
        case RTCPeerConnectionState.RTCPeerConnectionStateDisconnected:
          stopCall();
          _showReconnectDialog('Connection Failed', roverId);
          break;
        case RTCPeerConnectionState.RTCPeerConnectionStateNew:
        case RTCPeerConnectionState.RTCPeerConnectionStateConnected:
          Fluttertoast.showToast(
            msg: "Connected",
          );
          break;
        case RTCPeerConnectionState.RTCPeerConnectionStateConnecting:
          Fluttertoast.showToast(
            msg: "Connecting",
          );
          break;
        case null:
          //most times this case is here when loading or connecting
          break;
      }
    });

    switch (dataChannelState.value) {
      case RTCDataChannelState.RTCDataChannelClosing:
      case RTCDataChannelState.RTCDataChannelClosed:
        _showReconnectDialog('Connection Failed', roverId);
        break;
      case RTCDataChannelState.RTCDataChannelConnecting:
        return Fluttertoast.showToast(
          msg: "Connection",
        );

      case RTCDataChannelState.RTCDataChannelOpen:
        return Fluttertoast.showToast(
          msg: "Connected",
        );
      case null:
        break;
    }
  }

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
      final mediaConstraints = <String, dynamic>{
        'audio': false,
        'video': {
          // 'facingMode': 'user',
          'facingMode': 'environment',
          'optional': [],
        }
      };

      var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      // _mediaDevicesList = await navigator.mediaDevices.enumerateDevices();
      _localStream = stream;
      // localRenderer.srcObject = _localStream;

      stream.getTracks().forEach((element) {
        peerConnection!.addTrack(element, stream);
      });
      await _negotiateRemoteConnection(roverId);
    } catch (e) {
      _showReconnectDialog(e.toString(), roverId);
    }
  }

  Future<void> stopCall() async {
    await _dataChannel?.close();
    await peerConnection?.close();
    peerConnection = null;
    RTCVideoRenderer val = localRenderer.value;
    val.srcObject = null;
    localRenderer.value = val;
  }

  // sendGeneralCommand(String messageText) {
  //   if (_dataChannel != null) {
  //     _dataChannel!.send(RTCDataChannelMessage(messageText));
  //   }
  // }
//joystick

  startJoystickUpdates() {
    //put in stream
    joystickPublish.value = JoystickValue(0, 0, DateTime.now());

    timerJoy = Timer.periodic(
      const Duration(milliseconds: 110),
      (Timer t) {
        if (useGamepad.value) return;
        JoystickValue joyVal = joystickPublish.value;
        DateTime currentTime = DateTime.now();
        DateTime prevMessTime = joyVal.ts;
        if (currentTime.subtract(const Duration(milliseconds: 110)).isBefore(prevMessTime)) {
          sendRoverCommand(RoverDrivetrainCommands.drivetrainCommand(RoverCommandTypeDrivetrain.arcade, joyVal.x, joyVal.y));
        } else {
          sendRoverCommand(RoverDrivetrainCommands.drivetrainCommand(RoverCommandTypeDrivetrain.arcade, 0, 0));
        }
      },
    );
    gamepadController.setJoystickListener();
    gamepadController.drivetrainCommandStream.listen((value) {
      if (!useGamepad.value) return;
      sendRoverCommand(value);
    });
  }

  // sendJoystick(double x, double y) {
  //   if (peerConnection?.connectionState == RTCPeerConnectionState.RTCPeerConnectionStateConnected &&
  //       _dataChannel?.state == RTCDataChannelState.RTCDataChannelOpen) {
  //     if (_dataChannel != null) {
  //       if (_dataChannel != null) {
  //         String messageText = json.encode({
  //           "joystick_x": x,
  //           "joystick_y": y,
  //         });
  //         _dataChannel!.send(RTCDataChannelMessage(messageText));
  //       }
  //     }
  //   }
  // }
}
