import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:mirv/control_pad/views/joystick_view.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

// ignore: must_be_immutable
class JoystickOverlay extends StatelessWidget {
  final RoverMetrics roverMetrics;
  final Function(GamepadAxisType, double, double) onJoystickChanged;
  final Function(RoverCommand) sendRoverCommand;
  late JoystickMode joystickMode;
  late final bool? isEnabled;

  JoystickOverlay({
    Key? key,
    required this.roverMetrics,
    required this.onJoystickChanged,
    required this.sendRoverCommand,
  }) : super(key: key) {
    isEnabled = _cancelState(roverMetrics.state);
  }

  bool _cancelState(RoverStateType? roverState) {
    switch (roverState) {
      case RoverStateType.connected_idle_roaming:
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Container(
            child: JoystickView(
              opacity: 0.5,
              size: 300,
              // onDirectionChanged: (x, y) {
              //   print("$x, $y");
              // },
            ),
          ),
        ),
        // JoystickWidget(
        //   roverMetrics: roverMetrics,
        //   onJoystickChanged: onJoystickChanged,
        //   axisType: GamepadAxisType.left,
        // ),
        const Spacer(),

        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Container(
            child: JoystickView(opacity: 0.5, size: 300),
          ),
        ),
        // JoystickWidget(
        //   roverMetrics: roverMetrics,
        //   onJoystickChanged: onJoystickChanged,
        //   axisType: GamepadAxisType.right,
        // ),
      ],
    );
  }
}
