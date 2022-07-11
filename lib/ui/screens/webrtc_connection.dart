import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:http/http.dart' as http;
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/home_page.dart';

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
  get_pkg.Rx<RTCDataChannelState?> dataChannelState =
      get_pkg.Rx<RTCDataChannelState?>(null);

  get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState =
      get_pkg.Rx<RTCPeerConnectionState?>(null);

  get_pkg.Rx<RTCVideoRenderer> localRenderer =
      get_pkg.Rx<RTCVideoRenderer>(RTCVideoRenderer());

  MediaStream? _localStream;

  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;
  String transformType = "none";
  var messageBoxController = TextEditingController();

  // MediaStream? _localStream;
  bool inCalling = false;
  double prevX = 0;
  double prevY = 0;
  get_pkg.Rx<bool> loading = false.obs;

  DateTime lastSendTime = DateTime.now();

  Timer? timerJoy;

  final joystickStream = BehaviorSubject<List<double>>();

  final joystickPublish = <JoystickValue>[].obs;

  int GATHERING_RETRY_THRESHOLD = 90; //seconds

  WebRTCConnection() {
    init();
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      print('peerConnectionState: ${peerConnection?.connectionState}');
      peerConnectionState.value = peerConnection?.connectionState;
    });
  }

  Future<void> init() async {
    RTCVideoRenderer val = localRenderer.value;
    await val.initialize();
    localRenderer.value = val;
    // await makeCall();
    // await startJoystickUpdates();
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
        print(message.text);
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
    print("WAITING FOR GATHERING COMPLETE");

    if (peerConnection!.iceGatheringState ==
        RTCIceGatheringState.RTCIceGatheringStateComplete) {
      print('connect :111 $peerConnection');

      return true;
    } else if (count >= GATHERING_RETRY_THRESHOLD) {
      return false;
    } else {
      count++;
      print('retry gather count $count');
      print('connect :222 $peerConnection');
      await Future.delayed(Duration(seconds: 1));
      return await _waitForGatheringComplete(count);
    }
  }

  Future<void> _negotiateRemoteConnection(String roverId) async {
    return peerConnection!
        .createOffer(offerOptions)
        .then((offer) {
          print('connect :444 $peerConnection');
          return peerConnection!.setLocalDescription(offer);
        })
        .then((_) => _waitForGatheringComplete(0))
        .then((success) async {
          print('connect :555 $peerConnection');

          if (!success) {
            await stopCall();
            return _showReconnectDialog('Connection timed out', roverId);
          }

          try {
            var des = await peerConnection!.getLocalDescription();
            print('connect :666 $peerConnection');

            var headers = {
              'Content-Type': 'application/json',
            };
            var request = http.Request(
              'POST',
              Uri.parse(
                  '${mirvApi.ipAdress}/rovers/connect'), // CHANGE URL HERE TO LOCAL SERVER
            );
            print('des $des');
            request.body = json.encode({
              "connection_id": "string",
              "rover_id": roverId,
              "offer": {
                "sdp": des!.sdp,
                "type": des.type,
                "video_transform": transformType,
              }
            });
            request.headers.addAll(headers);

            http.StreamedResponse response = await request.send();

            String data = "";
            if (response.statusCode == 200) {
              data = await response.stream.bytesToString();

              var dataMap = json.decode(data);
              var answerMap = json.decode(dataMap["answer"]);
              print('connect :777 $peerConnection');
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
              get_pkg.Get.offAll(HomePage());
            },
            child: Text('Home page'))
      ],
    ));
  }

//public Commands
  notificationsFromWebRTC(
      String roverId, context, Function() makeCallReconnect) {
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
      print('sting');
      print('roverId: $roverId');
      if (peerConnection != null) return;
      peerConnection =
          await createPeerConnection(configuration, offerSdpConstraints);
      print('connect :999 $peerConnection');
      peerConnection!.onTrack = _onTrack;
      print('connect :101010 $peerConnection');
      peerConnection!.onDataChannel = _onDataChannel;
      print('connect :11111 $peerConnection');
      //* Create Data Channel
      _dataChannelDict = RTCDataChannelInit();
      _dataChannelDict!.ordered = true;
      print('connect :121212 $peerConnection');
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
        print('connect :131313 $peerConnection');
        peerConnection!.addTrack(element, stream);
        print('connect :141414 $peerConnection');
      });
      await _negotiateRemoteConnection(roverId);
    } catch (e) {
      print('connect : ${e.toString()}');
      _showReconnectDialog(e.toString(), roverId);
    }
  }

  Future<void> stopCall() async {
    try {
      print('connect : STOP');
      await _dataChannel?.close();
      await peerConnection?.close();
      peerConnection = null;
      RTCVideoRenderer val = localRenderer.value;
      val.srcObject = null;
      localRenderer.value = val;
      // peerConnection = null;
      // RTCVideoRenderer val = localRenderer.value;
      // val.srcObject = null;
      // localRenderer.value.srcObject = null;
    } catch (e) {
      print(e.toString());
    }
    setStateInFunction(function: () {
      inCalling = false;
    });
  }

  sendCommand(String command, String typeCommand) {
    if (peerConnection?.connectionState ==
            RTCPeerConnectionState.RTCPeerConnectionStateConnected &&
        _dataChannel?.state == RTCDataChannelState.RTCDataChannelOpen) {
      String messageText = json.encode({
        "$typeCommand": command,
      });
      _dataChannel!.send(RTCDataChannelMessage(messageText));
    }
  }

  sendGeneralCommand(String messageText) {
    if (_dataChannel != null) {
      _dataChannel!.send(RTCDataChannelMessage(messageText));
    }
  }
//joystick

  startJoystickUpdates() {
    //put in stream
    joystickPublish.value = ([JoystickValue(0, 0, DateTime.now())]);

    timerJoy = Timer.periodic(
      const Duration(milliseconds: 115),
      (Timer t) {
        JoystickValue joyVal = joystickPublish.value[0];
        DateTime currentTime = DateTime.now();
        DateTime prevMessTime = joyVal.ts;
        if (currentTime
            .subtract(const Duration(milliseconds: 110))
            .isBefore(prevMessTime)) {
          joystickStream.add([joyVal.x, joyVal.y]);
        } else {
          joystickStream.add([0.0, 0.0]);
        }
      },
    );

    //send to rover
    joystickStream.listen(
      (value) {
        sendJoystick(value[0], value[1]);
      },
    );
  }

  sendJoystick(double x, double y) {
    if (peerConnection?.connectionState ==
            RTCPeerConnectionState.RTCPeerConnectionStateConnected &&
        _dataChannel?.state == RTCDataChannelState.RTCDataChannelOpen) {
      if (_dataChannel != null) {
        print(".                                    .");
        print(
            "------------------------- \n $x   $y \n-------------------------");
        print(".                                    .");
        if (_dataChannel != null) {
          String messageText = json.encode({
            "joystick_x": x,
            "joystick_y": y,
          });
          _dataChannel!.send(RTCDataChannelMessage(messageText));
        }
      }
    }
  }
}
