import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/pi_lit_deploy_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';

class PiLitDeployCommandDropdown extends StatelessWidget {
  PiLitDeployCommandDropdown({
    Key? key,
    required this.sendCommand,
  }) : super(key: key);
  final Function(RoverCommand) sendCommand;

  late Rx<PiLitDeployStateType> deployCommandKey;

  sendPiLitCommand() {
    sendCommand(deployCommandKey.value.command);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: PiLitDeployStateType,
        items: PiLitDeployStateType.values.map((piLitSDeplytateType) {
          return DropdownMenuItem(value: piLitSDeplytateType, child: Text(piLitSDeplytateType.name));
        }).toList(),
        onChanged: (t) {
          t != null ? deployCommandKey.value = t as PiLitDeployStateType : null;
        });
  }
}
