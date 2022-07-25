import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/services/mirv_garage_api.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:mirv/ui/screens/garage-pages/list_garage_commands.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/cancel_auto_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/disable_toggle.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/e_stop_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/joystick_overlay.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry.dart';
import 'package:mirv/ui/screens/webrtc_connection.dart';
import 'package:rxdart/subjects.dart';

class GarageOpPage extends StatelessWidget {
  final GarageMetrics garageMetrics;
  //final RoverMetrics roverMetrics;
  final MirvGarageApi _mirvGarageApi = MirvGarageApi();

  GarageOpPage(this.garageMetrics, {Key? key}) : super(key: key);

  final List<PiLit> piLitMarkers = [
    const PiLit(id: 'piLit1', description: 'Pi-lit device', location: LatLng(40.47399235127373, -104.96957682073116)),
    const PiLit(id: 'piLit2', description: 'Pi-lit device', location: LatLng(40.474025762131475, -104.9695798382163)),
    const PiLit(id: 'piLit3', description: 'Pi-lit device', location: LatLng(40.47405381703737, -104.96958520263433)),
    const PiLit(id: 'piLit4', description: 'Pi-lit device', location: LatLng(40.47408365724258, -104.96959090232849))
  ];
  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));
  late Rx<bool> manualOperation = false.obs;
  final garageCommandStream = BehaviorSubject<GarageCommandList>();
  BehaviorSubject<GarageMetrics> periodicMetricUpdates = BehaviorSubject<GarageMetrics>();

  @override
  Widget build(BuildContext context) {
    // _mirvGarageApi.startPeriodicMetricUpdates(garageMetrics.garageId);
    // _mirvGarageApi.stopPeriodicMetricUpdates();
    _mirvGarageApi.getGarageMetrics(garageMetrics.garageId);

    return Scaffold(
      appBar: AppBar(
          foregroundColor: AppThemeColor.foregroundColor,
          shadowColor: AppThemeColor.shadowColor,
          backgroundColor: AppThemeColor.backgroundColor,
          title: const Text("Garage Operation Page")),

      // OpPgAppBar(
      //   // roverMetrics: webRTCConnection.roverMetricsObs.value,
      //   // stopCall: webRTCConnection.stopCall,
      //   // peerConnectionState: webRTCConnection.peerConnectionState,
      // ),
      body: Stack(
        children: [
          // Expanded(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       color: Colors.grey,
          //     ),
          //     child: RoverOperationMap(
          //       locationStream: locationStream,
          //       piLitMarkers: piLitMarkers,
          //       selectedRoverMetrics: roverMetrics,
          //     ),
          //   ),
          // ),
          Positioned(
            top: 30,
            height: 450,
            left: 10,
            width: 110,
            child: Scrollbar(
              child: GarageCommandList(
                state: garageMetrics.state,
                sendCommand: _mirvGarageApi.sendGarageCommand,
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   height: 450,
          //   right: -15,
          //   width: 150,
          //   child: Column(children: [
          //     // Padding(
          //     //   padding: const EdgeInsets.only(top: 30, bottom: 20),
          //     //   child: RoverOperationMap(
          //     //     locationStream: locationStream,
          //     //     piLitMarkers: piLitMarkers,
          //     //     selectedRoverMetrics: roverMetrics,
          //     //   ),
          //     // ),
          //     // Padding(
          //     //   padding: const EdgeInsets.only(bottom: 20),
          //     //   child: Obx(() => CancelAuto(
          //     //         roverMetrics: webRTCConnection.roverMetricsObs.value,
          //     //         sendCommand: webRTCConnection.sendRoverCommand,
          //     //       )),
          //     // ),
          //     // Padding(
          //     //   padding: const EdgeInsets.only(bottom: 20),
          //     //   child: Obx(() => EStopButton(
          //     //         roverMetrics: webRTCConnection.roverMetricsObs.value,
          //     //         sendCommand: webRTCConnection.sendRoverCommand,
          //     //       )),
          //     // )
          //   ]),
          // ),
          // Obx(() => Positioned(
          //       bottom: 20,
          //       left: manualOperation.value ? 650 : 400,
          //       child: Obx(() => TelemetryWidget(webRTCConnection.roverMetricsObs.value)),
          //     )),
          // Obx(
          //   () => Positioned(
          //     bottom: 20,
          //     left: manualOperation.value ? 300 : 50,
          //     height: 160,
          //     width: 300,
          //     child: RoverOperationMap(
          //       locationStream: locationStream,
          //       piLitMarkers: piLitMarkers,
          //       selectedRoverMetrics: roverMetrics,
          //     ),
          //   ),
          // ),
          // Obx(
          //   () => manualOperation.value
          //       ? Positioned(
          //           bottom: 20,
          //           left: 20,
          //           right: 20,
          //           child: JoystickOverlay(
          //             roverMetrics: webRTCConnection.roverMetricsObs.value,
          //             manualOperation: manualOperation,
          //             onJoystickChanged: webRTCConnection.onJoystickChanged,
          //           ),
          //         )
          //       : Positioned(
          //           bottom: 20,
          //           left: 20,
          //           right: 20,
          //           child: Center(
          //               child: Container(
          //             height: 80,
          //             width: 80,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(16.0),
          //               color: Color.fromRGBO(50, 50, 50, 0.5),
          //             ),
          //             child: IconButton(
          //               icon: Icon(Icons.control_camera_outlined),
          //               iconSize: 60,
          //               color: Colors.white,
          //               onPressed: () => manualOperation.value = true,
          //             ),
          //           ))),
          // ),
          // Obx(() => webRTCConnection.loading.value
          //     ? Expanded(
          //         child: Container(color: Color.fromRGBO(51, 53, 42, 42), child: Center(child: CircularProgressIndicator())))
          //     : SizedBox.shrink())
        ],
      ),
    );
  }
}
