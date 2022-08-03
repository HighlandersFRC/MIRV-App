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
        Container(
          child: JoystickView(
            opacity: 0.5,
            size: 300,
            onDirectionChanged: (x, y) {
              print("$x, $y");
            },
          ),
        ),
        // JoystickWidget(
        //   roverMetrics: roverMetrics,
        //   onJoystickChanged: onJoystickChanged,
        //   axisType: GamepadAxisType.left,
        // ),
        const Spacer(),

        Container(
          child: JoystickView(opacity: 0.5, size: 300),
        ),
        // JoystickWidget(
        //   roverMetrics: roverMetrics,
        //   onJoystickChanged: onJoystickChanged,
        //   axisType: GamepadAxisType.right,
        // ),

        Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color.fromRGBO(50, 50, 50, 0.5),
              ),
              child: IconButton(
                icon: const Icon(CupertinoIcons.xmark_octagon),
                iconSize: 60,
                color: Colors.red,
                onPressed: () {
                  sendRoverCommand(RoverGeneralCommands.disableRemoteOperation);
                },
              ),
            )),
      ],
    );
  }
}
