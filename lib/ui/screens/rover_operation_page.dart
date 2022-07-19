import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/ui/screens/rover_operation_map.dart';
import 'package:rxdart/rxdart.dart';

import 'webrtc_connection.dart';

class RoverOperationPage extends StatelessWidget {
  final RoverMetrics roverMetrics;

  RoverOperationPage(this.roverMetrics, {Key? key}) : super(key: key);

  WebRTCConnection webRTCConnection = WebRTCConnection();
  final List<PiLit> piLitMarkers = [
    const PiLit(id: 'piLit1', description: 'Pi-lit device', location: LatLng(40.47399235127373, -104.96957682073116)),
    const PiLit(id: 'piLit2', description: 'Pi-lit device', location: LatLng(40.474025762131475, -104.9695798382163)),
    const PiLit(id: 'piLit3', description: 'Pi-lit device', location: LatLng(40.47405381703737, -104.96958520263433)),
    const PiLit(id: 'piLit4', description: 'Pi-lit device', location: LatLng(40.47408365724258, -104.96959090232849))
  ];
  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Expanded(child: RTCVideoView(webRTCConnection.localRenderer.value)),
      Positioned(
        bottom: 50,
        left: 50,
        height: 100,
        width: 250,
        child: RoverOperationMap(
          locationStream: locationStream,
          piLitMarkers: piLitMarkers,
          selectedRoverMetrics: roverMetrics,
        ),
      ),
    ]);
  }
}
