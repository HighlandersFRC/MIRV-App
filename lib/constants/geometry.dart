import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geometry {
  // ignore: non_constant_identifier_names
  static double DEGREES_PER_RADIAN = 180 / pi;
  static double RADIANS_PER_DEGREE = 1 / DEGREES_PER_RADIAN;
  static double FEET_PER_METERS = 0.3048;

  // ignore: non_constant_identifier_names
  static double bearing_between_coordinates(LatLng a, LatLng b) {
    double dL = b.longitude - a.longitude;
    double X = cos(b.latitude / DEGREES_PER_RADIAN) * sin(dL / DEGREES_PER_RADIAN);
    double Y = cos(a.latitude / DEGREES_PER_RADIAN) * sin(b.latitude / DEGREES_PER_RADIAN) -
        sin(a.latitude / DEGREES_PER_RADIAN) * cos(b.latitude / DEGREES_PER_RADIAN) * cos(dL / DEGREES_PER_RADIAN);
    double bearing = atan2(X, Y) * DEGREES_PER_RADIAN;

    return bearing;
  }

  static LatLng getEndPoint(LatLng startPoint, double angle, double distance) {
    double R = 6378.1; //Radius of the Earth
    double bearing = angle * RADIANS_PER_DEGREE;
    double d = distance / 1000;

    //lat2  52.20444 - the lat result I'm hoping for
    //lon2  0.36056 - the long result I'm hoping for.

    double lat1 = startPoint.latitude * RADIANS_PER_DEGREE; //Current lat point converted to radians
    double lon1 = startPoint.longitude * RADIANS_PER_DEGREE; //Current long point converted to radians

    double lat2 = asin(sin(lat1) * cos(d / R) + cos(lat1) * sin(d / R) * cos(bearing));

    double lon2 = lon1 + atan2(sin(bearing) * sin(d / R) * cos(lat1), cos(d / R) - sin(lat1) * sin(lat2));

    lat2 = lat2 * DEGREES_PER_RADIAN;
    lon2 = lon2 * DEGREES_PER_RADIAN;
    return LatLng(lat2, lon2);
  }
}
