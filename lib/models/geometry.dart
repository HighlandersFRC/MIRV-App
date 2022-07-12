import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test/models/location.dart';

class Geometry {
  final LocationObject location;

  Geometry({required this.location});

  Geometry.fromJson(Map<dynamic, dynamic> parsedJson) : location = LocationObject.fromJson(parsedJson['location']);

  LatLng getLatLng() {
    return LatLng(location.lat, location.lng);
  }
}
