import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';

class JoystickWidget extends StatelessWidget {
  final RoverMetrics roverMetrics;
  final Function(GamepadAxisType, double, double) onJoystickChanged;
  late GamepadAxisType axisType;
  late JoystickMode joystickMode;
  late final bool? isEnabled;

  JoystickWidget({
    Key? key,
    required this.roverMetrics,
    required this.onJoystickChanged,
    required this.axisType,
  }) : super(key: key) {
    isEnabled = _cancelState(roverMetrics.state);
    joystickMode = _getJoystickMode(axisType);
  }

  bool _cancelState(RoverStateType? roverState) {
    switch (roverState) {
      case RoverStateType.connected_idle_roaming:
        return true;
      default:
        return false;
    }
  }

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
