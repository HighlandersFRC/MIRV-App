import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

// ignore: must_be_immutable
class JoystickWidget extends StatelessWidget {
  final RoverGarageState roverGarageState;
  final Function(GamepadAxisType, double, double) onJoystickChanged;
  late GamepadAxisType axisType;
  late JoystickMode joystickMode;
  late final bool? isEnabled;

  JoystickWidget({
    Key? key,
    required this.roverGarageState,
    required this.onJoystickChanged,
    required this.axisType,
  }) : super(key: key) {
    isEnabled = _cancelState(roverGarageState.state);
    joystickMode = _getJoystickMode(axisType);
  }

  bool _cancelState(RoverStateType roverState) => roverState == RoverStateType.idle;

  JoystickMode _getJoystickMode(GamepadAxisType axisType) {
    switch (axisType) {
      case GamepadAxisType.right:
        return JoystickMode.horizontal;
      default:
        return JoystickMode.vertical;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Joystick(
      mode: joystickMode,
      listener: (details) => onJoystickChanged(axisType, details.x, details.y),
      onStickDragEnd: isEnabled == true ? () => onJoystickChanged(axisType, 0.0, 0.0) : null,
    );
  }
}
