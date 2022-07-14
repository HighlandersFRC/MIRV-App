import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

class ToggleDisable extends StatefulWidget {
  final RoverMetrics? roverMetrics;
  final Function(RoverCommand) sendCommand;
  const ToggleDisable({
    Key? key,
    required this.roverMetrics,
    required this.sendCommand,
  }) : super(key: key);

  @override
  State<ToggleDisable> createState() => _ToggleDisableState();
}

class _ToggleDisableState extends State<ToggleDisable> {
  bool enable = true;
  _enableState(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disconnected:

        ///TODO: implement this so it actually works
        enable = false;
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // _enableState(widget.roverMetrics != null
    //     ? widget.roverMetrics!.state
    //     : RoverStateType.eStop);
    return ElevatedButton(
        onPressed: () {
          widget.sendCommand(RoverIntakeCommands.disable);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sending signal"),
          ));
          setState(() {
            enable = !enable;
          });
        },
        child: enable == true
            ? const Text(
                'Disable',
                style: TextStyle(fontSize: 50),
              )
            : const Text('Enable', style: TextStyle(fontSize: 50)));
  }
}
