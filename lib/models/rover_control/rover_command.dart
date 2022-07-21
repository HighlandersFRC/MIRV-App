import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';
import 'package:mirv/models/rover_state_type.dart';

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
    @Default(RoverSubsystemType.general) RoverSubsystemType subsystem,
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
  static const heartBeat = RoverCommand.heartbeatCommand(RoverCommandTypeHeartbeat.heartbeat);
}

class RoverIntakeCommands {
  static const disable = RoverCommand.intakeCommand(RoverCommandTypeIntake.disable);
  static const reset = RoverCommand.intakeCommand(RoverCommandTypeIntake.reset);
  static const intake = RoverCommand.intakeCommand(RoverCommandTypeIntake.intake);
  static const store = RoverCommand.intakeCommand(RoverCommandTypeIntake.store);
  static const deposit = RoverCommand.intakeCommand(RoverCommandTypeIntake.deposit);
  static const switchLeft = RoverCommand.intakeCommand(RoverCommandTypeIntake.switch_left);
  static const switchRight = RoverCommand.intakeCommand(RoverCommandTypeIntake.switch_right);
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
  RoverStateType.disconnected: [
    // Pair(RoverGeneralCommands.connect, "Connect"), /// not a real command
  ],
  RoverStateType.e_stop: [],
  RoverStateType.disconnected_fault: [],
  RoverStateType.connected_disabled: [
    // Pair(RoverGeneralCommands.enable, "Enable"),
  ],
  RoverStateType.connected_fault: [
    // Pair(RoverGeneralCommands.recover, "Recover"), // not a real command
  ],
  RoverStateType.connected_idle_roaming: [
    // Pair(RoverGeneralCommands.disable, "Disable"),
    // Pair(RoverGeneralCommands.eStop, "E-Stop"),
    Pair(RoverGeneralCommands.stow, Image.asset('assets/images/home.png')),
    Pair(RoverGeneralCommands.deployPiLits, Image.asset('assets/images/pi_lit_outline_down.png')),
    Pair(RoverGeneralCommands.retrievePiLits, Image.asset('assets/images/pi_lit_outline_up.png')),
    // Pair(RoverIntakeCommands.disable, "Disable Intake"),
    // Pair(RoverIntakeCommands.reset, "Reset Intake"),
    // Pair(RoverIntakeCommands.intake, "Intake w/ Intake"),
    // Pair(RoverIntakeCommands.store, "Store Intake"),
    // Pair(RoverIntakeCommands.deposit, "Deposit w/ Intake"),
    // Pair(RoverIntakeCommands.switchLeft, "Switch Left Intake"),
    // Pair(RoverIntakeCommands.switchRight, "Switch Right Intake"),
  ],
  RoverStateType.autonomous: [
    // Pair(RoverGeneralCommands.eStop, "E-Stop"),
    Pair(RoverGeneralCommands.deploy, Image.asset('assets/images/cancel.png')),
    // Pair(RoverGeneralCommands.cancel, "Cancel Current Command"),
  ],
  RoverStateType.remote_operation: [
    // Pair(RoverGeneralCommands.eStop, "E-Stop"),
    Pair(RoverGeneralCommands.deploy, Image.asset('assets/images/cancel.png')),
    // Pair(RoverGeneralCommands.cancel, "Cancel Current Command"),
  ],
  RoverStateType.connected_idle_docked: [
    Pair(RoverGeneralCommands.deploy, Image.asset('assets/images/ramp.png')),
  ],
};
