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
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color.fromARGB(255, 100, 100, 100),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
            overlayColor: MaterialStateProperty.all(Color.fromARGB(50, 255, 17, 0)),
            foregroundColor: MaterialStateProperty.all(Color.fromARGB(50, 255, 17, 0)),
            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 120, 120, 120)),
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
