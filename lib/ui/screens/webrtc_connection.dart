import 'dart:convert';
import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:http/http.dart' as http;
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/home_page.dart';

class JoystickValue extends Observable {
  final double x;
  final double y;
  final DateTime ts;

  JoystickValue(this.x, this.y, this.ts);
}

class WebRTCConnection {
  BehaviorSubject<String> recievedCommands = new BehaviorSubject<String>();
  MirvApi mirvApi = MirvApi();
  RTCPeerConnection? peerConnection;
  get_pkg.Rx<RTCDataChannelState?> _dataConnectionState =
      get_pkg.Rx<RTCDataChannelState?>(null);

  get_pkg.Rx<RTCPeerConnectionState?> _peerChanelState =
      get_pkg.Rx<RTCPeerConnectionState?>(null);

  final localRenderer = RTCVideoRenderer();

  MediaStream? _localStream;

  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;
  String transformType = "none";
  var messageBoxController = TextEditingController();

  // MediaStream? _localStream;
  bool inCalling = false;
  DateTime? _timeStart;
  double prevX = 0;
  double prevY = 0;
  get_pkg.Rx<bool> loading = false.obs;

  DateTime lastSendTime = DateTime.now();

  Timer? timerJoy;

  final joystickStream = BehaviorSubject<List<double>>();

  final joystickPublish = <JoystickValue>[].obs;

  void setStateInFunction({required Function function}) {
    function;
  }

  void toggleCamera() async {
    if (_localStream == null) throw Exception('Stream is not initialized');

    final videoTrack = _localStream!
        .getVideoTracks()
        .firstWhere((track) => track.kind == 'video');
    await Helper.switchCamera(videoTrack);
  }

  final Map<String, dynamic> offerSdpConstraints = {
    "mandatory": {
      "OfferToReceiveAudio": true,
      "OfferToReceiveVideo": true,
    },
    "optional": [],
  };

  final Map<String, dynamic> offerOptions = {"offerToReceiveVideo": true};

  void _onTrack(RTCTrackEvent event) {
    print("TRACK EVENT: ${event.streams.map((e) => e.id)}, ${event.track.id}");
    if (event.track.kind == "video") {
      print("HERE");
      localRenderer.srcObject = event.streams[0];
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

  Future<bool> _waitForGatheringComplete(_) async {
    print("WAITING FOR GATHERING COMPLETE");
    if (peerConnection!.iceGatheringState ==
        RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return true;
    } else {
      await Future.delayed(Duration(seconds: 1));
      return await _waitForGatheringComplete(_);
    }
  }

  Future<void> _negotiateRemoteConnection() async {
    return peerConnection!
        .createOffer(offerOptions)
        .then((offer) {
          return peerConnection!.setLocalDescription(offer);
        })
        .then(_waitForGatheringComplete)
        .then((_) async {
          var des = await peerConnection!.getLocalDescription();
          var headers = {
            'Content-Type': 'application/json',
          };
          var request = http.Request(
            'POST',
            Uri.parse(
                '${mirvApi.ipAdress}/rovers/connect'), // CHANGE URL HERE TO LOCAL SERVER
          );
          request.body = json.encode({
            "connection_id": "string",
            "rover_id": "rover_6",
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
            await peerConnection!.setRemoteDescription(
              RTCSessionDescription(
                answerMap["sdp"],
                answerMap["type"],
              ),
            );

            loading.value = false;
          } else {
            loading.value = false;
          }
        });
  }

//public Commands
//   notificationsFromWebRTC(context) {
// // if (isWorking==false) {
// //  return return showDialog(
// //           barrierDismissible: false,
// //           context: context,
// //           builder: (BuildContext context) {
// //             return AlertDialog(
// //               title: const Text('Failed Connection'),
// //               content: Text(
// //                   'Would you like to try to reconnect or go to the home page?'),
// //               actions: <Widget>[
// //                 TextButton(
// //                     onPressed: () {
// //                       makeCall();
// //                       return Navigator.pop(context);
// //                     },
// //                     child: Text('reconnect?')),
// //                 TextButton(
// //                     onPressed: () {
// //                       stopCall();
// //                       Navigator.pop(context);
// //                       get_pkg.Get.offAll(HomePage());
// //                     },
// //                     child: Text('home page'))
// //               ],
// //             );
// //           },
// //         );
// // }

//     switch (_peerConnectionState) {
//       case RTCPeerConnectionState.RTCPeerConnectionStateFailed:
//       case RTCPeerConnectionState.RTCPeerConnectionStateClosed:
//       case RTCPeerConnectionState.RTCPeerConnectionStateDisconnected:
//         return showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Failed Connection'),
//               content: Text(
//                   'Would you like to try to reconnect or go to the home page?'),
//               actions: <Widget>[
//                 TextButton(
//                     onPressed: () {
//                       makeCall();
//                       return Navigator.pop(context);
//                     },
//                     child: Text('reconnect?')),
//                 TextButton(
//                     onPressed: () {
//                       stopCall();
//                       Navigator.pop(context);
//                       get_pkg.Get.offAll(HomePage());
//                     },
//                     child: Text('home page'))
//               ],
//             );
//           },
//         );
//       case RTCPeerConnectionState.RTCPeerConnectionStateNew:
//       case RTCPeerConnectionState.RTCPeerConnectionStateConnected:
//         return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("Connected"),
//         ));

//       case RTCPeerConnectionState.RTCPeerConnectionStateConnecting:
//         return CircularProgressIndicator();
//       case null:
//         return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("null"),
//         ));
//     }

//     switch (_dataChanelState) {
//       case RTCDataChannelState.RTCPeerConnectionStateFailed:
//       case RTCDataChannelState.RTCPeerConnectionStateClosed:
//       case RTCDataChannelState.RTCPeerConnectionStateDisconnected:
//         return showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Failed Connection'),
//               content: Text(
//                   'Would you like to try to reconnect or go to the home page?'),
//               actions: <Widget>[
//                 TextButton(
//                     onPressed: () {
//                       makeCall();
//                       return Navigator.pop(context);
//                     },
//                     child: Text('reconnect?')),
//                 TextButton(
//                     onPressed: () {
//                       stopCall();
//                       Navigator.pop(context);
//                       get_pkg.Get.offAll(HomePage());
//                     },
//                     child: Text('home page'))
//               ],
//             );
//           },
//         );
//       case RTCDataChannelState.RTCPeerConnectionStateNew:
//       case RTCDataChannelState.RTCPeerConnectionStateConnected:
//         return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("Connected"),
//         ));

//       case RTCDataChannelState.RTCPeerConnectionStateConnecting:
//         return CircularProgressIndicator();
//       case null:
//         return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("null"),
//         ));
//     }
//   }

  Future<void> makeCall() async {
    loading.value = true;

    var configuration = <String, dynamic>{
      'sdpSemantics': 'unified-plan',
      "iceServers": [
        {"url": "stun:stun.l.google.com:19302"},
      ]
    };
    print("print stament 11111111111111");
    //* Create Peer Connection
    if (peerConnection != null) return;
    peerConnection =
        await createPeerConnection(configuration, offerSdpConstraints);

    peerConnection!.onTrack = _onTrack;
    print("2222222222222222222");
    //* Create Data Channel
    _dataChannelDict = RTCDataChannelInit();
    _dataChannelDict!.ordered = true;
    _dataChannel = await peerConnection!.createDataChannel(
      "chat",
      _dataChannelDict!,
    );
    _dataChannel!.onDataChannelState = _onDataChannelState;
    print("3333333333333333333");
    final mediaConstraints = <String, dynamic>{
      'audio': false,
      'video': {
        // 'facingMode': 'user',
        'facingMode': 'environment',
        'optional': [],
      }
    };
    try {
      var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      // _mediaDevicesList = await navigator.mediaDevices.enumerateDevices();
      _localStream = stream;
      // _localRenderer.srcObject = _localStream;

      stream.getTracks().forEach((element) {
        peerConnection!.addTrack(element, stream);
      });
      print("NEGOTIATE");
      await _negotiateRemoteConnection();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> stopCall() async {
    print("stop1111stop111stop1111stop111");
    try {
      await _dataChannel?.close();
      await peerConnection?.close();
      peerConnection = null;
      localRenderer.srcObject = null;
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
      print(".                                    .");
      print(
          "------------------------- \n $typeCommand: $command \n-------------------------");
      print(".                                    .");
      if (_dataChannel != null) {
        String messageText = json.encode({
          "$typeCommand": command,
        });
        _dataChannel!.send(RTCDataChannelMessage(messageText));
      }
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
      Duration(milliseconds: 115),
      (Timer t) {
        JoystickValue joyVal = joystickPublish.value[0];
        DateTime currentTime = DateTime.now();
        DateTime prevMessTime = joyVal.ts;
        if (currentTime
            .subtract(Duration(milliseconds: 110))
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
