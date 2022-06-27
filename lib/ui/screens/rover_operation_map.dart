import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';


class RoverOperationMap extends StatefulWidget {
  final BehaviorSubject<Location> locationStream;
  final List<MarkerLocation> piLitMarkers;
  List<Polygon>? lanes;
  const RoverOperationMap({Key? key, required this.locationStream, required this.piLitMarkers, this.lanes}) : super(key: key);

  @override
  State<RoverOperationMap> createState() => _RoverOperationMapState();
}

class _RoverOperationMapState extends State<RoverOperationMap> {
  @override
  Widget build(BuildContext context) {
    
  }
}