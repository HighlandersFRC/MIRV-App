import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

class EStopButton extends StatelessWidget {
  final RoverMetrics? roverMetrics;
  late final bool? isEnabled;

  final Function(RoverCommand) sendCommand;
  EStopButton({
    Key? key,
    required this.roverMetrics,
    required this.sendCommand,
  }) : super(key: key) {
    isEnabled = _cancelState(roverMetrics?.state);
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color.fromRGBO(50, 50, 50, 0.5),
        ),
        child: IconButton(
          onPressed: isEnabled == true
              ? () {
                  sendCommand(RoverGeneralCommands.eStop);
                }
              : null,
          icon: const Icon(Icons.warning_amber_rounded, size: 70, color: Colors.red),
        ));
  }
}
