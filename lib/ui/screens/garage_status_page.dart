import 'package:flutter/material.dart';
import 'package:mirv/icons/custom_icons_icons.dart';
import 'package:mirv/models/device_health.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/ui/screens/rover_status_page.dart';

class StatusPageGarage extends StatelessWidget {
  final GarageMetrics garageMetrics;
  const StatusPageGarage(this.garageMetrics, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 50,
      mainAxisSpacing: 100,
      crossAxisCount: 4,
      children: <Widget>[
        HealthContainer(
            DeviceHealth(health: garageMetrics.health, details: garageMetrics.health_details), "General", CustomIcons.warehouse),
      ],
    );
  }
}
