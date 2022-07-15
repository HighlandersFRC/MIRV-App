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
    return ElevatedButton(
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
        child: enabled == true
            ? const Text(
                'Disable',
                style: TextStyle(fontSize: 50),
              )
            : const Text('Enable', style: TextStyle(fontSize: 50)));
  }
}
