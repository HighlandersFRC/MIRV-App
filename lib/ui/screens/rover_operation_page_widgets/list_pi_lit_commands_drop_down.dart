import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/pi_lit_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';

class PiLitCommandDropdown extends StatelessWidget {
  PiLitCommandDropdown({Key? key, this.sendCommand, required this.piLitState}) : super(key: key);

  final Function(RoverCommand)? sendCommand;

  final Rx<PiLitStateType> piLitState;

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
          value: piLitState.value,
          items: PiLitStateType.values.map((piLitStateType) {
            return DropdownMenuItem(value: piLitStateType, child: Text(piLitStateType.name));
          }).toList(),
          onChanged: (PiLitStateType? t) {
            if (t != null) {
              piLitState.value = t;
              if (sendCommand != null) {
                sendCommand!(t.command);
              }
            }
          },
        ));
  }
}
