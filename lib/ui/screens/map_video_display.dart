import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/ui/screens/rover_operation_map.dart';

class OperationMapVideo extends StatelessWidget {
  const OperationMapVideo({Key? key, required this.showMap}) : super(key: key);
  final bool showMap;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        width: 800,
        height: 450,
        child: showMap
            ? RoverOperationMap(
                locationStream: BehaviorSubject<LatLng>.seeded(
                    new LatLng(40.474019558671344, -104.96957447379826)),
                piLitMarkers: [
                    RoverLocation(
                        roverId: 'piLit1',
                        location:
                            new LatLng(40.47399235127373, -104.96957682073116)),
                    RoverLocation(
                        roverId: 'piLit2',
                        location:
                            new LatLng(40.474025762131475, -104.9695798382163)),
                    RoverLocation(
                        roverId: 'piLit3',
                        location:
                            new LatLng(40.47405381703737, -104.96958520263433)),
                    RoverLocation(
                        roverId: 'piLit4',
                        location:
                            new LatLng(40.47408365724258, -104.96959090232849))
                  ])
            : ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 194, 194, 194),
                  ),
                ),
                child: const Text("video"),
              ));
  }
}
