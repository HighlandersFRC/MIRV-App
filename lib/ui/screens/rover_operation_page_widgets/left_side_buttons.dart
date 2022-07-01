import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';

class LeftSideButtons extends StatefulWidget {
  final RoverMetrics roverMetrics;
  final MirvApi mirvApi;
  final RTCDataChannel dataChannel;
  final Function(String, String) sendCommand;
  const LeftSideButtons(
      {Key? key,
      required this.roverMetrics,
      required this.mirvApi,
      required this.dataChannel,
      required this.sendCommand})
      : super(key: key);

  @override
  State<LeftSideButtons> createState() => _LeftSideButtonsState();
}

class _LeftSideButtonsState extends State<LeftSideButtons> {
  _robotModeButton(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
      case RoverStateType.docked:
        return ElevatedButton.icon(
          onPressed: () {
            if (widget.dataChannel != null) {
              String messageText = "Start Manual Control";
              widget.dataChannel.send(RTCDataChannelMessage(messageText));
            }
          },
          label: const Text(
            " Manual Control",
            textScaleFactor: 1.5,
          ),
          icon: const Icon(
            CupertinoIcons.antenna_radiowaves_left_right,
            size: 60,
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 98, 7, 255))),
        );

      case RoverStateType.remoteOperation:
        return ElevatedButton(
          onPressed: null,
          child: Row(children: [
            Icon(
              Icons.smart_toy_outlined,
              size: 55,
            ),
            Text(
              " Autonomous \n Control",
            ),
          ]),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 98, 7, 255))),
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
        Container(
            width: 175, child: _robotModeButton(widget.roverMetrics.state)),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 175,
          child: ElevatedButton.icon(
            onPressed: null,
            label: const Text(
              "Map",
              textScaleFactor: 2.5,
            ),
            icon: const Icon(
              Icons.map,
              size: 60,
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 98, 7, 255))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 250,
          height: 500,
          child: StreamBuilder<RoverMetrics>(
              stream: widget.mirvApi.periodicMetricUpdates,
              builder: (context, snapshot) {
                return CommandList(
                  roverMetrics: snapshot.data,
                  sendCommand: widget.sendCommand,
                );
              }),
        )
      ],
    );
  }
}
