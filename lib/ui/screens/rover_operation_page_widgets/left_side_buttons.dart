import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_map.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';

class LeftSideButtons extends StatefulWidget {
  final RoverMetrics roverMetrics;
  final MirvApi mirvApi;

  const LeftSideButtons(
      {Key? key, required this.roverMetrics, required this.mirvApi})
      : super(key: key);

  @override
  State<LeftSideButtons> createState() => _LeftSideButtonsState();
}

class _LeftSideButtonsState extends State<LeftSideButtons> {
  OverlayEntry? entry;
  _robotModeButton(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
      case RoverStateType.docked:
        return ElevatedButton.icon(
          onPressed: null,
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
            onPressed: showOverlay,
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
                return CommandList(roverMetrics: widget.roverMetrics);
              }),
        )
      ],
    );
  }

  void showOverlay() {
    entry = OverlayEntry(
        builder: (context) => Positioned(
            top: 193,
            right: 280,
            child: Container(
                width: 800,
                height: 450,
                child: RoverOperationMap(
                    locationStream: BehaviorSubject<LatLng>.seeded(
                        new LatLng(40.474019558671344, -104.96957447379826)),
                    piLitMarkers: [
                      RoverLocation(
                          roverId: 'piLit1',
                          location: new LatLng(
                              40.47399235127373, -104.96957682073116)),
                      RoverLocation(
                          roverId: 'piLit2',
                          location: new LatLng(
                              40.474025762131475, -104.9695798382163)),
                      RoverLocation(
                          roverId: 'piLit3',
                          location: new LatLng(
                              40.47405381703737, -104.96958520263433)),
                      RoverLocation(
                          roverId: 'piLit4',
                          location: new LatLng(
                              40.47408365724258, -104.96959090232849))
                    ]))));

    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }
}
