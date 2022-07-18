import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

class CancelAuto extends StatelessWidget {
  final RoverMetrics? roverMetrics;
  late final bool? cancelled;

  final Function(RoverCommand) sendCommand;
  CancelAuto({
    Key? key,
    required this.roverMetrics,
    required this.sendCommand,
  }) : super(key: key) {
    cancelled = _cancelState(roverMetrics?.state);
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
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(cancelled == true ? Colors.blue : Colors.grey)),
      onPressed: () {
        cancelled == true ? sendCommand(RoverGeneralCommands.cancel) : null;
      },
      child: const Text("Cancel Command"),
    );
  }
}
