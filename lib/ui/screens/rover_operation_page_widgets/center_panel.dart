import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/models/pi_lit.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/rover_operation_map.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/telemetry_data_table.dart';

class CenterPanel extends StatelessWidget {
  const CenterPanel(
      {Key? key,
      required this.periodicMetricUpdates,
      required this.localRenderer,
      required this.showMap,
      required this.locationStream,
      required this.piLitMarkers})
      : super(key: key);

  final dynamic periodicMetricUpdates;
  final RTCVideoRenderer localRenderer;
  final bool showMap;
  final BehaviorSubject<LatLng> locationStream;
  final List<PiLit> piLitMarkers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.amber,
          width: 800,
          height: 450,
          child: showMap
              ? RoverOperationMap(
                  locationStream: locationStream, piLitMarkers: piLitMarkers, roverMetrics: [],)
              : AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: RTCVideoView(
                          localRenderer,
                          // mirror: true,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        StreamBuilder<RoverMetrics>(
            stream: periodicMetricUpdates,
            builder: (context, snapshot) {
              return Container(
                  child: snapshot.data != null
                      ? TelemeteryDataTable(
                          roverMetrics: snapshot.data!.telemetry)
                      : Text('Waiting on data'));
            }),
      ],
    );
  }
}
