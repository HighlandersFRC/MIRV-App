import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry_data_table.dart';
import 'package:rxdart/subjects.dart';

class OperationMapVideo extends StatelessWidget {
  OperationMapVideo(
      {Key? key,
      required this.showMap,
      required this.locationStream,
      required this.piLitMarkers,
      required this.selectedRoverMetrics,
      this.periodicMetricUpdates, required this.width, required this.height})
      : super(key: key);
  final bool showMap;
  final BehaviorSubject<LatLng> locationStream;
  final List<PiLit> piLitMarkers;
  final RoverMetrics selectedRoverMetrics;
  final MirvApi _mirvApi = MirvApi();
  final dynamic periodicMetricUpdates;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        width: 800,
        height: 450,
        child: showMap
            ? RoverOperationMap(
                locationStream: locationStream,
                roverMetrics: selectedRoverMetrics,
              )
            : Column(
                children: [
                  Container(
                    color: Colors.amber,
                    width: 800,
                    height: 450,
                    child: ElevatedButton(
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
                      stream: periodicMetricUpdates,
                      builder: (context, snapshot) {
                        return SizedBox(
                            height: height / 5,
                            width: width,
                            child: snapshot.data != null
                                ? TelemeteryDataTable(roverMetrics: snapshot.data!.telemetry)
                                : const Text('Waiting on data'));
                      }),
                ],
              ));
  }
}
