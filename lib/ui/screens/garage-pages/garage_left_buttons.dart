import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/rover_new_op_page.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/cancel_auto_button.dart';

class LeftSideButtons extends StatefulWidget {
  //final RoverMetrics roverMetrics;
  final GarageMetrics garageMetrics;
  final MirvApi mirvApi;
  final Function(GarageCommand) sendCommand;
  final dynamic periodicMetricUpdates;
  final MapSelectionController mapSelectionController;
  final double width;
  final double height;
  final Function(GamepadAxisType, double, double) onJoystickChanged;
  const LeftSideButtons({
    Key? key,
    required this.garageMetrics,
    required this.periodicMetricUpdates,
    required this.sendCommand,
    required this.mapSelectionController,
    required this.mirvApi,
    required this.width,
    required this.height,
    required this.onJoystickChanged,
  }) : super(key: key);

  @override
  State<LeftSideButtons> createState() => _LeftSideButtonsState();
}

class _LeftSideButtonsState extends State<LeftSideButtons> {
  OverlayEntry? entry;
  late List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    const JoystickMode joystickMode = JoystickMode.vertical;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => SizedBox(
              width: widget.width,
              height: 50,
              child: !widget.mapSelectionController.showMap.value
                  ? ElevatedButton.icon(
                      onPressed: () {
                        widget.mapSelectionController.showMap.value = true;
                      },
                      label: const Text(
                        "Map",
                      ),
                      icon: const Icon(
                        Icons.map,
                        // size: widget.height / 5,
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 98, 7, 255))),
                    )
                  : ElevatedButton.icon(
                      onPressed: () {
                        widget.mapSelectionController.showMap.value = false;
                      },
                      label: const Text(
                        "Video",
                      ),
                      icon: const Icon(
                        Icons.video_camera_back,
                        // size: widget.height / 5,
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 98, 7, 255))),
                    )),
        ),
        // SizedBox(
        //   width: widget.width,
        //   height: widget.height / 2,
        //   child: StreamBuilder<RoverMetrics>(
        //       stream: widget.mirvApi.periodicMetricUpdates,
        //       builder: (context, snapshot) {
        //         return Scrollbar(
        //           child: CommandList(
        //             roverMetrics: snapshot.data,
        //             sendCommand: widget.sendCommand,
        //           ),
        //         );
        //       }),
        // ),
        const Spacer(),
        Joystick(
          mode: joystickMode,
          listener: (details) => widget.onJoystickChanged(GamepadAxisType.left, details.x, details.y),
          onStickDragEnd: () => widget.onJoystickChanged(GamepadAxisType.left, 0.0, 0.0),
        )
      ],
    );
  }
}
