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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: Color.fromARGB(255, 100, 100, 100)),
        child: ElevatedButton.icon(
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(Color.fromARGB(0, 0, 0, 0)),
            backgroundColor: MaterialStateProperty.all(Color.fromARGB(0, 97, 97, 97)),
            overlayColor: MaterialStateProperty.all(Color.fromARGB(137, 255, 255, 0)),
            foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 0, 0)),
          ),
          label: Text("", textScaleFactor: 0.0),
          onPressed: isEnabled == true
              ? () {
                  sendCommand(RoverGeneralCommands.eStop);
                }
              : null,
          icon: const Icon(Icons.warning_amber_rounded, size: 64, color: Colors.red),
        ));
  }
}
