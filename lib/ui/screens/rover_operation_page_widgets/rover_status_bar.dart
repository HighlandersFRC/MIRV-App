import 'package:flutter/material.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/icons/custom_icons_icons.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/device_health.dart';

// ignore: must_be_immutable
class RoverStatusBar extends StatelessWidget {
  const RoverStatusBar({
    Key? key,
    required this.roverGarageState,
  }) : super(key: key);
  final RoverGarageState? roverGarageState;
  final double iconSize = 40;

  IconData _batteryIcon(int? batteryLevel, {int? alertLevel}) {
    if (batteryLevel == null) {
      return Icons.battery_unknown_rounded;
    }
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return Icons.battery_alert_rounded;
    }
    switch (result) {
      case 0:
        return Icons.battery_0_bar_rounded;
      case 1:
        return Icons.battery_1_bar_rounded;
      case 2:
        return Icons.battery_2_bar_rounded;
      case 3:
        return Icons.battery_3_bar_rounded;
      case 4:
        return Icons.battery_4_bar_rounded;
      case 5:
        return Icons.battery_5_bar_rounded;
      case 6:
        return Icons.battery_6_bar_rounded;
      default:
        return Icons.battery_full_rounded;
    }
  }

  Widget _healthIcon({required DeviceHealthType roverHealthType, required IconData healthIconChoice}) {
    switch (roverHealthType) {
      case DeviceHealthType.degraded:
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(healthIconChoice, color: Colors.red),
        );
      case DeviceHealthType.unhealthy:
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(healthIconChoice, color: Colors.yellow),
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: roverGarageState != null
          ? [
              Icon(_batteryIcon(roverGarageState!.battery_percent, alertLevel: 20), size: iconSize, color: primaryColor),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text("${roverGarageState!.battery_percent}%", style: const TextStyle(fontSize: 20, color: fontColor)),
              ),
              _healthIcon(roverHealthType: roverGarageState!.subsystems.electronics.health, healthIconChoice: Icons.bolt),
              _healthIcon(roverHealthType: roverGarageState!.subsystems.power.health, healthIconChoice: Icons.power),
              _healthIcon(
                  roverHealthType: roverGarageState!.subsystems.general.health, healthIconChoice: Icons.smart_toy_outlined),
              _healthIcon(
                  roverHealthType: roverGarageState!.subsystems.drivetrain.health, healthIconChoice: CustomIcons.steering_wheel),
              _healthIcon(
                  roverHealthType: roverGarageState!.subsystems.intake.health, healthIconChoice: Icons.rotate_90_degrees_ccw),
              _healthIcon(roverHealthType: roverGarageState!.subsystems.sensors.health, healthIconChoice: Icons.sensors),
              _healthIcon(roverHealthType: roverGarageState!.subsystems.garage.health, healthIconChoice: CustomIcons.warehouse),
            ]
          : [],
    );
  }
}
