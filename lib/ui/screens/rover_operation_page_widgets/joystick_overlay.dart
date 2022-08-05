import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:mirv/control_pad/views/horizontal_joystick_view.dart';
import 'package:mirv/control_pad/views/joystick_view.dart';
import 'package:mirv/control_pad/views/vertical_joystick_view.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/services/joystick_controller.dart';

// ignore: must_be_immutable
class JoystickOverlay extends StatelessWidget {
  final JoystickController joystickController;
  const JoystickOverlay({
    Key? key,
    required this.joystickController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: VerticalJoystickView(
            joystickController,
            opacity: 0.8,
            size: 300,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: HorizontalJoystickView(
            joystickController,
            opacity: 0.8,
            size: 300,
          ),
        ),
      ],
    );
  }
}
