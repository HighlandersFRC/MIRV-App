import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/services/gamepad_controller.dart';
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
  const RoverOpPage(this.selectedRoverId, {Key? key}) : super(key: key);

  final String selectedRoverId;

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  RxList<RoverMetrics> roverList = <RoverMetrics>[].obs;
  final MirvApi _mirvApi = MirvApi();
  GamepadController gamepadController = GamepadController();
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
  final RoverMetrics roverMetrics = const RoverMetrics();
  final WebRTCConnection webRTCConnection = WebRTCConnection();
bool _inCalling = false;
  bool isWorking = true;
  DateTime? _timeStart;
  double prevX = 0;
  double prevY = 0;
  bool _loading = false;
  DateTime lastSendTime = DateTime.now();

  Timer? timerJoy;
  Timer? timerGamepad;

  final roverCommandStream = BehaviorSubject<RoverCommand>();
  final gamepadStream = BehaviorSubject<List<double>>();

  get_pkg.Rx<JoystickValue> joystickPublish = get_pkg.Rx<JoystickValue>(JoystickValue(0.0, 0.0, DateTime.now()));

  @override
  void initState() {
    super.initState();
    _mirvApi.startPeriodicMetricUpdates(widget.selectedRoverId);
    startWebRTCCall();
    webRTCConnection.startJoystickUpdates();
  }

  @override
  void dispose() {
    super.dispose();
    _mirvApi.stopPeriodicMetricUpdates();
  }

  void startWebRTCCall() {
    webRTCConnection.makeCall(widget.selectedRoverId);
  }

  @override
  Widget build(BuildContext context) {
    webRTCConnection.notificationsFromWebRTC(widget.selectedRoverId, context, startWebRTCCall);
    return Scaffold(
      appBar: OpPgAppBar(
        periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
        roverMetrics: roverMetrics,
        stopCall: webRTCConnection.stopCall,
        peerConnectionState: webRTCConnection.peerConnectionState,
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                    width: 200,
                    child: LeftSideButtons(
                      roverMetrics: roverMetrics,
                      periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                      sendCommand: webRTCConnection.sendRoverCommand,
                      mapSelectionController: mapSelectionController, mirvApi: _mirvApi,
                    )),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Obx(() => CenterPanel(
                      localRenderer: webRTCConnection.localRenderer.value,
                      locationStream: locationStream,
                      periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                      piLitMarkers: piLitMarkers,
                      showMap: mapSelectionController.showMap.value))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: RightSideButtons(
                    roverMetrics: roverMetrics,
                    sendCommand: webRTCConnection.sendRoverCommand,
                    makeCall: startWebRTCCall,
                    stopCall: webRTCConnection.stopCall,
                    joystickPublish: webRTCConnection.joystickPublish,
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
    );
  }
}
