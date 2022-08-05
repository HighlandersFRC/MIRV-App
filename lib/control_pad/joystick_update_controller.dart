import 'dart:async';
import 'dart:collection';

import 'package:get/get.dart' as get_pkg;
import 'package:mirv/models/gamepad/gamepad_command_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/services/joystick_controller.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:observable/observable.dart';

class JoystickValue extends Observable {
  final double x;
  final double y;
  final DateTime? ts;

  JoystickValue(this.x, this.y, {this.ts});
}

class JoystickUpdateController {
  JoystickValue? _lastJoystickVal;
  bool lastPointZero = true;
  Timer? timerJoy;
  late Stream<DrivetrainRoverCommand> drivetrainCommandStream;
  final RoverDriveControlType driveType = RoverDriveControlType.arcade;
  final JoystickController controller;
  final GamepadAxisType axisType;

  JoystickUpdateController(this.controller, this.axisType) {
    startJoystickUpdates();
  }

  startJoystickUpdates() {
    timerJoy = Timer.periodic(
      Duration(milliseconds: 110),
      (Timer t) {
        if (lastPointZero && _lastJoystickVal == null) {
          return;
        }
        double x = _lastJoystickVal != null ? _lastJoystickVal!.x : 0.0;
        double y = _lastJoystickVal != null ? _lastJoystickVal!.y : 0.0;
        GamepadCommand command =
            GamepadCommand(type: GamepadCommandType.axis, command: GamepadAxisCommand(type: axisType, x: x, y: y));
        controller.addJoystickCommand(command);
        _lastJoystickVal = null;
      },
    );
  }

  setopJoystickUpdates() {
    timerJoy?.cancel();
  }

  updateJoystickVal(JoystickValue val) {
    _lastJoystickVal = val;
  }
}
