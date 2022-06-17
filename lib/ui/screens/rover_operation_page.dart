import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_metrics_page.dart';

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
    var roverMetricsTemp = await _mirvApi.getRoverMetrics(widget.roverID);
    setState(() {
      roverMetrics = roverMetricsTemp;
    });
  }

  _goMetrics() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RoverMetricsPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    //_updateMetrics();
    //timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
    // _updateMetrics();
//});
    _mirvApi.startPeriodicMetricUpdates();
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
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Color.fromARGB(255, 30, 0, 0),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 90, 88, 88),
                border: Border.all(
                    width: 50, color: Color.fromARGB(255, 250, 250, 250)),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(70))),
            child: Text(
              "Video Here",
            ),
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: TextButton(
              onPressed: _goMetrics,
              child: Text("RoverMetrics"),
            ),
          ),
          StreamBuilder<RoverMetrics>(
              stream: _mirvApi.periodicMetricUpdates,
              builder: (context, snapshot) {
                return Text("$snapshot");
              }),
          SizedBox(height: 10),
          Text("x: $_x, y: $_y"),
          SizedBox(height: 10),
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
