// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/cancel_auto_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/center_panel.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/disable_toggle.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/e_stop_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/joystick_overlay.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry.dart';
import 'package:rxdart/subjects.dart';

import 'webrtc_connection.dart';

class RoverOperationPage extends StatelessWidget {
  final RoverMetrics roverMetrics;

  RoverOperationPage(this.roverMetrics, {Key? key}) : super(key: key);

  late WebRTCConnection webRTCConnection = WebRTCConnection(roverMetrics);
  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));
  late Rx<bool> manualOperation = false.obs;
  late bool showMap;
  final double? _left = 50;
  final double? _bottom = 20;
  
  late Rx<double?> _leftObs = Rx<double?>(null);
  late Rx<double?> _bottomObs = Rx<double?>(null);



  @override
  Widget build(BuildContext context) {
    _leftObs.value = _left;
    _bottomObs.value = _bottom;
    webRTCConnection.roverMetricsObs.listen((val) => manualOperation.value = val.state == RoverStateType.remote_operation);
    webRTCConnection.makeCall(roverMetrics.rover_id);
    webRTCConnection.startJoystickUpdates();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    // webRTCConnection.roverMetricsObs.listen((value) => manualOperation.value = value.state == RoverStateType.remote_operation);
    return Obx(
      () => Scaffold(
        appBar: OpPgAppBar(
          roverMetrics: webRTCConnection.roverMetricsObs,
          stopCall: webRTCConnection.stopCall,
          peerConnectionState: webRTCConnection.peerConnectionState,
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: RTCVideoView(webRTCConnection.localRenderer.value),
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
            
              Positioned(
                  left: 20,
                  bottom: 20,
                  height: 240,
                  width: 450,
                  child: GestureDetector(
                    behavior: HitTestBehavior.deferToChild,
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: AspectRatio(
                              aspectRatio: 1.5,
                              child: RoverOperationMap(
                                locationStream: locationStream,
                                roverMetrics: roverMetrics,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  return Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              )
                            ],
                          );
                        },
                      );
                    },
                      child: RoverOperationMap(
                        locationStream: locationStream,
                        roverMetrics: roverMetrics,
                      ),
                   
                  )),
            
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
                      right: 15,
                      child: Center(
                          child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color.fromARGB(0, 50, 50, 50),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(50, 50, 50, 0.5)),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          child: const Icon(
                            Ionicons.game_controller_outline,
                            size: 50,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            webRTCConnection.sendRoverCommand(RoverGeneralCommands.enableRemoteOperation);
                          },
                        ),
                      ))),
            ),
            Obx(() => webRTCConnection.loading.value
                ? Center(
                    child: Container(
                        color: const Color.fromRGBO(51, 53, 42, 42), child: const Center(child: CircularProgressIndicator())))
                : const SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
