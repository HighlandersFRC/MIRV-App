import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/pi_lit_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';

class PiLitCommandDropdown extends StatelessWidget {
  PiLitCommandDropdown({
    Key? key,
    required this.sendCommand,
  }) : super(key: key);
  final Function(RoverCommand) sendCommand;
  late Rx<PiLitStateType> commandKey;
  void sendPiLitCommand() {
    sendCommand(commandKey.value.command);
  }

  @override
  Widget build(BuildContext context) {
    PiLitStateType.values;
    return DropdownButton(
        value: PiLitStateType,
        items: PiLitStateType.values.map((piLitStateType) {
          return DropdownMenuItem(value: piLitStateType, child: Text(piLitStateType.name));
        }).toList(),
        onChanged: (t) {
          t != null ? commandKey.value = t as PiLitStateType : null;
        });
  }
}
