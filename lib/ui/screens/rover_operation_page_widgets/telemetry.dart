import 'package:flutter/material.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/rover/rover_metrics.dart';

class TelemetryWidget extends StatelessWidget {
  final RoverMetrics roverMetrics;

  const TelemetryWidget(this.roverMetrics, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(children: [
        const Icon(Icons.speed, 
          color: primaryColor,
        
        ),
        const SizedBox(width: 5),
        Text("${roverMetrics.telemetry.speed} mph", style: const TextStyle(fontSize: 20, color: fontColor)),
      ]),
      Row(children: [
        const Icon(
          Icons.compass_calibration,
          color: primaryColor,
        ),
        const SizedBox(width: 5),
        Text("${roverMetrics.telemetry.heading}\u00B0", style: const TextStyle(fontSize: 20, color: fontColor)),
      ])
    ]);
  }
}
