import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover_control/rover_command.dart';

class PiLitCountDialog extends StatelessWidget {
  final RoverGarageState roverState;
  final Function(RoverCommand) sendCommand;
  const PiLitCountDialog(this.roverState, this.sendCommand, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(0, 255, 17, 0),
            Color.fromARGB(0, 138, 9, 0),
            Color.fromARGB(0, 0, 0, 0),
          ],
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
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          shadowColor: MaterialStateProperty.all(const Color.fromARGB(49, 0, 0, 0)),
          overlayColor: MaterialStateProperty.all(const Color.fromARGB(49, 21, 255, 0)),
          foregroundColor: MaterialStateProperty.all(fontColor),
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 100, 100, 100)),
        ),
        child: const Text(
          'Manage Pi-Lit Counts',
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          List<int> values = [0, 1, 2, 3, 4];
          Rx<int> numLeft = roverState.pi_lits.pi_lits_stowed_left.obs;
          Rx<int> numRight = roverState.pi_lits.pi_lits_stowed_right.obs;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Row(
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(8), child: Text("Left Magazine Count")),
                        DropwownMenuInteger(values, numLeft)
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(8), child: Text("Right Magazine Count")),
                        DropwownMenuInteger(values, numRight)
                      ],
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        sendCommand(RoverPiLitCommands.setNumberPiLits(numLeft.value, numRight.value));
                        Get.back();
                      },
                      child: const Text('Update Pi-Lit Counts')),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Close')),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class DropwownMenuInteger extends StatelessWidget {
  final List<int> values;
  final Rx<int> observable;
  const DropwownMenuInteger(this.values, this.observable, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
          value: observable.value,
          items: values.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value.toString(),
                style: const TextStyle(color: fontColor),
              ),
            );
          }).toList(),
          onChanged: (int? val) {
            if (val != null) {
              observable.value = val;
            }
          },
        ));
  }
}
