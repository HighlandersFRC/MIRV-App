import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirv/control_pad/views/horizontal_joystick_view.dart';
import 'package:mirv/control_pad/views/vertical_joystick_view.dart';
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
          padding: const EdgeInsets.only(left: 140.0),
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
