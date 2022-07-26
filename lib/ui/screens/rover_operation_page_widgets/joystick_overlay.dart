import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/joystick_widget.dart';

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
        JoystickWidget(
          roverMetrics: roverMetrics,
          onJoystickChanged: onJoystickChanged,
          axisType: GamepadAxisType.left,
        ),
        const Spacer(),
        Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color.fromRGBO(50, 50, 50, 0.5),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(0, 255, 255, 0)),
                  overlayColor: MaterialStateProperty.all(const Color.fromARGB(86, 255, 0, 0)),
                  // foregroundColor: MaterialStateProperty.all(const Color.fromARGB(148, 255, 0, 0)),
                  shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)))),
                ),
                onPressed: () {
                  Get.snackbar('Manual Control Disabled', 'You have cancelled Manual Control',
                      backgroundColor: const Color.fromARGB(114, 113, 0, 0));
                  sendRoverCommand(RoverGeneralCommands.disableRemoteOperation);
                },
                child: const Icon(
                  CupertinoIcons.xmark_octagon,
                  size: 60,
                  color: Colors.red,
                ),
              ),
            )),
        JoystickWidget(
          roverMetrics: roverMetrics,
          onJoystickChanged: onJoystickChanged,
          axisType: GamepadAxisType.right,
        ),
      ],
    );
  }
}
