import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:observable/observable.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/left_side_buttons.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/navigation_drawer.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/right_side_buttons.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:http/http.dart' as http;
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/telemetry_data_table.dart';

class JoystickValue extends Observable {
  final double x;
  final double y;
  final DateTime ts;

  JoystickValue(this.x, this.y, this.ts);
}

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  final MirvApi _mirvApi = MirvApi();
  RTCPeerConnection? _peerConnection;
  final _localRenderer = RTCVideoRenderer();

  MediaStream? _localStream;

  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;
  String transformType = "none";
  var messageBoxController = TextEditingController();

  // MediaStream? _localStream;
  bool _inCalling = false;
  bool isWorking = true;
  DateTime? _timeStart;
  double prevX = 0;
  double prevY = 0;
  bool _loading = false;
  DateTime lastSendTime = DateTime.now();

  Timer? timerJoy;

  final joystickStream = BehaviorSubject<List<double>>();

  final joystickPublish = <JoystickValue>[].obs;

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
      _localRenderer.srcObject = event.streams[0];
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
    if (_peerConnection!.iceGatheringState ==
        RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return true;
    } else {
      await Future.delayed(Duration(seconds: 1));
      return await _waitForGatheringComplete(_);
    }
  }

  void _toggleCamera() async {
    if (_localStream == null) throw Exception('Stream is not initialized');

    final videoTrack = _localStream!
        .getVideoTracks()
        .firstWhere((track) => track.kind == 'video');
    await Helper.switchCamera(videoTrack);
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
            Uri.parse(
                'http://44.202.152.178:8000/rovers/connect'), // CHANGE URL HERE TO LOCAL SERVER
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

  Future<void> _makeCall() async {
    setState(() {
      _loading = true;
    });
    var configuration = <String, dynamic>{
      'sdpSemantics': 'unified-plan',
      "iceServers": [
        {"url": "stun:stun.l.google.com:19302"},
      ]
    };
    print("print stament 11111111111111");
    //* Create Peer Connection
    if (_peerConnection != null) return;
    _peerConnection =
        await createPeerConnection(configuration, offerSdpConstraints);

    _peerConnection!.onTrack = _onTrack;
    print("2222222222222222222");
    //* Create Data Channel
    _dataChannelDict = RTCDataChannelInit();
    _dataChannelDict!.ordered = true;
    _dataChannel = await _peerConnection!.createDataChannel(
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
        _peerConnection!.addTrack(element, stream);
      });
      print("NEGOTIATE");
      await _negotiateRemoteConnection();
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) return;
    print("44444444444444444444444");
    setState(() {
      _inCalling = true;
      _loading = false;
    });
    print("55555555555555555");
  }

  Future<void> _stopCall() async {
    print("stop1111stop111stop1111stop111");
    try {
      await _dataChannel?.close();
      await _peerConnection?.close();
      _peerConnection = null;
      _localRenderer.srcObject = null;
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      _inCalling = false;
    });
  }

  Future<void> initLocalRenderers() async {
    await _localRenderer.initialize();
  }

  @override
  void initState() {
    super.initState();

    _mirvApi.startPeriodicMetricUpdates();
    initLocalRenderers();
    _makeCall();
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

    joystickStream.listen(
      (value) {
        sendJoystick(value[0], value[1]);
      },
    );
  }

  sendJoystick(double x, double y) {
    print(".                                    .");
    print("------------------------- \n $x   $y \n-------------------------");
    print(".                                    .");
    if (_dataChannel != null) {
      String messageText = json.encode({
        "joystick_x": x,
        "joystick_y": y,
      });
      _dataChannel!.send(RTCDataChannelMessage(messageText));
    }
  }

  sendCommand(String command, String typeCommand) {
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

  roverConnect() {
    print("you have pressed the connection button");
    _makeCall();
  }

  RoverMetrics roverMetrics = const RoverMetrics();

  @override
  void dispose() {
    super.dispose();
    _mirvApi.stopPeriodicMetricUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpPgAppBar(
        mirvApi: _mirvApi,
        roverMetrics: roverMetrics,
      ),
      endDrawer: Drawer(
        child: StreamBuilder<RoverMetrics>(
            stream: _mirvApi.periodicMetricUpdates,
            builder: (context, snapshot) {
              return CommandList(
                  roverMetrics: snapshot.data, sendCommand: sendCommand);
            }),
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: 200,
                child: LeftSideButtons(
                    mirvApi: _mirvApi,
                    roverMetrics: roverMetrics,
                    dataChannel: _dataChannel,
                    sendCommand: sendCommand)),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  color: Colors.amber,
                  width: 800,
                  height: 450,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            color: Colors.black,
                            child: _loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 4,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                        Positioned.fill(
                          child: RTCVideoView(
                            _localRenderer,
                            // mirror: true,
                          ),
                        ),
                        _inCalling
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: _toggleCamera,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.black26,
                                    child: Center(
                                      child: Icon(
                                        Icons.cameraswitch,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                StreamBuilder<RoverMetrics>(
                    stream: _mirvApi.periodicMetricUpdates,
                    builder: (context, snapshot) {
                      return Container(
                          child: snapshot.data != null
                              ? TelemeteryDataTable(
                                  roverMetrics: snapshot.data!.telemetry)
                              : Text('Waiting on data'));
                    }),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: RightSideButtons(
                  roverMetrics: roverMetrics,
                  joystickPublish: joystickPublish,
                  sendCommand: sendCommand)),
        ],
      ),
    );
  }
}
