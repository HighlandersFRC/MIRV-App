import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';

class GarageStatusBar extends StatelessWidget {
  GarageStatusBar({
    Key? key,
    required this.garageMetrics,
    required this.garageMetricsObs,
  }) : super(key: key);
  final GarageMetrics garageMetrics;
  final Rx<GarageMetrics?> garageMetricsObs;

  StatelessWidget _stateDescription(GarageStateType state, GarageMetrics garageMetrics) {
    switch (state) {
      case GarageStateType.retracted_unlatched:
        return const Text("State: Retracted_unlatched", textScaleFactor: 1);
      case GarageStateType.retracted_latched:
        return const Text("State: Retracted_latched", textScaleFactor: 1);
      case GarageStateType.deployed:
        return const Text("State: Deployed", textScaleFactor: 1);
      case GarageStateType.unavailable:
        return const Text("State: Unavailable", textScaleFactor: 1);
      case GarageStateType.in_motion_retract:
        return const Text("State: Retraction in progress", textScaleFactor: 1);
      case GarageStateType.in_motion_deploy:
        return const Text("State: Deploy in progress", textScaleFactor: 1);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Positioned(child: Text(garageMetricsObs.value!.garage_id)),
      _stateDescription(garageMetrics.state, garageMetricsObs.value!),
    ]);
  }
}
