import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry_data_table.dart';

class CenterPanel extends StatelessWidget {
  const CenterPanel(
      {Key? key,
      required this.periodicMetricUpdates,
      required this.localRenderer,
      required this.showMap,
      required this.locationStream,
      required this.piLitMarkers,
      required this.width,
      required this.height,
      required this.selectedRoverMetrics})
      : super(key: key);

  final dynamic periodicMetricUpdates;
  final RTCVideoRenderer localRenderer;
  final bool showMap;
  final BehaviorSubject<LatLng> locationStream;
  final List<PiLit> piLitMarkers;
  final double width;
  final double height;
  final RoverMetrics selectedRoverMetrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height * 4 / 5,
          child: showMap
              ? RoverOperationMap(
                  locationStream: locationStream,
                  piLitMarkers: piLitMarkers,
                  selectedRoverMetrics: selectedRoverMetrics,
                )
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
              return SizedBox(
                  height: height / 5,
                  width: width,
                  child: snapshot.data != null
                      ? TelemeteryDataTable(roverMetrics: snapshot.data!.telemetry)
                      : const Text('Waiting on data'));
            }),
      ],
    );
  }
}
