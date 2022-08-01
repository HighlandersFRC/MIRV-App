import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry_data_table.dart';
import 'package:mirv/ui/screens/webrtc_connection.dart';
import 'package:rxdart/rxdart.dart';

class CenterPanel extends StatelessWidget {
  CenterPanel({
    Key? key,
    required this.periodicMetricUpdates,
    required this.locationStream,
    required this.width,
    required this.height,
    required this.roverMetrics,
  }) : super(key: key);

  final dynamic periodicMetricUpdates;
  bool showMap = false;
  final BehaviorSubject<LatLng> locationStream;
  final double width;
  final double height;
  final RoverMetrics roverMetrics;
  late get_pkg.Rx<bool> manualOperation = false.obs;
  late WebRTCConnection webRTCConnection = WebRTCConnection(roverMetrics);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height * 4 / 5,
          child: showMap
              ? Stack(children: [
                  Positioned.fill(
                    child: RoverOperationMap(
                      locationStream: locationStream,
                      roverMetrics: roverMetrics,
                    ),
                  ),
                  get_pkg.Obx(() => Positioned(
                        bottom: 20,
                        left: manualOperation.value ? 300 : 50,
                        height: 160,
                        width: 300,
                        child: GestureDetector(
                          onDoubleTap: () {
                            showMap = false;
                          },
                          child: RTCVideoView(webRTCConnection.localRenderer.value),
                        ),
                      ))
                ])
              : AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: RTCVideoView(webRTCConnection.localRenderer.value),
                      ),
                      get_pkg.Obx(
                        () => Positioned(
                            bottom: 5,
                            left: manualOperation.value ? 300 : 50,
                            height: 160,
                            width: 300,
                            child: GestureDetector(
                              onDoubleTap: () {
                                print ('double tapped');
                              },
                              child: RoverOperationMap(
                                locationStream: locationStream,
                                roverMetrics: roverMetrics,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
