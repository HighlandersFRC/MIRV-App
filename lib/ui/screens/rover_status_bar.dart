import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/models/rover_status_type.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';

import 'package:test/models/rover_health_type.dart';
import 'package:test/models/rover_metrics.dart';

class RoverStatusBar extends StatelessWidget {
  RoverStatusBar({
    Key? key,
    required this.roverMetrics,
  }) : super(key: key);
  RxList<RoverSummary> roverList = <RoverSummary>[].obs;
  MirvApi _mirvApi = MirvApi();
  final RoverMetrics? roverMetrics;

  Icon _batteryIcon(int batteryLevel, {int? alertLevel}) {
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return Icon(Icons.battery_alert_rounded);
    }
    switch (result) {
      case 0:
        return Icon(Icons.battery_0_bar_rounded);
      case 1:
        return Icon(Icons.battery_1_bar_rounded);
      case 2:
        return Icon(Icons.battery_2_bar_rounded);
      case 3:
        return Icon(Icons.battery_3_bar_rounded);
      case 4:
        return Icon(Icons.battery_4_bar_rounded);
      case 5:
        return Icon(Icons.battery_5_bar_rounded);
      case 6:
        return Icon(Icons.battery_6_bar_rounded);
      default:
        return Icon(Icons.battery_full_rounded);
    }
  }

  _stateIcon(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
        return Icon(Icons.battery_0_bar_rounded);
      case RoverStateType.docked:
        return Icon(Icons.battery_1_bar_rounded);
      case RoverStateType.eStop:
        return Icon(Icons.battery_2_bar_rounded);
      case RoverStateType.remoteOperation:
        return Icon(Icons.battery_2_bar_rounded);
    }
  }

  Color _healthColor(RoverHealthType roverHealthType) {
    switch (roverHealthType) {
      case RoverHealthType.degraded:
        return Colors.red;
      case RoverHealthType.healthy:
        return Colors.green;
      case RoverHealthType.unhealthy:
        return Colors.yellow;
      case RoverHealthType.unavailable:
        return Colors.grey;
    }
  }

  Icon _electronicsIcon(RoverHealthType roverHealthType) {
    return Icon(Icons.electric_bolt, color: roverHealthType.colors);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: roverMetrics != null
            ? [
                _batteryIcon(roverMetrics!.battery),
                _stateIcon(roverMetrics!.state),
                _electronicsIcon(roverMetrics!.health.electronics)
              ]
            : [],
      ),
    );
  }
}
