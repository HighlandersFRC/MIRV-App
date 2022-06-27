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
  List<bool> selected = [true, false];

  _selected() {
    widget.roverMetrics.state == RoverStateType.disabled
        ? selected = [false, true]
        : null;
  }

  @override
  Widget build(BuildContext context) {
    _selected();
    return FittedBox(
        fit: BoxFit.fill,
        child: Container(
          color: Colors.red[100],
          child: ToggleButtons(
            fillColor: Colors.green[700],
            color: Colors.black,
            selectedColor: Colors.black,
            renderBorder: false,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('enable'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('disable'),
              )
            ],
            isSelected: selected,
            onPressed: (int newIndex) {
              setState(() {
                for (int index = 0; index < selected.length; index++) {
                  if (index == newIndex) {
                    selected[index] = true;
                  } else {
                    selected[index] = false;
                  }
                }
                if (selected[0] == true) {
                  print('enable');
                }
                if (selected[1] == true) {
                  print('disable');
                }
              });
            },
          ),
        ));
  }
}
