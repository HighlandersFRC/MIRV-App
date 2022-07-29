import 'package:flutter/material.dart';
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
        HealthContainer(garageMetrics.health, "General"),
      ],
    );
  }
}