import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/drive_to_position-widgets/pi_lit_placemment_map.dart';

class DriveToPositionDialog extends StatelessWidget {
  DriveToPositionDialog(
    this.roverGarageState,
    this.sendCommand, {
    Key? key,
  }) : super(key: key);

  final Rx<RoverGarageState> roverGarageState;
  final Rx<bool> startPointOnMap = false.obs;

  final Rx<LatLng?> targetLocation = Rx<LatLng?>(null);

  final Function(RoverCommand) sendCommand;

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
                child: const Icon(Icons.moving_rounded)),
          ),
        ),
      ),
    );
  }

  void piLitDialog(BuildContext context) {
    Get.dialog(
        barrierDismissible: true,
        AlertDialog(
          title: const Text('Move Rover to Location'),
          content: Column(
            children: [
              const Text('Place Target Point'),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: AspectRatio(
                      aspectRatio: 2.5, child: DriveToLocationMap(roverGarageState, targetLocation, startPointOnMap))),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (targetLocation.value != null) {
                  sendCommand(RoverDrivetrainCommands.destinationCommand(
                      targetLocation.value!.latitude, targetLocation.value!.longitude));
                  Get.back();
                } else {
                  Get.snackbar('Rover Movement', 'No target location selected');
                }
              },
              child: const Text('Move Rover to Location'),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('back'))
          ],
        ));
  }
}
