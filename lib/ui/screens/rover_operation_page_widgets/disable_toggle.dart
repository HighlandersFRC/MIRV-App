import 'package:flutter/material.dart';

class ToggleDisable extends StatefulWidget {
  const ToggleDisable({Key? key}) : super(key: key);
  @override
  State<ToggleDisable> createState() => _ToggleDisableState();
}

class _ToggleDisableState extends State<ToggleDisable> {
  List<bool> selected = [false, true];

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  // roverStateMessage(index) {
  //   switch (selected) {
  //     case selected[index] == true:
  //   }

  //   if (selected[1] == true) {
  //     print('enable');
  //   }
  // }
}
