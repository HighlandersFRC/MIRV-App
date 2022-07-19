import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/cancel_auto_button.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/disable_toggle.dart';

class RightSideButtons extends StatefulWidget {
  const RightSideButtons(
      {Key? key,
      required this.roverMetrics,
      required this.sendCommand,
      required this.makeCall,
      required this.stopCall,
      required this.onJoystickChanged,
      required this.periodicMetricUpdates,
      required this.useGamepad,
      required this.width,
      required this.height})
      : super(key: key);
  final RoverMetrics roverMetrics;
  final Function() stopCall;
  final Function() makeCall;
  final Function(GamepadAxisType, double, double) onJoystickChanged;
  final get_pkg.Rx<bool> useGamepad;
  final double width;
  final double height;

  final Function(RoverCommand) sendCommand;
  final BehaviorSubject<RoverMetrics> periodicMetricUpdates;

  @override
  State<RightSideButtons> createState() => _RightSideButtonsState();
}

class _RightSideButtonsState extends State<RightSideButtons> {
  @override
  Widget build(BuildContext context) {
    const JoystickMode joystickMode = JoystickMode.horizontal;
    double heightEquivalent = widget.height > 600 ? 1 : widget.height / 400;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: heightEquivalent * 5),
          child: SizedBox(
            height: 40,
            child: StreamBuilder<RoverMetrics>(
                stream: widget.periodicMetricUpdates,
                builder: (context, snapshot) {
                  return CancelAuto(roverMetrics: snapshot.data, sendCommand: widget.sendCommand);
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: heightEquivalent * 5, bottom: heightEquivalent * 5),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: heightEquivalent * 5),
          child: SizedBox(
            height: 40,
            child: StreamBuilder<RoverMetrics>(
                stream: widget.periodicMetricUpdates,
                builder: (context, snapshot) {
                  return ToggleDisable(roverMetrics: snapshot.data, sendCommand: widget.sendCommand);
                }),
          ),
        ),
        SizedBox(
          height: heightEquivalent * 50,
          width: widget.width,
          child: ElevatedButton.icon(
            onPressed: () => widget.sendCommand(RoverGeneralCommands.eStop),
            label: const Text("E-STOP"),
            icon: const Icon(Icons.warning_amber_rounded),
            style: ButtonStyle(
              animationDuration: const Duration(seconds: 10),
              backgroundColor: MaterialStateProperty.all(Colors.red[700]),
              overlayColor: MaterialStateProperty.all(Colors.yellowAccent),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: heightEquivalent * 5),
            child: Row(
              children: [
                const Text("Use External\nController"),
                get_pkg.Obx(
                  () => Switch(
                      value: widget.useGamepad.value,
                      onChanged: (val) {
                        widget.useGamepad.value = !widget.useGamepad.value;
                      }),
                ),
              ],
            )),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: heightEquivalent * 5, right: 10, left: 10),
          child: SizedBox(
              child: (RoverStateType.remote_operation == RoverStateType.remote_operation)
                  ? Joystick(
                      mode: joystickMode,
                      listener: (details) => widget.onJoystickChanged(GamepadAxisType.right, details.x, details.y),
                      onStickDragEnd: () => widget.onJoystickChanged(GamepadAxisType.right, 0.0, 0.0),
                    )
                  : null),
        ),
      ],
    );
  }
}
