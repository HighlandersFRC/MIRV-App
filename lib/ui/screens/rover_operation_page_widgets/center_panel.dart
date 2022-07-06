import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/telemetry_data_table.dart';

class CenterPanel extends StatelessWidget {
  const CenterPanel(
      {Key? key, this.periodicMetricUpdates, required this.localRenderer})
      : super(key: key);

  final dynamic periodicMetricUpdates;
  final RTCVideoRenderer localRenderer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.amber,
          width: 800,
          height: 450,
          child: AspectRatio(
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
