import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/gamepad/gamepad_axis_type.dart';
import 'package:test/models/gamepad/gamepad_command_type.dart';
import 'package:test/models/gamepad/gamepad_event_types.dart';
import 'package:test/models/rover_control/rover_command.dart';
import 'package:test/models/rover_control/rover_command_type.dart';

class GamepadController {
  static const eventChannel = EventChannel('com.example.test/gamepad_channel');
  late StreamSubscription _eventChannel;
  Timer? controllerTimer;
  final RoverDriveControlType driveType;

  final StreamController<GamepadCommand> _commandStreamController = StreamController<GamepadCommand>.broadcast();
  Stream<GamepadCommand> get commandStream => _commandStreamController.stream.asBroadcastStream();
  Stream<GamepadAxisCommand> get axisStreamLeft => _commandStreamController.stream
      .asBroadcastStream()
      .where((cmd) => cmd.type == GamepadCommandType.axis && cmd.command.type == GamepadAxisType.left)
      .map((cmd) => cmd.command as GamepadAxisCommand);
  Stream<GamepadAxisCommand> get axisStreamRight => _commandStreamController.stream
      .asBroadcastStream()
      .where((cmd) => cmd.type == GamepadCommandType.axis && cmd.command.type == GamepadAxisType.right)
      .map((cmd) => cmd.command as GamepadAxisCommand);

  final StreamController<DrivetrainRoverCommand> _drivetrainCommandStreamController =
      StreamController<DrivetrainRoverCommand>.broadcast();
  Stream<DrivetrainRoverCommand> get drivetrainCommandStream => _drivetrainCommandStreamController.stream.asBroadcastStream();

  GamepadController({this.driveType = RoverDriveControlType.arcade}) {
    controllerTimer = Timer.periodic(
      Duration(milliseconds: 100),
      (Timer t) async {
        var latestLeft = await axisStreamLeft.last;
        var latestRight = await axisStreamRight.last;

        _drivetrainCommandStreamController.add(_getJoystickCommandOutput(driveType, latestLeft, latestRight));
      },
    );
  }

  dispose() {
    controllerTimer?.cancel();
  }

  DrivetrainRoverCommand _getJoystickCommandOutput(
      RoverDriveControlType driveType, GamepadAxisCommand leftStick, GamepadAxisCommand rightStick) {
    switch (driveType) {
      case RoverDriveControlType.arcade:
        return DrivetrainRoverCommand(RoverCommandTypeDrivetrain.arcade, rightStick.x, leftStick.y);
      case RoverDriveControlType.single:
        return DrivetrainRoverCommand(RoverCommandTypeDrivetrain.arcade, leftStick.x, leftStick.y);
      case RoverDriveControlType.tank:
        return DrivetrainRoverCommand(RoverCommandTypeDrivetrain.arcade, leftStick.y, rightStick.y);
      default:
        return DrivetrainRoverCommand(RoverCommandTypeDrivetrain.arcade, leftStick.y, rightStick.y);
    }
  }

  // Joysticks
  // {androidType: AXIS, sourceInput: STICK_RIGHT, x: 1.0, y: 0.0}
  // {androidType: AXIS, sourceInput: STICK_LEFT, x: 0.15455866, y: 0.0}
  // released: 0

  // D-pad
  // left: 1 {androidType: DPAD, direction: 1}
  // down: 3
  // right: 2
  // up: 0
  // released: -1 {androidType: DPAD, direction: -1}

  // xyab
  // X: {androidType: BUTTON, keyAction: ACTION_DOWN, keyCode: 99}
  // x released: {androidType: BUTTON, keyAction: ACTION_UP, keyCode: 99}
  // x: keyCode 99
  // y: keyCode 100
  // a: keyCode 96
  // b: keyCode 97
  // bumper left: 102
  // bumper right: 103
  // connect/rectangle: 109
  // menu: 108
  // open/up center: 130
  // left stick click: 106
  // right stick click: 107

  // triggers: {androidType: DPAD, direction: -1} (unusable)

  void setJoystickListener() {
    _eventChannel = eventChannel.receiveBroadcastStream().listen((event) {
      final eventParameters = <String, dynamic>{};

      if (event != null && event is String) {
        event.split(',~').forEach((e) {
          var createPairList = e.split('=');

          eventParameters[createPairList[0]] = createPairList[1];
        });
      }

      if (eventParameters[GamepadEventTypes.androidType] == GamepadEventTypes.button) {
        print('BUTTON: $eventParameters');
      } else if (eventParameters[GamepadEventTypes.androidType] == GamepadEventTypes.axis) {
        print('AXIS: $eventParameters');
        var axisType = getAxisType(eventParameters['sourceInput']);
        GamepadAxisCommand axisCommand = GamepadAxisCommand(
            x: double.parse(eventParameters['x']), y: double.parse(eventParameters['y']), type: axisType, ts: DateTime.now());

        if (axisType == GamepadAxisType.left) {
          axisCommand = GamepadAxisCommand(x: 0.0, y: double.parse(eventParameters['y']), type: axisType, ts: DateTime.now());
        } else {
          axisCommand = GamepadAxisCommand(x: double.parse(eventParameters['x']), y: 0.0, type: axisType, ts: DateTime.now());
        }

        GamepadCommand command = GamepadCommand(command: axisCommand, type: GamepadCommandType.axis);
        _commandStreamController.add(command);
      } else if (eventParameters[GamepadEventTypes.androidType] == GamepadEventTypes.dpad) {
        print('DPAD: $eventParameters');
      }
    });
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

  void cancel() {
    _eventChannel.cancel();
  }
}
