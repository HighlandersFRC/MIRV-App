import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

class PiLitCommandController extends GetxController {
  Rx<String> selectedPiLitCommand = "".obs;
  Rx<bool> isDeployButtonEnabled = false.obs;

  SelectedRoverController() {
    selectedPiLitCommand.listen((selectedPiLitCommand) => isDeployButtonEnabled.value = (selectedPiLitCommand != ""));
  }

  setselectedPiLitCommand(String rover_id) {
    if (rover_id == selectedPiLitCommand.value) {
      selectedPiLitCommand.trigger(rover_id);
    } else {
      selectedPiLitCommand.value = rover_id;
    }
  }

  verifyRoverId(List<RoverMetrics> rovers) {
    if (rovers.where((element) => element.rover_id == selectedPiLitCommand.value).isEmpty) selectedPiLitCommand.value = "";
  }

  Color roverTileIconColor(String roverId) {
    if (selectedPiLitCommand.value == roverId) {
      return fontColor;
    } else {
      return secondaryColor;
    }
  }

  Color? roverTileColor(
    String piLitCommand,
    bool piLitAmount,
  ) {
    if (selectedPiLitCommand.value == piLitCommand) {
      return tileColorSelected;
    } else {
      switch (piLitAmount) {
        case true:
          return tileColorAvailible;

        case false:
          return tileColorUnavailible;
      }
    }
  }
}

class PiLitDialogButton extends StatelessWidget {
  final RoverMetrics roverMetrics;
  PiLitDialogButton({
    Key? key,
    required this.roverMetrics,
  }) : super(key: key);

  final int piLitAmount = 6;
  //(roverMetrics.pi_lits.pi_lits_stowed_right + roverMetrics.pi_lits.pi_lits_stowed_left);

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
                child: Image.asset('assets/images/pi_lit_outline_down.png'),
                onPressed: piLitDialog),
          ),
        ),
      ),
    );
  }

  void piLitDialog() {
    Get.dialog(
        barrierDismissible: true,
        AlertDialog(
          title: const Text('PiLit Controll'),
          content: Row(
            children: [
              Container(
                width: 150,
                child: ListView(
                  children: [
                    const Text('Pilit Light type'),
                    ListTile(title: const Text('on'), onTap: () {}),
                    ListTile(title: const Text('off'), onTap: () {}),
                    ListTile(title: const Text('parrallel'), onTap: () {}),
                    ListTile(title: const Text('sequential'), onTap: () {}),
                    ListTile(title: const Text('reverse squential'), onTap: () {})
                  ],
                ),
              ),
              Container(
                width: 150,
                child: ListView(
                  children: [
                    const Text('Pilit Configuration'),
                    ListTile(
                        title: const Text('7 PiLit Spear'),
                        onTap: piLitAmount >= 7
                            ? () {
                                print('pilit: click 7');
                              }
                            : null),
                    ListTile(
                        title: const Text('5 PiLit Taper'),
                        onTap: piLitAmount >= 5
                            ? () {
                                print('pilit: click 5');
                              }
                            : null),
                    ListTile(
                        title: const Text('3 Pilit type '),
                        onTap: piLitAmount >= 3
                            ? () {
                                print('pilit: click 31');
                              }
                            : null),
                    ListTile(
                        title: const Text('3 Pilit type '),
                        onTap: piLitAmount >= 3
                            ? () {
                                print('pilit: click 32');
                              }
                            : null),
                    ListTile(
                        title: const Text('3 Pilit type '),
                        onTap: piLitAmount >= 3
                            ? () {
                                print('pilit: click 33');
                              }
                            : null)
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: const Text('Map'),
              ))
            ],
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('back'))
          ],
        ));
  }
}
