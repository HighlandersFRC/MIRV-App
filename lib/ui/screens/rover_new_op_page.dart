import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/services/gamepad_controller.dart';
import 'package:mirv/services/joystick_controller.dart';
import 'package:rxdart/subjects.dart';
import 'package:observable/observable.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/center_panel.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/left_side_buttons.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/right_side_buttons.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/webrtc_connection.dart';

class JoystickValue extends Observable {
  final double x;
  final double y;
  final DateTime ts;

  JoystickValue(this.x, this.y, this.ts);
}

class MapSelectionController extends GetxController {
  Rx<bool> showMap = false.obs;
}

class RoverOpPage extends StatefulWidget {
  const RoverOpPage(this.roverMetrics, {Key? key}) : super(key: key);
  final RoverMetrics roverMetrics;

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  final MirvApi _mirvApi = MirvApi();
  String transformType = "none";
  var messageBoxController = TextEditingController();
  final mapSelectionController = Get.put(MapSelectionController());
  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));
  final List<PiLit> piLitMarkers = [
    const PiLit(id: 'piLit1', description: 'Pi-lit device', location: LatLng(40.47399235127373, -104.96957682073116)),
    const PiLit(id: 'piLit2', description: 'Pi-lit device', location: LatLng(40.474025762131475, -104.9695798382163)),
    const PiLit(id: 'piLit3', description: 'Pi-lit device', location: LatLng(40.47405381703737, -104.96958520263433)),
    const PiLit(id: 'piLit4', description: 'Pi-lit device', location: LatLng(40.47408365724258, -104.96959090232849))
  ];

  final WebRTCConnection webRTCConnection = WebRTCConnection(RoverMetrics());
  bool _inCalling = false;
  bool isWorking = true;
  DateTime? _timeStart;
  double prevX = 0;
  double prevY = 0;
  bool _loading = false;
  DateTime lastSendTime = DateTime.now();

  final roverCommandStream = BehaviorSubject<RoverCommand>();
  final gamepadStream = BehaviorSubject<List<double>>();

  @override
  void initState() {
    super.initState();
    _mirvApi.startPeriodicMetricUpdates(widget.roverMetrics.roverId);

    startWebRTCCall();
    webRTCConnection.startJoystickUpdates();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _mirvApi.stopPeriodicMetricUpdates();
  }

  void startWebRTCCall() {
    webRTCConnection.makeCall(widget.roverMetrics.roverId);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    webRTCConnection.notificationsFromWebRTC(widget.roverMetrics.roverId, context, startWebRTCCall);
    return Scaffold(
      appBar: OpPgAppBar(
        // periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
        roverMetrics: widget.roverMetrics,
        stopCall: webRTCConnection.stopCall,
        peerConnectionState: webRTCConnection.peerConnectionState,
      ),
      body: Scrollbar(
        child: Stack(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                      child: LeftSideButtons(
                    width: width / 4,
                    height: height - 150,
                    roverMetrics: widget.roverMetrics,
                    periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                    sendCommand: webRTCConnection.sendRoverCommand,
                    onJoystickChanged: webRTCConnection.onJoystickChanged,
                    mapSelectionController: mapSelectionController,
                    mirvApi: _mirvApi,
                  )),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Obx(() => CenterPanel(
                          width: width / 2,
                          height: height - 150,
                          localRenderer: webRTCConnection.localRenderer.value,
                          locationStream: locationStream,
                          periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                          piLitMarkers: piLitMarkers,
                          selectedRoverMetrics: widget.roverMetrics,
                          showMap: mapSelectionController.showMap.value,
                        ))),
                Align(
                    alignment: Alignment.bottomRight,
                    child: RightSideButtons(
                      width: width / 4,
                      height: height - 150,
                      roverMetrics: widget.roverMetrics,
                      sendCommand: webRTCConnection.sendRoverCommand,
                      makeCall: startWebRTCCall,
                      stopCall: webRTCConnection.stopCall,
                      onJoystickChanged: webRTCConnection.onJoystickChanged,
                      periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                      useGamepad: webRTCConnection.useGamepad,
                    ))
              ],
            ),
            Obx(() => webRTCConnection.loading.value
                ? Expanded(
                    child: Container(color: Color.fromRGBO(51, 53, 42, 42), child: Center(child: CircularProgressIndicator())))
                : SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
