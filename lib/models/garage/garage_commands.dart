import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  static const up = GarageCommand.generalCommand(GarageCommandTypeGeneral.up);
  static const down = GarageCommand.generalCommand(GarageCommandTypeGeneral.down);
}

// class  GarageMovementCommands {
//   static MovementGarageCommand movementCommand(GarageCommandTypeMovement command, double lat, double long) {
//     return MovementGarageCommand(command,  GarageCommandParameters.movement(lat, long));
//   }
// }

Map<GarageStateType, List<Pair<GarageCommand, Image>>> garageCommandsByState = {
  GarageStateType.locked: [
    // Pair(.eStop, "E-Stop"),
    Pair(GarageGeneralCommands.unlock, Image.asset('assets/images/cancel.png')),
    // Pair( GarageGeneralCommands.cancel, "Cancel Current Command"),
  ],
  GarageStateType.unlocked: [
    // Pair( GarageGeneralCommands.eStop, "E-Stop"),
    Pair(GarageGeneralCommands.lock, Image.asset('assets/images/cancel.png')),
    // Pair( GarageGeneralCommands.cancel, "Cancel Current Command"),
  ],
  GarageStateType.up: [
    Pair(GarageGeneralCommands.down, Image.asset('assets/images/ramp.png')),
  ],
  GarageStateType.down: [
    Pair(GarageGeneralCommands.up, Image.asset('assets/images/ramp.png')),
  ],
};
