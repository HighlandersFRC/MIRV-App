import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/joystick_widget.dart';

class JoystickOverlay extends StatelessWidget {
  final RoverMetrics roverMetrics;
  final Function(GamepadAxisType, double, double) onJoystickChanged;
  final Rx<bool> manualOperation;
  late JoystickMode joystickMode;
  late final bool? isEnabled;

  JoystickOverlay({
    Key? key,
    required this.roverMetrics,
    required this.manualOperation,
    required this.onJoystickChanged,
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
                color: Color.fromRGBO(50, 50, 50, 0.5),
              ),
              child: IconButton(
                icon: Icon(CupertinoIcons.xmark_octagon),
                iconSize: 60,
                color: Colors.red,
                onPressed: () => manualOperation.value = false,
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
