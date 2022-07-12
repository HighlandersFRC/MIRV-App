import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';

part 'rover_command.freezed.dart';
part 'rover_command.g.dart';

@freezed
class RoverCommand with _$RoverCommand {
  const factory RoverCommand.generalCommand(
    RoverCommandTypeGeneral commandType, {
    @Default(RoverSubsystemType.general) RoverSubsystemType subsystem,
  }) = GeneralRoverCommand;

  const factory RoverCommand.intakeCommand(
    RoverCommandTypeIntake commandType, {
    @Default(RoverSubsystemType.intake) RoverSubsystemType subsystem,
  }) = IntakeRoverCommand;

  const factory RoverCommand.drivetrainCommand(
    RoverCommandTypeDrivetrain commandType,
    double x,
    double y, {
    @Default(RoverSubsystemType.drivetrain) RoverSubsystemType subsystem,
  }) = DrivetrainRoverCommand;

  factory RoverCommand.fromJson(Map<String, dynamic> json) => _$RoverCommandFromJson(json);
}
