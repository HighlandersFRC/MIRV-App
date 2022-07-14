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

  factory RoverCommand.fromJson(Map<String, dynamic> json) =>
      _$RoverCommandFromJson(json);
}

@freezed
class RoverCommandParameters with _$RoverCommandParameters {
  const factory RoverCommandParameters.drivetrain(double x, double y) =
      RoverCommandParametersDrivetrain;
  const factory RoverCommandParameters.movement(double lat, double long) =
      RoverCommandParametersMovement;

  factory RoverCommandParameters.fromJson(Map<String, dynamic> json) =>
      _$RoverCommandParametersFromJson(json);
}

class RoverGeneralCommands {
  static const eStop =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.e_stop);
  static const disable =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.disable);
  static const enable =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.enable);
  static const deploy =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy);
  static const stow = RoverCommand.generalCommand(RoverCommandTypeGeneral.stow);
  static const startManualControl =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.start_manual_control);
  static const stopManualControl =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.stop_manual_control);
  static const deployPiLits =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.deploy_pi_lits);
  static const retrievePiLits =
      RoverCommand.generalCommand(RoverCommandTypeGeneral.retrieve_pi_lits);
}

class RoverIntakeCommands {
  static const disable =
      RoverCommand.intakeCommand(RoverCommandTypeIntake.disable);
  static const reset = RoverCommand.intakeCommand(RoverCommandTypeIntake.reset);
  static const intake =
      RoverCommand.intakeCommand(RoverCommandTypeIntake.intake);
  static const store = RoverCommand.intakeCommand(RoverCommandTypeIntake.store);
  static const deposit =
      RoverCommand.intakeCommand(RoverCommandTypeIntake.deposit);
  static const switchLeft =
      RoverCommand.intakeCommand(RoverCommandTypeIntake.switch_left);
  static const switchRight =
      RoverCommand.intakeCommand(RoverCommandTypeIntake.switch_right);
}

class RoverDrivetrainCommands {
  static DrivetrainRoverCommand drivetrainCommand(
      RoverCommandTypeDrivetrain command, double x, double y) {
    return DrivetrainRoverCommand(
        command, RoverCommandParameters.drivetrain(x, y));
  }
}

class RoverMovementCommands {
  static MovementRoverCommand movementCommand(
      RoverCommandTypeMovement command, double lat, double long) {
    return MovementRoverCommand(
        command, RoverCommandParameters.movement(lat, long));
  }
}

Map<RoverStateType, List<Pair<RoverCommand, String>>> roverCommandsByState = {
  RoverStateType.disconnected: [],
  RoverStateType.e_stop: [],
  RoverStateType.remote_operation: [
    Pair(RoverGeneralCommands.stow, "Stow"),
    Pair(RoverGeneralCommands.deployPiLits, "Deploy Pi Lits"),
    Pair(RoverGeneralCommands.retrievePiLits, "Retrieve Pi Lits"),
    Pair(RoverIntakeCommands.disable, "Disable Intake"),
    Pair(RoverIntakeCommands.reset, "Reset Intake"),
    Pair(RoverIntakeCommands.intake, "Intake w/ Intake"),
    Pair(RoverIntakeCommands.store, "Store Intake"),
    Pair(RoverIntakeCommands.deposit, "Deposit w/ Intake"),
    Pair(RoverIntakeCommands.switchLeft, "Switch Left Intake"),
    Pair(RoverIntakeCommands.switchRight, "Switch Right Intake"),
  ],
  RoverStateType.connected_idle_docked: [
    Pair(RoverGeneralCommands.deploy, "Deploy"),
  ],
};
