import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:test/models/rover_health_type.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_metrics_page.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';

class RoverOperationPage extends StatefulWidget {
  final String roverID;
  const RoverOperationPage({Key? key, required this.roverID}) : super(key: key);

  @override
  State<RoverOperationPage> createState() => _RoverOperationPageState();
}

class _RoverOperationPageState extends State<RoverOperationPage> {
  double _x = 0;
  double _y = 0;
  var step = 10.0;
  final JoystickMode _joystickMode = JoystickMode.all;

  final MirvApi _mirvApi = MirvApi();

  Timer? timer;

  RoverMetrics roverMetrics = const RoverMetrics();

  _updateMetrics() async {
    var roverMetricsTemp = await _mirvApi.getRoverMetrics(widget.roverID);
    setState(
      () {
        roverMetrics = roverMetricsTemp;
      },
    );
  }

  _goMetrics() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RoverMetricsPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
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
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(
          'Rover Control ${widget.roverID}',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<RoverMetrics>(
                stream: _mirvApi.periodicMetricUpdates,
                builder: (context, snapshot) {
                  return RoverStatusBar(roverMetrics: snapshot.data);
                }),
          )
        ],
        backgroundColor: Colors.blue,
        foregroundColor: const Color.fromARGB(255, 30, 0, 0),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 220, 220, 220),
                border: Border.all(
                    width: 50, color: const Color.fromARGB(255, 250, 250, 250)),
                borderRadius: const BorderRadius.all(Radius.circular(70))),
            child: const Text(
              "Video Here",
            ),
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: TextButton(
              onPressed: _goMetrics,
              child: const Text("RoverMetrics"),
            ),
          ),
          StreamBuilder<RoverMetrics>(
              stream: _mirvApi.periodicMetricUpdates,
              builder: (context, snapshot) {
                return Text("$snapshot");
              }),
          const SizedBox(height: 10),
          Text("x: $_x, y: $_y"),
          const SizedBox(height: 10),
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
