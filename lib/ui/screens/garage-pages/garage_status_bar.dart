import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';

class GarageStatusBar extends StatelessWidget {
  GarageStatusBar({
    Key? key,
    required this.garageMetrics, required this.garageMetricsObs,
  }) : super(key: key);
  final GarageMetrics garageMetrics;
  final Rx<GarageMetrics?> garageMetricsObs;

  StatelessWidget _stateDescription(GarageStateType state, GarageMetrics garageMetrics) {
    switch (state) {
      case GarageStateType.retracted_unlatched:
        return  Text("${garageMetricsObs.value!.garage_id}   State: Retracted_unlatched", textScaleFactor: 1);
      case GarageStateType.retracted_latched:
        return  Text("${garageMetricsObs.value!.garage_id}   State: Retracted_latched", textScaleFactor: 1);
      case GarageStateType.deployed:
        return  Text("${garageMetricsObs.value!.garage_id}   State: Deployed", textScaleFactor: 1);
      case GarageStateType.unavailable:
        return  Text("${garageMetricsObs.value!.garage_id}   State: Unavailable", textScaleFactor: 1);
      case GarageStateType.in_motion_retract:
        return  Text("${garageMetricsObs.value!.garage_id}   State: Retraction in progress", textScaleFactor: 1);
      case GarageStateType.in_motion_deploy:
        return  Text("State: Deploy in progress", textScaleFactor: 1);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      _stateDescription(garageMetrics.state, garageMetricsObs.value!),
    ]);
  }
}
