import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

class EStopButton extends StatelessWidget {
  final RoverGarageState? roverGarageState;
  late final bool? isEnabled;

  final Function(RoverCommand) sendCommand;
  EStopButton({
    Key? key,
    required this.roverGarageState,
    required this.sendCommand,
  }) : super(key: key) {
    isEnabled = _cancelState(roverGarageState?.state);
  }

  bool? _cancelState(RoverStateType? roverState) {
    switch (roverState) {
      case RoverStateType.e_stop:
        return false;
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0), color: const Color.fromARGB(255, 120, 120, 120)),
        child: ElevatedButton(
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
            overlayColor: MaterialStateProperty.all(const Color.fromARGB(86, 255, 0, 0)),
            foregroundColor: MaterialStateProperty.all(const Color.fromARGB(148, 255, 0, 0)),
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 120, 120, 120)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          onPressed: isEnabled == true
              ? () {
                  sendCommand(RoverGeneralCommands.eStop);
                  Get.back();
                }
              : null,
          child: const Icon(Icons.warning_amber_rounded, size: 64, color: Colors.red),
        ));
  }
}
