import 'package:flutter/material.dart';

class RoverOperationPage extends StatelessWidget {
  final String roverID;
  RoverOperationPage({Key? key, required this.roverID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void _goBack() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(
          'Rover Control $roverID',
          textScaleFactor: 2,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Color.fromARGB(255, 30, 0, 0),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 220, 220, 220),
            border: Border.all(width: 50, color: Color.fromARGB(255, 250, 250, 250)),
            borderRadius: const BorderRadius.all(const Radius.circular(70))),
        child: Text(
          "Video Here",
          textScaleFactor: 1.7,
        ),
        margin: EdgeInsets.only(bottom: 400),
      ),
    );
  }
}
