import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_map.dart';

class OperationMapVideo extends StatelessWidget {
   OperationMapVideo(
      {Key? key, required this.showMap, required this.locationStream, required this.piLitMarkers})
      : super(key: key);
  final bool showMap;
  final BehaviorSubject<LatLng> locationStream;
   final List<RoverLocation> piLitMarkers;
    final MirvApi _mirvApi = MirvApi();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        width: 800,
        height: 450,
        child: showMap
            ? RoverOperationMap(locationStream: locationStream, piLitMarkers: piLitMarkers)
            : 
              Column(
               children: [
                Container(
                  color: Colors.amber,
                  width: 800,
                  height: 450,
                  child: 
            ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 194, 194, 194),
                  ),
                ),
                child: const Text("video"),
              ),
              ),
                StreamBuilder<RoverMetrics>(
                    stream: _mirvApi.periodicMetricUpdates,
                    builder: (context, snapshot) {
                      return Text(snapshot.data != null
                          ? '${snapshot.data!.telemetry}'
                          : 'Waiting on data');
                    }),  
               ],
    )
    );
  }
}
