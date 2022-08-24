import 'package:flutter/material.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

class CancelAuto extends StatelessWidget {
  final RoverGarageState? roverGarageState;
  late final bool? cancelled;

  final Function(RoverCommand) sendCommand;
  CancelAuto({
    Key? key,
    required this.roverGarageState,
    required this.sendCommand,
  }) : super(key: key) {
    cancelled = _cancelState(roverGarageState?.state);
  }

  bool? _cancelState(RoverStateType? roverState) {
    switch (roverState) {
      case RoverStateType.autonomous:
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: const Color.fromARGB(0, 100, 100, 100),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            shadowColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
            overlayColor: MaterialStateProperty.all(const Color.fromARGB(50, 255, 17, 0)),
            foregroundColor: MaterialStateProperty.all(const Color.fromARGB(63, 255, 17, 0)),
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 120, 120, 120)),
          ),
          onPressed: cancelled == true
              ? () {
                  cancelled == true ? sendCommand(RoverGeneralCommands.cancel) : null;
                }
              : null,
          child: const Icon(Icons.cancel_outlined, size: 64),
        ));
  }
}
