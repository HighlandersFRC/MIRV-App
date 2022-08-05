import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';

class StateImages extends StatelessWidget {
  final GarageMetrics garageMetrics;

  StateImages({Key? key, required this.garageMetrics}) : super(key: key);

  Image? updateImage(GarageStateType? garageState) {
    switch (garageState) {
      case GarageStateType.deployed:
        return Image.asset('assets/images/deployed.png');
      case GarageStateType.in_motion_deploy:
        return Image.asset('assets/images/garage_down.png');
      case GarageStateType.in_motion_retract:
        return Image.asset('assets/images/garage_up.png');
      case GarageStateType.retracted_latched:
        return Image.asset('assets/images/retracted_unavailable.png');
      case GarageStateType.retracted_unlatched:
        return Image.asset('assets/images/retracted_unlatched.png');
      case GarageStateType.unavailable:
        return Image.asset('assets/images/garage_unavailable.png');
      default:
        return Image.asset('assets/images/default_garage.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: updateImage(garageMetrics.state));
  }
}
