import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:http/http.dart' as http;
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/services/mirv_api.dart';

class JoystickValue extends Observable {
  final double x;
  final double y;
  final DateTime ts;

  JoystickValue(this.x, this.y, this.ts);
}

class WebRTCConnection {
  BehaviorSubject<String> recievedCommands = new BehaviorSubject<String>();
  MirvApi mirvApi = MirvApi();
  RTCPeerConnection? _peerConnection;
  get_pkg.Rx<RTCVideoRenderer> localRenderer = get_pkg.Rx<RTCVideoRenderer>(RTCVideoRenderer());

  MediaStream? _localStream;

  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;
  String transformType = "none";
  var messageBoxController = TextEditingController();

  // MediaStream? _localStream;
  bool inCalling = false;
  bool isWorking = true;
  DateTime? _timeStart;
  double prevX = 0;
  double prevY = 0;
  bool loading = false;

  DateTime lastSendTime = DateTime.now();

  Timer? timerJoy;

  final joystickStream = BehaviorSubject<List<double>>();

  final joystickPublish = <JoystickValue>[].obs;

  WebRTCConnection() {
    init();
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

  void toggleCamera() async {
    if (_localStream == null) throw Exception('Stream is not initialized');

    final videoTrack = _localStream!.getVideoTracks().firstWhere((track) => track.kind == 'video');
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

  Future<bool> _waitForGatheringComplete(_) async {
    print("WAITING FOR GATHERING COMPLETE");
    if (_peerConnection!.iceGatheringState == RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return true;
    } else {
      await Future.delayed(Duration(seconds: 1));
      return await _waitForGatheringComplete(_);
    }
  }

  Future<void> _negotiateRemoteConnection() async {
    return _peerConnection!
        .createOffer(offerOptions)
        .then((offer) {
          return _peerConnection!.setLocalDescription(offer);
        })
        .then(_waitForGatheringComplete)
        .then((_) async {
          var des = await _peerConnection!.getLocalDescription();
          var headers = {
            'Content-Type': 'application/json',
          };
          var request = http.Request(
            'POST',
            Uri.parse('${mirvApi.ipAdress}/rovers/connect'), // CHANGE URL HERE TO LOCAL SERVER
          );
          request.body = json.encode({
            "connection_id": "string",
            "rover_id": "rover_7",
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
            print(data);
            var dataMap = json.decode(data);
            var answerMap = json.decode(dataMap["answer"]);
            await _peerConnection!.setRemoteDescription(
              RTCSessionDescription(
                answerMap["sdp"],
                answerMap["type"],
              ),
            );
          } else {
            print(response.reasonPhrase);
            isWorking = false;
            print(
                "------------------------------------------------------------- \n Uh Oh! something went wrong and you couldn't connect to the rover! \n ------------------------------------------------------------");
          }
        });
  }
//public Commands

  Future<void> makeCall() async {
    setStateInFunction(function: () {
      loading = true;
    });
    var configuration = <String, dynamic>{
      'sdpSemantics': 'unified-plan',
      "iceServers": [
        {"url": "stun:stun.l.google.com:19302"},
      ]
    };
    //* Create Peer Connection
    if (_peerConnection != null) return;
    _peerConnection = await createPeerConnection(configuration, offerSdpConstraints);

    _peerConnection!.onTrack = _onTrack;
    //* Create Data Channel
    _dataChannelDict = RTCDataChannelInit();
    _dataChannelDict!.ordered = true;
    _dataChannel = await _peerConnection!.createDataChannel(
      "chat",
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
    try {
      var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      // _mediaDevicesList = await navigator.mediaDevices.enumerateDevices();
      _localStream = stream;
      // localRenderer.srcObject = _localStream;

      stream.getTracks().forEach((element) {
        _peerConnection!.addTrack(element, stream);
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
      await _peerConnection?.close();
      _peerConnection = null;
      RTCVideoRenderer val = localRenderer.value;
      val.srcObject = null;
      localRenderer.value = val;
    } catch (e) {
      print(e.toString());
    }
    setStateInFunction(function: () {
      inCalling = false;
    });
  }

  sendCommand(String command, String typeCommand) {
    if (_dataChannel != null) {
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
      Duration(milliseconds: 115),
      (Timer t) {
        JoystickValue joyVal = joystickPublish.value[0];
        DateTime currentTime = DateTime.now();
        DateTime prevMessTime = joyVal.ts;
        if (currentTime.subtract(Duration(milliseconds: 110)).isBefore(prevMessTime)) {
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
    if (_dataChannel != null) {
      String messageText = json.encode({
        "joystick_x": x,
        "joystick_y": y,
      });
      _dataChannel!.send(RTCDataChannelMessage(messageText));
    }
  }
}
