import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/pi_lit.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/operation_map_video.dart';
import 'package:get/get.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/center_panel.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/left_side_buttons.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/right_side_buttons.dart';

import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/webrtc_connection.dart';

class MapSelectionController extends GetxController {
  Rx<bool> showMap = false.obs;
}

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  RxList<RoverMetrics> roverList = <RoverMetrics>[].obs;
  final MirvApi _mirvApi = MirvApi();
  final mapSelectionController = Get.put(MapSelectionController());
  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(new LatLng(40.474019558671344, -104.96957447379826));
  final List<PiLit> piLitMarkers = [
    PiLit(id: 'piLit1', description: 'Pi-lit device', location: new LatLng(40.47399235127373, -104.96957682073116)),
    PiLit(id: 'piLit2', description: 'Pi-lit device', location: new LatLng(40.474025762131475, -104.9695798382163)),
    PiLit(id: 'piLit3', description: 'Pi-lit device', location: new LatLng(40.47405381703737, -104.96958520263433)),
    PiLit(id: 'piLit4', description: 'Pi-lit device', location: new LatLng(40.47408365724258, -104.96959090232849))
  ];
  final RoverMetrics roverMetrics = RoverMetrics();
  final WebRTCConnection webRTCConnection = WebRTCConnection();
  Rx<bool> useGamepad = false.obs;

  @override
  void initState() {
    super.initState();
    _mirvApi.startPeriodicMetricUpdates();
    webRTCConnection.makeCall();
    webRTCConnection.startJoystickUpdates();
  }

  @override
  void dispose() {
    super.dispose();
    _mirvApi.stopPeriodicMetricUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpPgAppBar(
        periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
        roverMetrics: roverMetrics,
        stopCall: webRTCConnection.stopCall,
      ),
      endDrawer: Drawer(
        child: StreamBuilder<RoverMetrics>(
            stream: _mirvApi.periodicMetricUpdates,
            builder: (context, snapshot) {
              return CommandList(
                roverMetrics: snapshot.data,
                sendCommand: webRTCConnection.sendCommand,
              );
            }),
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: 200,
                child: LeftSideButtons(
                    roverMetrics: roverMetrics,
                    sendGeneralCommand: webRTCConnection.sendGeneralCommand,
                    periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                    sendCommand: webRTCConnection.sendCommand,
                    mapSelectionController: mapSelectionController)),
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
                sendCommand: webRTCConnection.sendCommand,
                makeCall: webRTCConnection.makeCall,
                stopCall: webRTCConnection.stopCall,
                joystickPublish: webRTCConnection.joystickPublish,
                periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                startJoystickUpdates: webRTCConnection.startJoystickUpdates,
                useGamepad: useGamepad,
              ))
        ],
      ),
    );
  }
}
