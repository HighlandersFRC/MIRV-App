import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/services/mirv_api.dart';

class GarageStatusBar extends StatelessWidget {
  GarageStatusBar({
    Key? key,
    required this.garageMetrics,
  }) : super(key: key);
  final GarageMetrics garageMetrics;


  StatelessWidget _stateDescription(GarageStateType state) {
    switch (state) {
      case GarageStateType.retracted_unlatched:
        return const Text("State: Retracted_unlatched", textScaleFactor: 1);
      case GarageStateType.retracted_latched:
        return const Text("State: Retracted_latched", textScaleFactor: 1);
      case GarageStateType.deployed:
        return const Text("State: Deployed", textScaleFactor: 1);
      case GarageStateType.unavailable:
        return const Text("State: Unavailable", textScaleFactor: 1);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      _stateDescription(garageMetrics.state),
    ]);
  }
}
