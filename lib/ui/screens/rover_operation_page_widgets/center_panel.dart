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
    required this.roverMetrics,
  }) : super(key: key);

  final dynamic periodicMetricUpdates;
  get_pkg.Rx<bool> showMapObs = false.obs;
  bool showMap = false;
  final BehaviorSubject<LatLng> locationStream;
  final RoverMetrics roverMetrics;
  late get_pkg.Rx<bool> manualOperation = false.obs;
  late WebRTCConnection webRTCConnection = WebRTCConnection(roverMetrics);
  GestureDoubleTapCallback? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 800,
          height: 450 * 4 / 5,
          child: get_pkg.Obx(
            () => showMapObs.value
                ? AspectRatio(
                    aspectRatio: 1,
                    child: Stack(children: [
                      Positioned.fill(
                        child: RoverOperationMap(
                          locationStream: locationStream,
                          roverMetrics: roverMetrics,
                        ),
                      ),
                      get_pkg.Obx(() => Positioned(
                            bottom: 0,
                            left: manualOperation.value ? 300 : 50,
                            height: 160,
                            width: 300,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onDoubleTap: () {
                                showMapObs.value = false;
                                print('double tapped');
                              },
                              child: RTCVideoView(webRTCConnection.localRenderer.value),
                            ),
                          ))
                    ]),
                  )
                : AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: RTCVideoView(webRTCConnection.localRenderer.value),
                        ),
                        get_pkg.Obx(
                          () => Positioned(
                              bottom: 0,
                              left: manualOperation.value ? 300 : 50,
                              height: 160,
                              width: 300,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onDoubleTap: () {
                                  showMapObs.value = true;
                                  print('double tapped');
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
        ),
      ],
    );
  }
}
