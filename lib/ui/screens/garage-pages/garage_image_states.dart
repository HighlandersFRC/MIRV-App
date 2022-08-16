import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';

class StateImages extends StatelessWidget {
  final GarageMetrics? garageMetrics;
  final double width;

  StateImages({Key? key, required this.garageMetrics, this.width = 250}) : super(key: key);

  Image? updateImage(GarageStateType? garageState) {
    switch (garageState) {
      case GarageStateType.deployed:
        return Image.asset('assets/images/deployed.png', width: width);
      case GarageStateType.in_motion_deploy:
        return Image.asset('assets/images/garage_down.png', width: width);
      case GarageStateType.in_motion_retract:
        return Image.asset('assets/images/garage_up.png', width: width);
      case GarageStateType.retracted_latched:
        return Image.asset('assets/images/retracted_latched.png', width: width);
      case GarageStateType.retracted_unlatched:
        return Image.asset('assets/images/retracted_unlatched.png', width: width);
      case GarageStateType.unavailable:
        return Image.asset('assets/images/garage_unavailable.png', width: width);
      default:
        return Image.asset('assets/images/default_garage.png', width: width);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: updateImage(garageMetrics?.state));
  }
}
