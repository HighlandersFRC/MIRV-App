import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_position.dart';
import 'package:mirv/models/garage/garage_position.dart';
import 'package:mirv/models/garage/garage_position.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/Garage/Garage_command_type.dart';
import 'package:mirv/models/Garage/Garage_state_type.dart';

part 'garage_commands.freezed.dart';
part 'garage_commands.g.dart';

@freezed
class GarageCommand with _$GarageCommand {
  const factory GarageCommand.generalCommand(
    GarageCommandTypeGeneral command, {
    @Default(GarageSubsystemType.general) GarageSubsystemType subsystem,
  }) = GeneralGarageCommand;

  factory GarageCommand.fromJson(Map<String, dynamic> json) => _$GarageCommandFromJson(json);
}

// @freezed
// class  GarageCommandParameters with _$GarageCommandParameters {
//   const factory  GarageCommandParameters.drivetrain(double x, double y) =  GarageCommandParametersDrivetrain;
//   const factory  GarageCommandParameters.movement(double lat, double long) =  GarageCommandParametersMovement;

//   factory  GarageCommandParameters.fromJson(Map<String, dynamic> json) => _$GarageCommandParametersFromJson(json);
// }

class GarageGeneralCommands {
  static const lock = GarageCommand.generalCommand(GarageCommandTypeGeneral.lock);
  static const unlock = GarageCommand.generalCommand(GarageCommandTypeGeneral.unlock);
  static GarageCommand retract = GarageCommand.generalCommand(GarageCommandTypeGeneral.retract);
  static GarageCommand deploy = GarageCommand.generalCommand(GarageCommandTypeGeneral.deploy);
  static GarageCommand enable = GarageCommand.generalCommand(GarageCommandTypeGeneral.enable);
}

// class  GarageMovementCommands {
//   static MovementGarageCommand movementCommand(GarageCommandTypeMovement command, double lat, double long) {
//     return MovementGarageCommand(command,  GarageCommandParameters.movement(lat, long));
//   }
// }

// GarageMetrics? garageMetrics;

Map<GaragePosition, List<Pair<GarageCommand, Image>>> garageCommandsByPosition = {
  GaragePosition.retracted_latched: [
    Pair(GarageGeneralCommands.unlock, Image.asset('assets/images/ramp.png')),
  ],
  GaragePosition.deployed: [
    Pair(GarageGeneralCommands.retract, Image.asset('assets/images/ramp.png')),
  ],
  GaragePosition.disabled: [
    Pair(GarageGeneralCommands.enable, Image.asset('assets/images/ramp.png')),
  ],
  GaragePosition.retracted_unlatched: [
    Pair(GarageGeneralCommands.lock, Image.asset('assets/images/ramp.png')),
    Pair(GarageGeneralCommands.deploy, Image.asset('assets/images/ramp.png')),
  ],
  GaragePosition.unavailable: [
    Pair(GarageGeneralCommands.retract, Image.asset('assets/images/ramp.png')),
  ],
};
