import 'package:flutter/material.dart';
import 'package:mirv/models/rover_metrics.dart';

class TelemetryWidget extends StatelessWidget {
  final RoverMetrics roverMetrics;

  const TelemetryWidget(this.roverMetrics, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 50, 50, 0.5),
      ),
      child: Column(children: [
        Row(children: [
          const Icon(Icons.speed, color: Colors.white),
          const SizedBox(width: 5),
          Text("${roverMetrics.telemetry.speed} mph", style: const TextStyle(fontSize: 20, color: Colors.white)),
        ]),
        Row(children: [
          const Icon(Icons.compass_calibration, color: Colors.white),
          const SizedBox(width: 5),
          Text("${roverMetrics.telemetry.heading}\u00B0", style: const TextStyle(fontSize: 20, color: Colors.white)),
        ])
      ]),
    );
  }
}
