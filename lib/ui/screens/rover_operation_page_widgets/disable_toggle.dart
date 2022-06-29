import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';

class ToggleDisable extends StatefulWidget {
  final RoverMetrics? roverMetrics;
  const ToggleDisable({
    Key? key,
    required this.roverMetrics,
  }) : super(key: key);

  @override
  State<ToggleDisable> createState() => _ToggleDisableState();
}

class _ToggleDisableState extends State<ToggleDisable> {
  bool enable = true;

  _enableState(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
        enable = false;
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    _enableState(widget.roverMetrics != null
        ? widget.roverMetrics!.state
        : RoverStateType.eStop);
    return ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sending signal"),
          ));
          setState(() {
            enable = true;
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
