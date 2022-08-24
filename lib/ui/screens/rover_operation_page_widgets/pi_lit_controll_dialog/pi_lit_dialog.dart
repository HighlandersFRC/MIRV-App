import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/constants/geometry.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/pi_lit_formation_type.dart';
import 'package:mirv/models/pi_lit_state_type.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/pi_lit_controll_dialog/list_pi_lit_commands_drop_down.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/pi_lit_controll_dialog/list_pi_lits_deploy_commands_drop_down.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/pi_lit_controll_dialog/pi_lit_placemment_map.dart';

// ignore: must_be_immutable
class PiLitDialogButton extends StatelessWidget {
  PiLitDialogButton(
    this.roverGarageState,
    this.sendCommand, {
    Key? key,
  }) : super(key: key);

  final Rx<RoverGarageState> roverGarageState;
  late Rx<PiLitStateType> piLitState = Rx<PiLitStateType>(roverGarageState.value.pi_lits.state);
  late Rx<PiLitFormationType> piLitForamtionType = PiLitFormationType.taper_right_5.obs;
  final Rx<bool> startPointOnMap = false.obs;

  final Rx<LatLng?> startPoint = Rx<LatLng?>(null);
  final Rx<LatLng?> endPoint = Rx<LatLng?>(null);

  final Function(RoverCommand) sendCommand;

  late int piLitAmount = roverGarageState.value.pi_lits.numPiLitsStowed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 2),
      child: ListTile(
        title: SizedBox(
          height: 110,
          width: 64,
          child: Container(
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(0, 255, 17, 0),
                  Color.fromARGB(0, 138, 9, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ], //colors
              ),
              backgroundBlendMode: BlendMode.colorBurn,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(19, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 7.0,
                  offset: Offset(-4, 4),
                ),
                BoxShadow(color: Color.fromARGB(7, 255, 255, 255), offset: Offset(7, -7), blurRadius: 7, spreadRadius: 1),
              ],
            ),
            child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(64, 64)),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all(const Color.fromARGB(49, 0, 0, 0)),
                  overlayColor: MaterialStateProperty.all(const Color.fromARGB(49, 21, 255, 0)),
                  foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 50, 50, 50)),
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 100, 100, 100)),
                ),
                onPressed: () {
                  piLitDialog(context);
                },
                child: Image.asset('assets/images/pi_lit_outline_down.png')),
          ),
        ),
      ),
    );
  }

  void piLitDialog(BuildContext context) {
    Get.dialog(
        barrierDismissible: true,
        AlertDialog(
          title: const Text('PiLit Controll'),
          content: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PiLitCommandDropdown(
                      piLitState,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PiLitFormationCommandDropdown(
                      piLitFormationType: piLitForamtionType,
                      piLitAmount: piLitAmount,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text("Reset Markers"),
                      onPressed: () {
                        startPoint.value = null;
                        endPoint.value = null;
                        startPointOnMap.value = false;
                      },
                    ),
                  ),
                ],
              ),
              Obx(() => Text(startPointOnMap.value ? 'Place End Point (Red Marker)' : 'Place Start Point (Green Marker)')),
              const SizedBox(height: 10),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: AspectRatio(
                      aspectRatio: 2.5, child: PiLitPlacementMap(roverGarageState, startPoint, endPoint, startPointOnMap))),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (piLitState.value.command != null) {
                  sendCommand(piLitState.value.command!);
                }

                if (startPoint.value != null && endPoint.value != null) {
                  double heading = Geometry.bearing_between_coordiantes(startPoint.value!, endPoint.value!);
                  sendCommand(RoverGeneralCommands.deployPiLits(
                      piLitForamtionType.value, DeviceLocation.fromLatLng(startPoint.value!), heading));
                  Get.back();
                } else {
                  Get.snackbar('Pilit Control', 'No starting point selected');
                }
              },
              child: const Text('Deploy Pi-Lits'),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('back'))
          ],
        ));
  }
}
