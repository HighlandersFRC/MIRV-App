import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_position.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';

import 'package:mirv/models/rover_health_type.dart';
import 'package:mirv/models/ui_connection_state.dart';

class GarageStatusBar extends StatelessWidget {
  GarageStatusBar({
    Key? key,
    required this.garageMetrics,
    this.garagePosition,
  }) : super(key: key) {}
  final GarageMetrics? garageMetrics;
  final GaragePosition? garagePosition;

  StatelessWidget _stateDescription(GaragePosition? position) {
    GaragePosition result = garageMetrics!.position;

    switch (result) {
      case GaragePosition.retracted_unlatched:
        return const Text("State: Retracted_unlatched");
      case GaragePosition.retracted_latched:
        return const Text("State: Retracted_latched");
      case GaragePosition.deployed:
        return const Text("State: Deployed");
      case GaragePosition.disabled:
        return const Text("State: Disabled");
      case GaragePosition.unavailable:
        return const Text("State: Unavailable");
    }
  }

  _healthIcon({required RoverHealthType roverHealthType, required IconData healthIconChoice}) {
    switch (roverHealthType) {
      case RoverHealthType.degraded:
        return Icon(healthIconChoice, color: Colors.red);
      case RoverHealthType.unhealthy:
        return Icon(healthIconChoice, color: Colors.yellow);
      default:
        return Visibility(visible: false, child: Icon(healthIconChoice));
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: garageMetrics != null
          ? [
              _stateDescription(garagePosition),
            ]
          : [],
    );
  }
}
