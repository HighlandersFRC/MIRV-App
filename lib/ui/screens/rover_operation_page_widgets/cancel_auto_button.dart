import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

class CancelAuto extends StatefulWidget {
  final RoverMetrics? roverMetrics;
  final Function(RoverCommand) sendCommand;
  const CancelAuto({
    Key? key,
    required this.roverMetrics,
    required this.sendCommand,
  }) : super(key: key);

  @override
  State<CancelAuto> createState() => _CancelAutoState();
}

class _CancelAutoState extends State<CancelAuto> {
  bool cancel = true;

  _cancelState(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
        cancel = false;
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          cancel == true
              ? widget.sendCommand(RoverIntakeCommands.disable)
              : null;
        }, 
        
        child: cancel == true
        ? MaterialStateProperty.all<Color>(Colors.blue)
        :  MaterialStateProperty.all<Color>(Colors.red);
        
        );
  }
}
