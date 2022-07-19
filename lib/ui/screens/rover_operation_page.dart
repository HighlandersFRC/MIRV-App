import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/cancel_auto_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/disable_toggle.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/e_stop_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/joystick_overlay.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry.dart';
import 'package:rxdart/subjects.dart';

import 'webrtc_connection.dart';

class RoverOperationPage extends StatelessWidget {
  final RoverMetrics roverMetrics;
  late Rx<RoverMetrics> roverMetricsObs;

  RoverOperationPage(this.roverMetrics, {Key? key}) : super(key: key) {
    roverMetricsObs = Rx<RoverMetrics>(roverMetrics);
  }

  WebRTCConnection webRTCConnection = WebRTCConnection();
  final List<PiLit> piLitMarkers = [
    const PiLit(id: 'piLit1', description: 'Pi-lit device', location: LatLng(40.47399235127373, -104.96957682073116)),
    const PiLit(id: 'piLit2', description: 'Pi-lit device', location: LatLng(40.474025762131475, -104.9695798382163)),
    const PiLit(id: 'piLit3', description: 'Pi-lit device', location: LatLng(40.47405381703737, -104.96958520263433)),
    const PiLit(id: 'piLit4', description: 'Pi-lit device', location: LatLng(40.47408365724258, -104.96959090232849))
  ];
  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));
  late Rx<bool> manualOperation = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              child: RTCVideoView(webRTCConnection.localRenderer.value),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(() => OpPgAppBar(
                  roverMetrics: roverMetricsObs.value,
                  stopCall: webRTCConnection.stopCall,
                  peerConnectionState: webRTCConnection.peerConnectionState,
                )),
          ),
          Positioned(
            top: 80,
            height: 450,
            left: 10,
            width: 110,
            child: Scrollbar(
              child: CommandList(
                state: roverMetricsObs.value.state,
                sendCommand: webRTCConnection.sendRoverCommand,
              ),
            ),
          ),
          Positioned(
            top: 80,
            height: 450,
            right: -15,
            width: 150,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Obx(() => ToggleDisable(
                      roverMetrics: roverMetricsObs.value,
                      sendCommand: webRTCConnection.sendRoverCommand,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Obx(() => CancelAuto(
                      roverMetrics: roverMetricsObs.value,
                      sendCommand: webRTCConnection.sendRoverCommand,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Obx(() => EStopButton(
                      roverMetrics: roverMetricsObs.value,
                      sendCommand: webRTCConnection.sendRoverCommand,
                    )),
              )
            ]),
          ),
          Obx(() => Positioned(
                bottom: 20,
                left: manualOperation.value ? 650 : 400,
                child: Obx(() => TelemetryWidget(roverMetricsObs.value)),
              )),
          Obx(
            () => Positioned(
              bottom: 20,
              left: manualOperation.value ? 300 : 50,
              height: 160,
              width: 300,
              child: RoverOperationMap(
                locationStream: locationStream,
                piLitMarkers: piLitMarkers,
                selectedRoverMetrics: roverMetrics,
              ),
            ),
          ),
          Obx(
            () => manualOperation.value
                ? Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: JoystickOverlay(
                      roverMetrics: roverMetricsObs.value,
                      manualOperation: manualOperation,
                      onJoystickChanged: webRTCConnection.onJoystickChanged,
                    ),
                  )
                : Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: ElevatedButton(
                        child: Text("Enable Manual Control"),
                        onPressed: () => manualOperation.value = true,
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
