import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';

class LockImage extends StatelessWidget {
  final GarageMetrics? garageMetrics;
  final double width;

  const LockImage({Key? key, required this.garageMetrics, this.width = 60}) : super(key: key);

  Image? updateLockImage(GarageStateType? garageState) {
    switch (garageState) {
      case GarageStateType.retracted_latched:
        return Image.asset('assets/images/closeup_locked_garage.png', width: width);
      case GarageStateType.retracted_unlatched:
        return Image.asset('assets/images/closeup_unlocked_garage.png', width: width);
      case GarageStateType.deployed:
        return Image.asset('assets/images/closeup_unlocked_garage.png', width: width);
      case GarageStateType.in_motion_deploy:
        return Image.asset('assets/images/closeup_unlocked_garage.png', width: width);
      case GarageStateType.in_motion_retract:
        return Image.asset('assets/images/closeup_unlocked_garage.png', width: width);

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: updateLockImage(garageMetrics?.state));
  }
}
