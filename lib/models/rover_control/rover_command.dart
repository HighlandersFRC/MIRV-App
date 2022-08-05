import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

part 'rover_command.freezed.dart';
part 'rover_command.g.dart';

@freezed
class RoverCommand with _$RoverCommand {
  const factory RoverCommand.generalCommand(
    RoverCommandTypeGeneral command, {
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

  factory RoverCommand.fromJson(Map<String, dynamic> json) => _$RoverCommandFromJson(json);
}

@freezed
class RoverCommandParameters with _$RoverCommandParameters {
  const factory RoverCommandParameters.drivetrain(double x, double y) = RoverCommandParametersDrivetrain;
  const factory RoverCommandParameters.movement(double lat, double long) = RoverCommandParametersMovement;

  factory RoverCommandParameters.fromJson(Map<String, dynamic> json) => _$RoverCommandParametersFromJson(json);
}

class RoverGeneralCommands {
  static const eStop = RoverCommand.generalCommand(RoverCommandTypeGeneral.e_stop);
  static const disable = RoverCommand.generalCommand(RoverCommandTypeGeneral.disable);
  static const enable = RoverCommand.generalCommand(RoverCommandTypeGeneral.enable);
  static const deploy = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy);
  static const cancel = RoverCommand.generalCommand(RoverCommandTypeGeneral.cancel);
  static const stow = RoverCommand.generalCommand(RoverCommandTypeGeneral.stow);
  static const deployPiLits = RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy_pi_lits);
  static const retrievePiLits = RoverCommand.generalCommand(RoverCommandTypeGeneral.retrieve_pi_lits);
  static const enableRemoteOperation = RoverCommand.generalCommand(RoverCommandTypeGeneral.enable_remote_operation);
  static const disableRemoteOperation = RoverCommand.generalCommand(RoverCommandTypeGeneral.disable_remote_operation);
}

class RoverHeartbeatCommands {
  static const heartbeat = RoverCommand.heartbeatCommand(RoverCommandTypeHeartbeat.heartbeat);
}

class RoverIntakeCommands {
  static const placeOnePiLit = RoverCommand.intakeCommand(RoverCommandTypeIntake.place_1_pi_lit);
  static const pickupOnePiLit = RoverCommand.intakeCommand(RoverCommandTypeIntake.pickup_1_pi_lit);
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
  RoverStateType.connected_idle_roaming: [
    Pair(RoverGeneralCommands.stow, Image.asset('assets/images/home.png')),
    Pair(RoverGeneralCommands.deployPiLits, Image.asset('assets/images/pi_lit_outline_down.png')),
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
  RoverStateType.connected_idle_docked: [
    Pair(RoverGeneralCommands.deploy, Image.asset('assets/images/ramp.png')),
  ],
};
