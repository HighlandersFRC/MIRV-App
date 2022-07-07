import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/ui/screens/rover_new_op_page.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';

class LeftSideButtons extends StatefulWidget {
  final RoverMetrics roverMetrics;
  final dynamic periodicMetricUpdates;
  final Function(String) sendGeneralCommand;
  final Function(String, String) sendCommand;
  final MapSelectionController mapSelectionController;
  const LeftSideButtons(
      {Key? key,
      required this.roverMetrics,
      required this.sendGeneralCommand,
      required this.periodicMetricUpdates,
      required this.sendCommand,
      required this.mapSelectionController})
      : super(key: key);

  @override
  State<LeftSideButtons> createState() => _LeftSideButtonsState();
}

class _LeftSideButtonsState extends State<LeftSideButtons> {
  OverlayEntry? entry;
  late List<bool> isSelected;

  _robotModeButton(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
      case RoverStateType.docked:
        return ElevatedButton.icon(
          onPressed: () {
            widget.sendGeneralCommand('Start Manual Control');
          },
          label: const Text(
            " Manual Control",
            textScaleFactor: 1.5,
          ),
          icon: const Icon(
            CupertinoIcons.antenna_radiowaves_left_right,
            size: 60,
          ),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 98, 7, 255))),
        );

      case RoverStateType.remoteOperation:
        return ElevatedButton(
          onPressed: null,
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 98, 7, 255))),
          child: Row(children: const [
            Icon(
              Icons.smart_toy_outlined,
              size: 55,
            ),
            Text(
              " Autonomous \n Control",
            ),
          ]),
        );
      case RoverStateType.eStop:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 175, child: _robotModeButton(widget.roverMetrics.state)),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => SizedBox(
              width: 175,
              child: !widget.mapSelectionController.showMap.value
                  ? ElevatedButton.icon(
                      onPressed: () {
                        widget.mapSelectionController.showMap.value = true;
                      },
                      label: const Text(
                        "Map",
                        textScaleFactor: 2.5,
                      ),
                      icon: const Icon(
                        Icons.map,
                        size: 60,
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 98, 7, 255))),
                    )
                  : ElevatedButton.icon(
                      onPressed: () {
                        widget.mapSelectionController.showMap.value = false;
                      },
                      label: const Text(
                        "Video",
                        textScaleFactor: 2.0,
                      ),
                      icon: const Icon(
                        Icons.video_camera_back,
                        size: 60,
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 98, 7, 255))),
                    )),
        ),
        SizedBox(
          width: 250,
          height: 500,
          child: StreamBuilder<RoverMetrics>(
              stream: widget.periodicMetricUpdates,
              builder: (context, snapshot) {
                return CommandList(roverMetrics: snapshot.data, sendCommand: widget.sendCommand);
              }),
        )
      ],
    );
  }
}
