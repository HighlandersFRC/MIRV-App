import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';

class GarageStatusBar extends StatelessWidget {
  const GarageStatusBar({
    Key? key,
    required this.garageMetrics,
  }) : super(key: key);
  final GarageMetrics garageMetrics;

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
      case GarageStateType.unavailable:
        return const Text("State: Unavailable");
    }
  }

  // _healthIcon({required DeviceHealthType roverHealthType, required IconData healthIconChoice}) {
  //   switch (roverHealthType) {
  //     case DeviceHealthType.degraded:
  //       return Icon(healthIconChoice, color: Colors.red);
  //     case DeviceHealthType.unhealthy:
  //       return Icon(healthIconChoice, color: Colors.yellow);
  //     default:
  //       return Visibility(visible: false, child: Icon(healthIconChoice));
  //   }
  // }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      _stateDescription(garageMetrics.state),
    ]);
  }
}