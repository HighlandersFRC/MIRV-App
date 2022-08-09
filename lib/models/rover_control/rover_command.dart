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

  const factory RoverCommand.destinationCommand(
    RoverCommandTypeDrivetrain command,
    RoverCommandParameters commandParameters, {
    @Default(RoverSubsystemType.drivetrain) RoverSubsystemType subsystem,
  }) = DrivetrainRoverCommandDestination;

  const factory RoverCommand.piLitCommand(
    RoverCommandTypePiLit command, {
    @Default(RoverSubsystemType.pi_lit) RoverSubsystemType subsystem,
  }) = PiLitRoverCommand;

  factory RoverCommand.fromJson(Map<String, dynamic> json) => _$RoverCommandFromJson(json);
}

@freezed
class RoverCommandParameters with _$RoverCommandParameters {
  const factory RoverCommandParameters.drivetrain(double x, double y) = RoverCommandParametersDrivetrain;
  const factory RoverCommandParameters.destination(double lat, double long) = RoverCommandParametersDestination;
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
  static const unloadPiLits = RoverCommand.intakeCommand(RoverCommandTypeIntake.unload_pi_lits);
  static const loadPiLits = RoverCommand.intakeCommand(RoverCommandTypeIntake.load_pi_lits);
  static const deployIntake = RoverCommand.intakeCommand(RoverCommandTypeIntake.deploy_intake);
  static const retractIntake = RoverCommand.intakeCommand(RoverCommandTypeIntake.retract_intake);
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
  static const idle = RoverCommand.piLitCommand(RoverCommandTypePiLit.idle);
  static const wave = RoverCommand.piLitCommand(RoverCommandTypePiLit.wave);
  static const waveReverse = RoverCommand.piLitCommand(RoverCommandTypePiLit.wave_reverse);
  static const simultaneous = RoverCommand.piLitCommand(RoverCommandTypePiLit.simultaneous);
  static const setNumberPiLits = RoverCommand.piLitCommand(RoverCommandTypePiLit.set_number_pi_lits);
}

class RoverDrivetrainCommands {
  static DrivetrainRoverCommand drivetrainCommand(RoverCommandTypeDrivetrain command, double x, double y) {
    return DrivetrainRoverCommand(command, RoverCommandParameters.drivetrain(x, y));
  }

  static DrivetrainRoverCommand destinationCommand(RoverCommandTypeDrivetrain command, double lat, double long) {
    return DrivetrainRoverCommand(command, RoverCommandParameters.destination(lat, long));
  }
}

Map<Pair<RoverStateType, bool>, List<Pair<RoverCommand, Image>>> roverCommandsByState = {
  // Pair(RoverStateType.disconnected, false): [],
  // Pair(RoverStateType.e_stop, false): [],
  // Pair(RoverStateType.disconnected_fault, false): [],
  // Pair(RoverStateType.connected_disabled, false): [],
  // Pair(RoverStateType.connected_fault, false): [],
  Pair(RoverStateType.connected_idle, false): [
    Pair(RoverGeneralCommands.stow, Image.asset('assets/images/home.png')),
    // Pair(RoverGeneralCommands.deployPiLits, Image.asset('assets/images/pi_lit_outline_down.png')),
    Pair(RoverGeneralCommands.retrievePiLits, Image.asset('assets/images/pi_lit_outline_up.png')),
  ],
  Pair(RoverStateType.connected_idle, true): [
    Pair(RoverGeneralCommands.deploy, Image.asset('assets/images/ramp.png')),
  ],
  Pair(RoverStateType.autonomous, false): [
    Pair(RoverGeneralCommands.cancel, Image.asset('assets/images/cancel.png')),
  ],
  Pair(RoverStateType.remote_operation, false): [
    Pair(RoverGeneralCommands.disableRemoteOperation, Image.asset('assets/images/cancel.png')),
    Pair(RoverIntakeCommands.placeOnePiLit, Image.asset('assets/images/pi_lit_outline_down.png')),
    Pair(RoverIntakeCommands.pickupOnePiLit, Image.asset('assets/images/pi_lit_outline_up.png')),
  ],
};
