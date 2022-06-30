// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/models/rover_status_type.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/rover_selection_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:test/models/rover_summary.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:http/http.dart' as http;

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
  get_pkg.RxList<RoverSummary> roverList = <RoverSummary>[].obs;
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

  Timer? timer;
  startJoystickUpdates() {
    timer = Timer.periodic(Duration(milliseconds: 110), (Timer t) => doNothing);
  }

  @override
  void initState() {
    super.initState();

    initLocalRenderers();
    _makeCall();
    startJoystickUpdates();
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

  var bLevel = 21;

  Icon _batteryIcon(int batteryLevel, {int? alertLevel}) {
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return const Icon(Icons.battery_alert_rounded);
    }
    switch (result) {
      case 0:
        return const Icon(Icons.battery_0_bar_rounded);
      case 1:
        return const Icon(Icons.battery_1_bar_rounded);
      case 2:
        return const Icon(Icons.battery_2_bar_rounded);
      case 3:
        return const Icon(Icons.battery_3_bar_rounded);
      case 4:
        return const Icon(Icons.battery_4_bar_rounded);
      case 5:
        return const Icon(Icons.battery_5_bar_rounded);
      case 6:
        return const Icon(Icons.battery_6_bar_rounded);
      default:
        return const Icon(Icons.battery_full_rounded);
    }
  }

  Icon _getStatusIcon(RoverStatusType value) {
    switch (value) {
      case RoverStatusType.available:
        return const Icon(Icons.lock_open_rounded);

      case RoverStatusType.unavailable:
        return const Icon(Icons.lock_rounded);
    }
  }

  String getConnectButtonText() {
    if (isWorking == true) {
      return "Connect To Rover";
    } else {
      return "Unable to connect";
    }
  }

  Icon getConnectButtonIcon() {
    if (isWorking == true) {
      return Icon(Icons.wifi_calling_3);
    } else {
      return Icon(Icons.error_outline);
    }
  }

  Color getConnectButtonColor() {
    if (isWorking == true) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  goSelection() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RoverSelectionPage()),
    );
  }

  goStatus() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StatusPage(),
      ),
    );
  }

  goTrouble() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TroubleShootingPage()),
    );
  }

  goHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  goInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InfoPage()),
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

  doNothing() {
    print("he he he ha!");
  }

  roverConnect() {
    print("you have pressed the connection button");
    _makeCall();
  }

  @override
  Widget build(BuildContext context) {
    double _x = 0;
    double _y = 0;
    var step = 10.0;
    final JoystickMode _joystickMode = JoystickMode.all;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
          size: 40,
        ),
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: Text(
          "Rover Manual Control",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1.75,
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: goStatus,
            icon: _batteryIcon(bLevel, alertLevel: 20),
            label: const Text(
              "Status",
              textScaleFactor: 2.5,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10, 7),
                  ),
                ),
              ), //shape
              fixedSize: MaterialStateProperty.all(
                Size(200, 300),
              ), //size
              overlayColor: MaterialStateProperty.all(Colors.amber),
              alignment: Alignment.centerLeft,
              shadowColor: MaterialStateProperty.all(
                const Color.fromARGB(100, 0, 0, 0),
              ), //overlay color
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 128, 123, 123),
              ), //background color
              foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 0, 0, 0),
              ), //foreground color
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 158, 182, 193),
              ),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Icon(
                  Icons.drive_eta_sharp,
                  size: 100,
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goSelection,
                child: const Text(
                  "Go To Selection",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goStatus,
                child: const Text(
                  "Go To Status",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goTrouble,
                child: const Text(
                  "Go To Troubleshooting",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goHome,
                child: const Text(
                  "Go Home",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goInfo,
                child: const Text(
                  "Go To Info",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 175,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_dataChannel != null) {
                          String messageText = "Start Manual Control";
                          _dataChannel!
                              .send(RTCDataChannelMessage(messageText));
                        }
                      },
                      label: const Text(
                        " Manual Control",
                        textScaleFactor: 1.5,
                      ),
                      icon: const Icon(
                        CupertinoIcons.antenna_radiowaves_left_right,
                        size: 60,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 98, 7, 255))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 175,
                    child: ElevatedButton.icon(
                      onPressed: doNothing,
                      label: const Text(
                        "Map",
                        textScaleFactor: 2.5,
                      ),
                      icon: const Icon(
                        Icons.map,
                        size: 60,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 98, 7, 255))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 250,
                    height: 550,
                    child: ListView(
                      children: [
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => sendCommand("disable", "intake"),
                            style: ButtonStyle(),
                            child: Text(
                              "Disable",
                              textScaleFactor: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => sendCommand("reset", "intake"),
                            child: Text(
                              "Reset",
                              textScaleFactor: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => sendCommand("intake", "intake"),
                            style: ButtonStyle(),
                            child: Text(
                              "Intake",
                              textScaleFactor: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => sendCommand("store", "intake"),
                            style: ButtonStyle(),
                            child: Text(
                              "Store",
                              textScaleFactor: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => sendCommand("deposit", "intake"),
                            style: ButtonStyle(),
                            child: Text(
                              "Deposit",
                              textScaleFactor: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () =>
                                sendCommand("switch_left", "intake"),
                            style: ButtonStyle(),
                            child: Text(
                              "Switch Left",
                              textScaleFactor: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () =>
                                sendCommand("switch_right", "intake"),
                            style: ButtonStyle(),
                            child: Text(
                              "Switch Right",
                              textScaleFactor: 1.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
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
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: roverConnect,
                    label: Text(getConnectButtonText()),
                    icon: getConnectButtonIcon(),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(getConnectButtonColor())),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                ),
                SizedBox(
                  height: 150,
                  width: 225,
                  child: ElevatedButton(
                    onPressed: _stopCall,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(getConnectButtonColor())),
                    child: Text("Stop call"),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                ),
                SizedBox(
                  child: Joystick(
                    mode: _joystickMode,
                    listener: (details) {
                      setState(
                        () {
                          _x = details.x;
                          _y = details.y;
                        },
                      );
                      sendJoystick(_x, _y);
                      lastSendTime = DateTime.now();
                      joystickPublish.value = ([
                        JoystickValue(details.x, details.y, DateTime.now())
                      ]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 100,
                ),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () => sendCommand("eStop", "general"),
                    label: const Text("E-STOP"),
                    icon: const Icon(Icons.warning_amber_rounded),
                    style: ButtonStyle(
                        animationDuration: Duration(seconds: 10),
                        overlayColor:
                            MaterialStateProperty.all(Colors.yellowAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 250, 250, 250),
                                width: 10),
                          ),
                        ),
                        shadowColor: MaterialStateProperty.all(
                            Color.fromARGB(0, 0, 0, 0))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
