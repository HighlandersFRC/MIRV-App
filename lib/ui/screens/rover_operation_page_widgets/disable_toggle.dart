import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:ionicons/ionicons.dart';

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
        color: Color.fromARGB(0, 100, 100, 100),
      ),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
          overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 17, 0)),
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 250, 250, 250)),
          backgroundColor: MaterialStateProperty.all(Colors.redAccent.shade700),
        ),
        label: Text(
          "",
          textScaleFactor: 0.0,
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
        icon: enabled == true ? const Icon(Ionicons.flash_off, size: 52.5) : const Icon(Icons.play_circle_outline, size: 70),
      ),
    );
  }
}
