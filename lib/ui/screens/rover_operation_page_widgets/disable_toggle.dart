import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';

class ToggleDisable extends StatefulWidget {
  final RoverMetrics roverMetrics;
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
    _enableState(widget.roverMetrics.state);
    return FittedBox(
      fit: BoxFit.fill,
      child: Row(
        children: [
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: enable == true
                    ? MaterialStateProperty.all(Colors.green)
                    : MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                // TODO: implement enable massage
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Sending signal"),
                ));
                setState(() {
                  enable = true;
                });
              },
              child: Text('Enable')),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: enable == true
                    ? MaterialStateProperty.all(Colors.red)
                    : MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                // TODO: implement disable massage
                setState(() {
                  enable = false;
                });
              },
              child: Text('Disable'))
        ],
      ),
    );
  }
}
