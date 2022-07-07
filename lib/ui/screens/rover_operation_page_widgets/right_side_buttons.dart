import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:rxdart/rxdart.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/disable_toggle.dart';
import 'package:test/ui/screens/webrtc_connection.dart';

class RightSideButtons extends StatefulWidget {
  RightSideButtons(
      {Key? key,
      required this.roverMetrics,
      required this.sendCommand,
      required this.makeCall,
      required this.stopCall,
      required this.joystickPublish,
      required this.periodicMetricUpdates,
      required this.startJoystickUpdates,
      required this.useGamepad})
      : super(key: key);
  final RoverMetrics roverMetrics;
  final Function() stopCall;
  final Function() makeCall;
  final get_pkg.RxList<JoystickValue> joystickPublish;
  final get_pkg.Rx<bool> useGamepad;

  final Function(String, String) sendCommand;
  final BehaviorSubject<RoverMetrics> periodicMetricUpdates;
  final Function() startJoystickUpdates;

  @override
  State<RightSideButtons> createState() => _RightSideButtonsState();
}

class _RightSideButtonsState extends State<RightSideButtons> {
// TODO: implement e-stop method
  eStop() {
    throw UnimplementedError('E-stop is not implemented');
  }

  @override
  Widget build(BuildContext context) {
    double _x = 0;
    double _y = 0;
    var step = 10.0;
    final JoystickMode _joystickMode = JoystickMode.all;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton.icon(
            onPressed: widget.makeCall,
            label: Text('Request Rover Data'),
            icon: Icon(Icons.wifi_calling_3),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          ),
        ),
        SizedBox(
          height: 20,
          width: 250,
        ),
        SizedBox(
          height: 40,
          width: 225,
          child: ElevatedButton(
            onPressed: widget.stopCall,
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
            child: Text("Request Marker Data"),
          ),
        ),
        SizedBox(
          height: 20,
          width: 250,
        ),
        SizedBox(
          child: StreamBuilder<RoverMetrics>(
              stream: widget.periodicMetricUpdates,
              builder: (context, snapshot) {
                return ToggleDisable(roverMetrics: snapshot.data, sendCommand: widget.sendCommand);
              }),
        ),
        SizedBox(
          height: 20,
          width: 250,
        ),
        SizedBox(
            child: get_pkg.Obx(
          () => Switch(
              value: widget.useGamepad.value,
              onChanged: (val) {
                widget.useGamepad.value = !widget.useGamepad.value;
              }),
        )),
        SizedBox(
            child: (RoverStateType.remoteOperation == RoverStateType.remoteOperation)
                ? Joystick(
                    mode: _joystickMode,
                    listener: (details) {
                      setState(
                        () {
                          _x = details.x;
                          _y = details.y;
                        },
                      );
                      widget.joystickPublish.value = ([JoystickValue(details.x, details.y, DateTime.now())]);
                    },
                  )
                : null),
        const SizedBox(
          height: 20,
          width: 100,
        ),
        SizedBox(
          height: 100,
          width: 250,
          child: ElevatedButton.icon(
            onPressed: () => widget.sendCommand("eStop", "general"),
            label: const Text("E-STOP"),
            icon: const Icon(Icons.warning_amber_rounded),
            style: ButtonStyle(
                animationDuration: Duration(seconds: 10),
                backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                overlayColor: MaterialStateProperty.all(Colors.yellowAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(color: Color.fromARGB(255, 250, 250, 250), width: 10),
                  ),
                ),
                shadowColor: MaterialStateProperty.all(Color.fromARGB(0, 0, 0, 0))),
          ),
        )
      ],
    );
  }
}
