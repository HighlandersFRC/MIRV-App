import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mirv/models/pi_lit_formation_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';

class PiLitFormationCommandDropdown extends StatelessWidget {
  PiLitFormationCommandDropdown({Key? key, this.sendCommand, required this.piLitFormationType, required this.piLitAmount})
      : super(key: key);

  final int piLitAmount;

  final Function(RoverCommand)? sendCommand;

  final Rx<PiLitFormationType> piLitFormationType;

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
          value: piLitFormationType.value,
          items: PiLitFormationType.values.map((piLitFormationType) {
            return DropdownMenuItem(
              value: piLitFormationType,
              child: Text(piLitFormationType.name),
              enabled: piLitFormationType.piLitsRequired <= piLitAmount,
            );
          }).toList(),
          onChanged: (PiLitFormationType? t) {
            if (t != null) {
              piLitFormationType.value = t;
            }
          },
        ));
  }
}


















        // PiLitDeployStateType.values.map((piLitSDeplytateType) {
        // return DropdownMenuItem(value: piLitSDeplytateType, child: Text(piLitSDeplytateType.name));}).toList(),
