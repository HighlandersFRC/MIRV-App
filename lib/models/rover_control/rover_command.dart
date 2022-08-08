import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/garage/garage_command_type.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/pi_lit_formation_type.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

part 'rover_command.freezed.dart';
part 'rover_command.g.dart';

@freezed
class RoverCommand with _$RoverCommand {
  const factory RoverCommand.generalCommand(
    RoverCommandTypeGeneral command, {
    RoverCommandParameters? commandParameters,
    @Default(RoverSubsystemType.general) RoverSubsystemType subsystem,
  }) = GeneralRoverCommand;

  const factory RoverCommand.heartbeatCommand(
    RoverCommandTypeHeartbeat command, {
    @Default(RoverSubsystemType.heartbeat) RoverSubsystemType subsystem,
  }) = HeartbeatRoverCommand;

  const factory RoverCommand.intakeCommand(
    RoverCommandTypeIntake command, {
    @Default(RoverSubsystemType.intake) RoverSubsystemType subsystem,
  }) = IntakeRoverCommand;

  const factory RoverCommand.garageCommand(
    GarageCommandType command, {
    @Default(RoverSubsystemType.garage) RoverSubsystemType subsystem,
  }) = GarageRoverCommand;

  const factory RoverCommand.drivetrainCommand(
    RoverCommandTypeDrivetrain command,
    RoverCommandParameters commandParameters, {
    @Default(RoverSubsystemType.drivetrain) RoverSubsystemType subsystem,
  }) = DrivetrainRoverCommand;

  const factory RoverCommand.movementCommand(
    RoverCommandTypeMovement command,
    RoverCommandParameters commandParameters, {
    @Default(RoverSubsystemType.movement) RoverSubsystemType subsystem,
  }) = MovementRoverCommand;

  const factory RoverCommand.piLitCommand(
    RoverCommandTypePiLit command, {
    @Default(RoverSubsystemType.pi_lit) RoverSubsystemType subsystem,
  }) = PiLitRoverCommand;

  factory RoverCommand.fromJson(Map<String, dynamic> json) => _$RoverCommandFromJson(json);
}

@freezed
class RoverCommandParameters with _$RoverCommandParameters {
  const factory RoverCommandParameters.drivetrain(double x, double y) = RoverCommandParametersDrivetrain;
  const factory RoverCommandParameters.movement(double lat, double long) = RoverCommandParametersMovement;
  const factory RoverCommandParameters.piLitPlacement(DeviceLocation location, PiLitFormationType formation) =
      RoverCommandParametersPiLitPlacement;

  factory RoverCommandParameters.fromJson(Map<String, dynamic> json) => _$RoverCommandParametersFromJson(json);
}

class RoverGeneralCommands {
  static const eStop = RoverCommand.generalCommand(RoverCommandTypeGeneral.e_stop);
  static const disable = RoverCommand.generalCommand(RoverCommandTypeGeneral.disable);
  static const enable = RoverCommand.generalCommand(RoverCommandTypeGeneral.enable);
  static const deploy = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy);
  static const cancel = RoverCommand.generalCommand(RoverCommandTypeGeneral.cancel);
  static const stow = RoverCommand.generalCommand(RoverCommandTypeGeneral.stow);
  static const retrievePiLits = RoverCommand.generalCommand(RoverCommandTypeGeneral.retrieve_pi_lits);
  static const enableRemoteOperation = RoverCommand.generalCommand(RoverCommandTypeGeneral.enable_remote_operation);
  static const disableRemoteOperation = RoverCommand.generalCommand(RoverCommandTypeGeneral.disable_remote_operation);
  static GeneralRoverCommand deployPiLits(PiLitFormationType formation, DeviceLocation location) {
    return GeneralRoverCommand(RoverCommandTypeGeneral.deploy_pi_lits,
        commandParameters: RoverCommandParametersPiLitPlacement(location, formation));
  }
}

class RoverHeartbeatCommands {
  static const heartbeat = RoverCommand.heartbeatCommand(RoverCommandTypeHeartbeat.heartbeat);
}

class RoverIntakeCommands {
  static const placeOnePiLit = RoverCommand.intakeCommand(RoverCommandTypeIntake.place_1_pi_lit);
  static const pickupOnePiLit = RoverCommand.intakeCommand(RoverCommandTypeIntake.pickup_1_pi_lit);
}

class RoverGarageCommands {
  static const lock = RoverCommand.garageCommand(GarageCommandType.lock);
  static const unlock = RoverCommand.garageCommand(GarageCommandType.unlock);
  static const retract = RoverCommand.garageCommand(GarageCommandType.retract);
  static const deploy = RoverCommand.garageCommand(GarageCommandType.deploy);
  static const lightsOn = RoverCommand.garageCommand(GarageCommandType.lights_on);
  static const lightsOff = RoverCommand.garageCommand(GarageCommandType.lights_off);
}

class RoverPiLitCommands {
  static const off = RoverCommand.piLitCommand(RoverCommandTypePiLit.off);
  static const idle = RoverCommand.piLitCommand(RoverCommandTypePiLit.idle);
  static const sequential = RoverCommand.piLitCommand(RoverCommandTypePiLit.sequential);
  static const reverseSequential = RoverCommand.piLitCommand(RoverCommandTypePiLit.reverse_sequential);
  static const parallel = RoverCommand.piLitCommand(RoverCommandTypePiLit.parallel);
}

//TODO:make new commands for rover pilit placement
class RoverPiLitDeployCommands {
  static const piLit7Spear = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy_pi_lits);
  static const piLit5Taper = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy_pi_lits);
  static const piLit3Type1 = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy_pi_lits);
  static const piLit3Type2 = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy_pi_lits);
  static const piLit3Type3 = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy_pi_lits);
}

class RoverDrivetrainCommands {
  static DrivetrainRoverCommand drivetrainCommand(RoverCommandTypeDrivetrain command, double x, double y) {
    return DrivetrainRoverCommand(command, RoverCommandParameters.drivetrain(x, y));
  }
}

class RoverMovementCommands {
  static MovementRoverCommand movementCommand(RoverCommandTypeMovement command, double lat, double long) {
    return MovementRoverCommand(command, RoverCommandParameters.movement(lat, long));
  }
}

Map<RoverStateType, List<Pair<RoverCommand, Image>>> roverCommandsByState = {
  RoverStateType.disconnected: [],
  RoverStateType.e_stop: [],
  RoverStateType.disconnected_fault: [],
  RoverStateType.connected_disabled: [],
  RoverStateType.connected_fault: [
    // Pair(RoverGeneralCommands.recover, "Recover"), // not a real command
  ],
  RoverStateType.connected_idle: [
    Pair(RoverGeneralCommands.stow, Image.asset('assets/images/home.png')),
    // TODO: Switch allowed commands based on docked boolean
    Pair(RoverGeneralCommands.deploy, Image.asset('assets/images/ramp.png')),
    // Pair(RoverGeneralCommands.deployPiLits, Image.asset('assets/images/pi_lit_outline_down.png')),
    Pair(RoverGeneralCommands.retrievePiLits, Image.asset('assets/images/pi_lit_outline_up.png')),
  ],
  RoverStateType.autonomous: [
    Pair(RoverGeneralCommands.cancel, Image.asset('assets/images/cancel.png')),
  ],
  RoverStateType.remote_operation: [
    Pair(RoverGeneralCommands.disableRemoteOperation, Image.asset('assets/images/cancel.png')),
    Pair(RoverIntakeCommands.placeOnePiLit, Image.asset('assets/images/pi_lit_outline_down.png')),
    Pair(RoverIntakeCommands.pickupOnePiLit, Image.asset('assets/images/pi_lit_outline_up.png')),
  ],
};
