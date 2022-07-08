import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/models/rover_metrics.dart';

class ToggleDisable extends StatefulWidget {
  final RoverMetrics? roverMetrics;
  final Function(String, String) sendCommand;
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

  // _enableState(RoverStateType roverState) {
  //   switch (roverState) {
  //     case RoverStateType.disabled:
  //       enable = false;
  //       break;
  //     default:
  //       return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // _enableState(widget.roverMetrics != null
    //     ? widget.roverMetrics!.state
    //     : RoverStateType.eStop);
    return ElevatedButton(
        onPressed: () {
          widget.sendCommand("disable", "intake");
          Fluttertoast.showToast(
            msg: "Sending Signal",
          );
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
