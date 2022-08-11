import 'package:flutter/material.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/icons/custom_icons_icons.dart';
import 'package:mirv/models/rover/rover_metrics.dart';

class TelemetryWidget extends StatelessWidget {
  final RoverMetrics roverMetrics;

  const TelemetryWidget(this.roverMetrics, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(children: [
        const Icon(
          Icons.speed,
          color: primaryColor,
        ),
        Text("${roverMetrics.telemetry.speed.round()} mph", style: const TextStyle(fontSize: 20, color: fontColor)),
      ]),
      const SizedBox(width: 10),
      Row(children: [
        const Icon(
          CustomIcons.compass,
          color: primaryColor,
        ),
        Text("${roverMetrics.telemetry.heading.round()}\u00B0", style: const TextStyle(fontSize: 20, color: fontColor)),
      ])
    ]);
  }
}
