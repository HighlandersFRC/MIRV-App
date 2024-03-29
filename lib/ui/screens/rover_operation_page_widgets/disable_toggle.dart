import 'package:flutter/material.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

class ToggleDisable extends StatelessWidget {
  late final bool? enabled;

  final RoverGarageState? roverGarageState;
  final Function(RoverCommand) sendCommand;
  ToggleDisable({
    Key? key,
    required this.roverGarageState,
    required this.sendCommand,
  }) : super(key: key) {
    enabled = getEnabledState(roverGarageState?.state);
  }

  bool? getEnabledState(RoverStateType? roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
        return false;
      case RoverStateType.docked:
      case RoverStateType.disconnected:
        return null;
      default:
        return true;
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
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 120, 120, 120)),
        ),
        onPressed: enabled == null
            ? null
            : () {
                switch (enabled) {
                  case true:
                    sendCommand(RoverGeneralCommands.disable);
                    break;
                  case false:
                    sendCommand(RoverGeneralCommands.enable);
                    break;
                  default:
                }
              },
        child: enabled == true ? const Icon(Icons.power_sharp, size: 52.5) : const Icon(Icons.play_circle_outline, size: 70),
      ),
    );
  }
}
