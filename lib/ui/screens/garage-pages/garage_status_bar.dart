import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/services/mirv_api.dart';

class GarageStatusBar extends StatelessWidget {
  GarageStatusBar({
    Key? key, required this.garageMetrics,
  }) : super(key: key);
  final GarageMetrics garageMetrics;
  // MirvApi mirvApi = MirvApi(garageMetrics);
  // static MirvApi? stateMirvApi;

  StatelessWidget _stateDescription(GarageStateType state) {
    switch (state) {
      case GarageStateType.retracted_unlatched:
        return const Text("State: Retracted_unlatched");
      case GarageStateType.retracted_latched:
        return const Text("State: Retracted_latched");
      case GarageStateType.deployed:
        return const Text("State: Deployed");
      case GarageStateType.disabled:
        return const Text("State: Disabled");
      case GarageStateType.enabled:
        return const Text("State: Enabled");
      case GarageStateType.unavailable:
        return const Text("State: Unavailable");
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
