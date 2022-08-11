import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';

import 'package:mirv/models/pi_lit_formation_type.dart';

class PiLitFormationCommandDropdown extends StatelessWidget {
  PiLitFormationCommandDropdown({Key? key, required this.piLitFormationType, required this.piLitAmount}) : super(key: key);

  final int piLitAmount;

  final Rx<PiLitFormationType> piLitFormationType;

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
          value: piLitFormationType.value,
          items: PiLitFormationType.values.map((piLitFormationType) {
            return DropdownMenuItem(
              value: piLitFormationType,
              enabled: piLitFormationType.piLitsRequired <= piLitAmount,
              child: Text(piLitFormationType.name,
                  style: TextStyle(color: piLitFormationType.piLitsRequired >= piLitAmount ? Colors.grey : fontColor)),
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
