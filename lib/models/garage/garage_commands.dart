import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/garage/garage_command_type.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
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
  static const lightsOn = GarageCommand(GarageCommandType.lights_on);
  static const lightsOff = GarageCommand(GarageCommandType.lights_off);
}

Map<Pair<GarageStateType, bool>, List<Pair<GarageCommand, Image>>> garageCommandsByState = {
  Pair(GarageStateType.retracted_latched, false): [
    Pair(GarageCommands.unlock, Image.asset('assets/images/unlock.png')),
    Pair(GarageCommands.deploy, Image.asset('assets/images/down_arrow.png')),
    Pair(GarageCommands.lightsOff, Image.asset('assets/images/light_off.png')),
  ],
  Pair(GarageStateType.retracted_latched, true): [
    Pair(GarageCommands.unlock, Image.asset('assets/images/unlock.png')),
    Pair(GarageCommands.deploy, Image.asset('assets/images/down_arrow.png')),
    Pair(GarageCommands.lightsOn, Image.asset('assets/images/light.png')),
  ],
  Pair(GarageStateType.deployed, false): [
    Pair(GarageCommands.retract, Image.asset('assets/images/up_arrow.png')),
    Pair(GarageCommands.lightsOff, Image.asset('assets/images/light_off.png')),
  ],
  Pair(GarageStateType.deployed, true): [
    Pair(GarageCommands.retract, Image.asset('assets/images/up_arrow.png')),
        Pair(GarageCommands.lightsOn, Image.asset('assets/images/light.png')),

  ],
  Pair(GarageStateType.retracted_unlatched, false): [
    Pair(GarageCommands.lock, Image.asset('assets/images/lock.png')),
    Pair(GarageCommands.deploy, Image.asset('assets/images/down_arrow.png')),
    Pair(GarageCommands.lightsOff, Image.asset('assets/images/light_off.png')),
  ],
  Pair(GarageStateType.retracted_unlatched, true): [
    Pair(GarageCommands.lock, Image.asset('assets/images/lock.png')),
    Pair(GarageCommands.deploy, Image.asset('assets/images/down_arrow.png')),
        Pair(GarageCommands.lightsOn, Image.asset('assets/images/light.png')),

  ],
};
