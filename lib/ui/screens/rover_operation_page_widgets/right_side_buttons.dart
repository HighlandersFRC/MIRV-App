import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/disable_toggle.dart';

class RightSideButtons extends StatefulWidget {
  RightSideButtons({Key? key, required this.roverMetrics}) : super(key: key);
  final RoverMetrics roverMetrics;

  @override
  State<RightSideButtons> createState() => _RightSideButtonsState();
}

class _RightSideButtonsState extends State<RightSideButtons> {
  final MirvApi _mirvApi = MirvApi();

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
          width: 250,
          height: 50,
          child: Builder(builder: (context) {
            return ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        widget.roverMetrics.state ==
                                RoverStateType.remoteOperation
                            ? Colors.blue
                            : Colors.grey)),
                onPressed: () {
                  widget.roverMetrics.state == RoverStateType.remoteOperation
                      ? Scaffold.of(context).openEndDrawer()
                      : null;
                },
                label: Text("Commands"),
                icon: Icon(
                  Icons.list_alt,
                ));
          }),
        ),
        SizedBox(
          height: 20,
          width: 250,
        ),
        SizedBox(
          height: 100,
          width: 225,
          child: StreamBuilder<RoverMetrics>(
              stream: _mirvApi.periodicMetricUpdates,
              builder: (context, snapshot) {
                return ToggleDisable(roverMetrics: widget.roverMetrics);
              }),
        ),
        SizedBox(
          height: 20,
          width: 250,
        ),
        SizedBox(
            child: (widget.roverMetrics.state == RoverStateType.remoteOperation)
                ? Joystick(
                    mode: _joystickMode,
                    listener: (details) {
                      setState(
                        () {
                          _x = details.x;
                          _y = details.y;
                        },
                      );
                    },
                  )
                : null),
        const SizedBox(
          height: 20,
          width: 100,
        ),
        SizedBox(
          height: 250,
          width: 250,
          child: ElevatedButton.icon(
            onPressed: eStop,
            label: const Text("E-STOP"),
            icon: const Icon(Icons.warning_amber_rounded),
            style: ButtonStyle(
                animationDuration: Duration(seconds: 10),
                backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                overlayColor: MaterialStateProperty.all(Colors.yellowAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(
                        color: Color.fromARGB(255, 250, 250, 250), width: 10),
                  ),
                ),
                shadowColor:
                    MaterialStateProperty.all(Color.fromARGB(0, 0, 0, 0))),
          ),
        )
      ],
    );
  }
}
