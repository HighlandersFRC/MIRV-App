import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/gamepad/gamepad_command_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';

class JoystickController {
  final RoverDriveControlType driveType;

  late Stream<RoverCommand> drivetrainCommandStream;

  final StreamController<GamepadCommand> _commandStreamController = StreamController<GamepadCommand>.broadcast();
  Stream<GamepadCommand> get commandStream => _commandStreamController.stream.asBroadcastStream();
  Stream<GamepadAxisCommand> get axisStreamLeft => commandStream
      .where((cmd) => cmd.type == GamepadCommandType.axis && cmd.command.type == GamepadAxisType.left)
      .map((cmd) => cmd.command as GamepadAxisCommand);
  Stream<GamepadAxisCommand> get axisStreamRight => commandStream
      .where((cmd) => cmd.type == GamepadCommandType.axis && cmd.command.type == GamepadAxisType.right)
      .map((cmd) => cmd.command as GamepadAxisCommand);

  JoystickController({this.driveType = RoverDriveControlType.arcade}) {
    drivetrainCommandStream = Rx.combineLatest2(axisStreamLeft, axisStreamRight,
        (GamepadAxisCommand left, GamepadAxisCommand right) => _getJoystickCommandOutput(driveType, left, right));

    Timer(const Duration(seconds: 1), _initializeStreams);
  }

  _initializeStreams() {
    _commandStreamController.add(GamepadCommand(
        command: const GamepadAxisCommand(x: 0.0, y: 0.0, type: GamepadAxisType.right), type: GamepadCommandType.axis));
    _commandStreamController.add(GamepadCommand(
        command: const GamepadAxisCommand(x: 0.0, y: 0.0, type: GamepadAxisType.left), type: GamepadCommandType.axis));
  }

  // Only arcade is supported currently
  RoverCommand _getJoystickCommandOutput(
      RoverDriveControlType driveType, GamepadAxisCommand leftStick, GamepadAxisCommand rightStick) {
    switch (driveType) {
      case RoverDriveControlType.arcade:
        return RoverDrivetrainCommands.drivetrainCommand(rightStick.x, leftStick.y);
      // case RoverDriveControlType.single:
      //   return RoverDrivetrainCommands.drivetrainCommand(RoverCommandTypeDrivetrain.arcade, leftStick.x, leftStick.y);
      // case RoverDriveControlType.tank:
      //   return RoverDrivetrainCommands.drivetrainCommand(RoverCommandTypeDrivetrain.arcade, leftStick.y, rightStick.y);
    }
  }

  void addJoystickCommand(GamepadCommand command) {
    _commandStreamController.add(command);
  }

  GamepadAxisType getAxisType(String axisString) {
    switch (axisString.toLowerCase()) {
      case "stick_right":
        return GamepadAxisType.right;
      case "stick_left":
        return GamepadAxisType.left;
      default:
        return GamepadAxisType.right;
    }
  }
}
