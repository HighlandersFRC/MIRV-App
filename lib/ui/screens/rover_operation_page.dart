import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';
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
import 'package:cupertino_icons/cupertino_icons.dart';

import 'webrtc_connection.dart';

class RoverOperationPage extends StatelessWidget {
  final RoverMetrics roverMetrics;

  RoverOperationPage(this.roverMetrics, {Key? key}) : super(key: key);

  late WebRTCConnection webRTCConnection = WebRTCConnection(roverMetrics);
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
    webRTCConnection.makeCall(roverMetrics.rover_id);
    webRTCConnection.startJoystickUpdates();
    webRTCConnection.roverMetricsObs.listen((value) => manualOperation.value = value.state == RoverStateType.remote_operation);
    return Obx(
      () => Scaffold(
        appBar: OpPgAppBar(
          roverMetrics: webRTCConnection.roverMetricsObs.value,
          stopCall: webRTCConnection.stopCall,
          peerConnectionState: webRTCConnection.peerConnectionState,
        ),
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
              top: 30,
              height: 450,
              width: 150,
              left: 10,
              child: Scrollbar(
                child: CommandList(
                  state: webRTCConnection.roverMetricsObs.value.state,
                  sendCommand: webRTCConnection.sendRoverCommand,
                ),
              ),
            ),
            Positioned(
              top: 0,
              height: 450,
              right: -15,
              width: 150,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Obx(() => ToggleDisable(
                        roverMetrics: webRTCConnection.roverMetricsObs.value,
                        sendCommand: webRTCConnection.sendRoverCommand,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Obx(() => CancelAuto(
                        roverMetrics: webRTCConnection.roverMetricsObs.value,
                        sendCommand: webRTCConnection.sendRoverCommand,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Obx(() => EStopButton(
                        roverMetrics: webRTCConnection.roverMetricsObs.value,
                        sendCommand: webRTCConnection.sendRoverCommand,
                      )),
                )
              ]),
            ),
            Obx(() => Positioned(
                  bottom: 20,
                  left: manualOperation.value ? 650 : 400,
                  child: Obx(() => TelemetryWidget(webRTCConnection.roverMetricsObs.value)),
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
                        roverMetrics: webRTCConnection.roverMetricsObs.value,
                        onJoystickChanged: webRTCConnection.onJoystickChanged,
                        sendRoverCommand: webRTCConnection.sendRoverCommand,
                      ),
                    )
                  : Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Center(
                          child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Color.fromRGBO(50, 50, 50, 0.5),
                        ),
                        child: IconButton(
                          icon: Icon(CupertinoIcons.antenna_radiowaves_left_right),
                          iconSize: 60,
                          color: Colors.white,
                          onPressed: () {
                            webRTCConnection.sendRoverCommand(RoverGeneralCommands.enableRemoteOperation);
                          },
                        ),
                      ))),
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
