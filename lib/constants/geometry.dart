import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geometry {
  static double DEGREES_TO_RADIANS = 180 / pi;

  static double bearing_between_coordiantes(LatLng a, LatLng b) {
    double dL = b.longitude - a.longitude;
    double X = cos(b.latitude / DEGREES_TO_RADIANS) * sin(dL / DEGREES_TO_RADIANS);
    double Y = cos(a.latitude / DEGREES_TO_RADIANS) * sin(b.latitude / DEGREES_TO_RADIANS) -
        sin(a.latitude / DEGREES_TO_RADIANS) * cos(b.latitude / DEGREES_TO_RADIANS) * cos(dL / DEGREES_TO_RADIANS);
    double bearing = atan2(X, Y) * DEGREES_TO_RADIANS;

    return bearing;
  }
}
