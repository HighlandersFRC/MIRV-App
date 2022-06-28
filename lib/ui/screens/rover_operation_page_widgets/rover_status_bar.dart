import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';

import 'package:test/models/rover_health_type.dart';

class RoverStatusBar extends StatelessWidget {
  const RoverStatusBar({
    Key? key,
    required this.roverMetrics,
  }) : super(key: key);
  final RoverMetrics? roverMetrics;

  Icon _batteryIcon(int batteryLevel, {int? alertLevel}) {
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return const Icon(Icons.battery_alert_rounded);
    }
    switch (result) {
      case 0:
        return const Icon(Icons.battery_0_bar_rounded);
      case 1:
        return const Icon(Icons.battery_1_bar_rounded);
      case 2:
        return const Icon(Icons.battery_2_bar_rounded);
      case 3:
        return const Icon(Icons.battery_3_bar_rounded);
      case 4:
        return const Icon(Icons.battery_4_bar_rounded);
      case 5:
        return const Icon(Icons.battery_5_bar_rounded);
      case 6:
        return const Icon(Icons.battery_6_bar_rounded);
      default:
        return const Icon(Icons.battery_full_rounded);
    }
  }

  _stateIcon(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
        return const Icon(Icons.stop_circle_rounded);
      case RoverStateType.docked:
        return const Icon(Icons.inventory);
      case RoverStateType.eStop:
        return const Icon(Icons.front_hand); //hexagon?
      case RoverStateType.remoteOperation:
        return const Icon(Icons.settings_remote_rounded);
    }
  }

  _healthIcon(
      {required RoverHealthType roverHealthType,
      required IconData healthIconChoice}) {
    switch (roverHealthType) {
      case RoverHealthType.degraded:
        return Icon(healthIconChoice, color: Colors.red);
      case RoverHealthType.unhealthy:
        return Icon(healthIconChoice, color: Colors.yellow);
      default:
        return Visibility(visible: false, child: Icon(healthIconChoice));
    }

    return Icon(healthIconChoice, color: roverHealthType.color3);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: roverMetrics != null
          ? [
              _batteryIcon(roverMetrics!.battery),
              _stateIcon(roverMetrics!.state),
              _healthIcon(
                  roverHealthType: roverMetrics!.health.electronics,
                  healthIconChoice: Icons.circle), //enconder
              _healthIcon(
                  roverHealthType: roverMetrics!.health.electronics,
                  healthIconChoice: Icons.handyman), //mechanical
              _healthIcon(
                  roverHealthType: roverMetrics!.health.general,
                  healthIconChoice: Icons.sensors),

              //lidar
              _healthIcon(
                  roverHealthType: roverMetrics!.health.drivetrain,
                  healthIconChoice: Icons.camera_alt), //camera
              _healthIcon(
                  roverHealthType: roverMetrics!.health.intake,
                  healthIconChoice: Icons.rotate_90_degrees_ccw), //imu
              _healthIcon(
                  roverHealthType: roverMetrics!.health.sensors,
                  healthIconChoice: Icons.gps_fixed), //gps
              _healthIcon(
                  roverHealthType: roverMetrics!.health.garage,
                  healthIconChoice: Icons.garage), //garage
            ]
          : [],
    );
  }
}
