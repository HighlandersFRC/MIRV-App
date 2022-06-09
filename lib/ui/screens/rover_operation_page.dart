import 'dart:async';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/services/mirv_api.dart';

class RoverOperationPage extends StatefulWidget {
  final String roverID;
  RoverOperationPage({Key? key, required this.roverID}) : super(key: key);

  @override
  State<RoverOperationPage> createState() => _RoverOperationPageState();
}

class _RoverOperationPageState extends State<RoverOperationPage> {
  double _x = 0;
  double _y = 0;
  var step = 10.0;
  JoystickMode _joystickMode = JoystickMode.all;

  MirvApi _mirvApi = MirvApi();

  Timer? timer;

  RoverMetrics roverMetrics = RoverMetrics();

  _updateMetrics() async {
    var roverMetrics = await _mirvApi.getRoverMetrics(widget.roverID);
    print(roverMetrics);
    setState(() {
      roverMetrics;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateMetrics();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      _updateMetrics();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _goBack() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(
          'Rover Control ${widget.roverID}',
          textScaleFactor: 2,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Color.fromARGB(255, 30, 0, 0),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 220, 220, 220),
                border: Border.all(
                    width: 50, color: Color.fromARGB(255, 250, 250, 250)),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(70))),
            child: Text(
              "Video Here",
              textScaleFactor: 1.7,
            ),
          ),
          Text("$roverMetrics"),
          Text("x: $_x, y: $_y"),
          Joystick(
            mode: _joystickMode,
            listener: (details) {
              setState(() {
                _x = details.x;
                _y = details.y;
              });
            },
          ),
        ],
      ),
    );
  }
}
