import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';

class LockImage extends StatelessWidget {
  final GarageMetrics garageMetrics;

  LockImage({Key? key, required this.garageMetrics}) : super(key: key);

  Image? updateLockImage(GarageStateType? garageState) {
    switch (garageState) {
      case GarageStateType.retracted_latched:
        return Image.asset('assets/images/closeup_locked_garage.png');
      case GarageStateType.retracted_unlatched:
        return Image.asset('assets/images/closeup_unlocked_garage.png');
      case GarageStateType.deployed:
        return Image.asset('assets/images/closeup_unlocked_garage.png');
      case GarageStateType.in_motion_deploy:
        return Image.asset('assets/images/closeup_unlocked_garage.png');
      case GarageStateType.in_motion_retract:
        return Image.asset('assets/images/closeup_unlocked_garage.png');

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: updateLockImage(garageMetrics.state));
  }
}
