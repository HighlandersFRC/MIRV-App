import 'package:flutter/material.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

class ToggleDisable extends StatelessWidget {
  late final bool? enabled;

  final RoverMetrics? roverMetrics;
  final Function(RoverCommand) sendCommand;
  ToggleDisable({
    Key? key,
    required this.roverMetrics,
    required this.sendCommand,
  }) : super(key: key) {
    enabled = getEnabledState(roverMetrics?.state);
  }

  bool? getEnabledState(RoverStateType? roverState) {
    switch (roverState) {
      case RoverStateType.connected_idle_docked:
      case RoverStateType.connected_idle_roaming:
        return true;
      case RoverStateType.connected_disabled:
        return false;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Color.fromRGBO(50, 50, 50, 0.5),
      ),
      child: IconButton(
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
        icon:
            enabled == true ? const Icon(Icons.stop_circle_outlined, size: 70) : const Icon(Icons.play_circle_outline, size: 70),
      ),
    );
  }
}
