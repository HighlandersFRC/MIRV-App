// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mirv/models/pi_lit_formation_type.dart';
import 'package:mirv/models/pi_lit_state_type.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/commands_drawer.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/disable_toggle.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/drive_to_position-widgets/drive_to_position_dialog.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/e_stop_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/garage_button.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/joystick_overlay.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/pi_lit_controll_dialog/list_pi_lit_commands_drop_down.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/pi_lit_controll_dialog/piLit-dialog.dart';
import 'webrtc_connection.dart';

class RoverOperationPage extends StatelessWidget {
  final RoverGarageState roverGarageState;

  RoverOperationPage(this.roverGarageState, {Key? key}) : super(key: key);

  late WebRTCConnection webRTCConnection = WebRTCConnection(roverGarageState);
  late Rx<bool> manualOperation = false.obs;
  late bool showMap;

  // PiLitFormationType formation = PiLitFormationType.taper_right_3;
  // int numPiLitsRequired = formation.piLitsRequired;

  @override
  Widget build(BuildContext context) {
    manualOperation.value = webRTCConnection.roverMetricsObs.value.state == RoverStateType.remote_operation;
    webRTCConnection.roverMetricsObs.listen((val) => manualOperation.value = val.state == RoverStateType.remote_operation);
    webRTCConnection.makeCall(roverGarageState.rover_id);
    webRTCConnection.startJoystickUpdates();

    var roverOperationMap = RoverOperationMap(webRTCConnection.roverMetricsObs);
    return Obx(
      () => Scaffold(
        appBar: OperationPageAppBar(
          roverGarageState: webRTCConnection.roverMetricsObs,
          stopCall: webRTCConnection.stopCall,
          peerConnectionState: webRTCConnection.peerConnectionState,
        ),
        drawer: CommandsDrawer(webRTCConnection),
        body: Stack(
          children: [
            Obx(
              () => webRTCConnection.roverMetricsObs.value.state == RoverStateType.autonomous
                  ? const Positioned(
                      top: 10,
                      height: 40,
                      width: 150,
                      left: 30,
                      child: LinearProgressIndicator(
                        value: 0.6,
                        minHeight: 20,
                        color: Color.fromARGB(255, 255, 153, 0),
                        backgroundColor: Color.fromARGB(148, 158, 158, 158),
                      ),
                    )
                  : Container(
                      color: const Color.fromARGB(255, 243, 33, 33),
                      child: const Text(""),
                    ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: RTCVideoView(webRTCConnection.localRenderer.value),
              ),
            ),
            Positioned(
              top: 10,
              bottom: 10,
              width: 150,
              left: 10,
              child: Column(children: [
                const OpenCommandsDrawer(),
                // webRTCConnection.roverMetricsObs.value.state == RoverStateType.idle
                //     ? PiLitDialogButton(
                //         webRTCConnection.roverMetricsObs,
                //         webRTCConnection.sendRoverCommand,
                //       )
                //     : const SizedBox.shrink(),
                // webRTCConnection.roverMetricsObs.value.state == RoverStateType.idle
                //     ? DriveToPositionDialog(
                //         roverGarageState: webRTCConnection.roverMetricsObs,
                //         sendCommand: webRTCConnection.sendRoverCommand,
                //       )
                //     : const SizedBox.shrink(),
                Expanded(
                  child: CommandList(
                    roverGarageState: webRTCConnection.roverMetricsObs.value,
                    sendCommand: webRTCConnection.sendRoverCommand,
                    webRtcConnection: webRTCConnection,
                  ),
                ),
              ]),
            ),
            Positioned(
              top: 0,
              height: 450,
              right: 15,
              width: 175,
              child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Obx(
                    () => ToggleDisable(
                      roverGarageState: webRTCConnection.roverMetricsObs.value,
                      sendCommand: webRTCConnection.sendRoverCommand,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Obx(() => EStopButton(
                        roverGarageState: webRTCConnection.roverMetricsObs.value,
                        sendCommand: webRTCConnection.sendRoverCommand,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PiLitCommandDropdown(
                    Rx<PiLitStateType>(webRTCConnection.roverMetricsObs.value.pi_lits.state),
                    sendCommand: webRTCConnection.sendRoverCommand,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Obx(() => GarageButton(webRTCConnection.mirvApi.garageMetricsObs.value)),
                )
              ]),
            ),
            Obx(
              () => Positioned(
                left: manualOperation.value ? 400 : 180,
                bottom: 20,
                height: 200,
                width: 375,
                child: GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  onDoubleTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: AspectRatio(
                            aspectRatio: 1.5,
                            child: roverOperationMap,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: roverOperationMap,
                ),
              ),
            ),
            Obx(() => webRTCConnection.roverMetricsObs.value.state == RoverStateType.idle
                ? Positioned(
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
                            CupertinoIcons.game_controller,
                            size: 50,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            webRTCConnection.sendRoverCommand(RoverGeneralCommands.enableRemoteOperation);
                          },
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()),
            Obx(() => manualOperation.value
                ? Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: JoystickOverlay(
                      joystickController: webRTCConnection.joystickController,
                    ),
                  )
                : const SizedBox.shrink()),
            Obx(
              () => manualOperation.value
                  ? Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: JoystickOverlay(
                        joystickController: webRTCConnection.joystickController,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Obx(
              () => webRTCConnection.loading.value
                  ? Center(
                      child: Container(
                        color: const Color.fromRGBO(51, 53, 42, 42),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Connecting to ${roverGarageState.rover_id}"),
                              ),
                              const CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
