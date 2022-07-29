import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_command_type.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/pair.dart';

part 'garage_commands.freezed.dart';
part 'garage_commands.g.dart';

@freezed
class GarageCommand with _$GarageCommand {
  const factory GarageCommand(GarageCommandType command) = GeneralGarageCommand;

  factory GarageCommand.fromJson(Map<String, dynamic> json) => _$GarageCommandFromJson(json);
}

class GarageCommands {
  static const lock = GarageCommand(GarageCommandType.lock);
  static const unlock = GarageCommand(GarageCommandType.unlock);
  static const retract = GarageCommand(GarageCommandType.retract);
  static const deploy = GarageCommand(GarageCommandType.deploy);
}

Map<GarageStateType, List<Pair<GarageCommand, Image>>> garageCommandsByState = {
  GarageStateType.retracted_latched: [
    Pair(GarageCommands.unlock, Image.asset('assets/images/unlock.png')),
  ],
  GarageStateType.deployed: [
    Pair(GarageCommands.retract, Image.asset('assets/images/up_arrow.png')),
  ],
  GarageStateType.retracted_unlatched: [
    Pair(GarageCommands.lock, Image.asset('assets/images/lock.png')),
    Pair(GarageCommands.deploy, Image.asset('assets/images/down_arrow.png')),
  ],
  GarageStateType.unavailable: [],
  GarageStateType.in_motion_retract: [],
  GarageStateType.in_motion_deploy: [],
};
