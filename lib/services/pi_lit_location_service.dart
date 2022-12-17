import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/pi_lit_formation_type.dart';

import '../constants/geometry.dart';
import '../models/device_location.dart';
import '../models/pair.dart';

class PiLitLocationService {
  static List<LatLng> generatePiLitFormation(
      LatLng startPoint, double heading, double laneWidth, PiLitFormationType formationType) {
    // sign = -1 if left_side else 1
    double sign = 1;

    switch (formationType) {
      case PiLitFormationType.taper_left_3:
        sign = -1;
        List<Pair<double, double>> piLitLocations = [
          Pair(0, 0.375 * sign),
          Pair(100, 0.0),
          Pair(200, 0.0),
        ];
        return generatePiLitLocations(startPoint, heading, laneWidth, piLitLocations);
      case PiLitFormationType.taper_right_3:
        List<Pair<double, double>> piLitLocations = [
          Pair(0, 0.375 * sign),
          Pair(100, 0.0),
          Pair(200, 0.0),
        ];
        return generatePiLitLocations(startPoint, heading, laneWidth, piLitLocations);
      case PiLitFormationType.taper_left_5:
        sign = -1;
        List<Pair<double, double>> piLitLocations = [
          Pair(0, 0.5 * sign),
          Pair(10, 0.25 * sign),
          Pair(20, 0.0 * sign),
          Pair(30, -0.25 * sign),
          Pair(40, -0.5 * sign),
        ];
        return generatePiLitLocations(startPoint, heading, laneWidth, piLitLocations);
      case PiLitFormationType.taper_right_5:
        List<Pair<double, double>> piLitLocations = [
          Pair(0, 0.5 * sign),
          Pair(10, 0.25 * sign),
          Pair(20, 0.0 * sign),
          Pair(30, -0.25 * sign),
          Pair(40, -0.5 * sign),
        ];
        return generatePiLitLocations(startPoint, heading, laneWidth, piLitLocations);
      case PiLitFormationType.spear_7:
        List<Pair<double, double>> piLitLocations = [
          Pair(0, 0.5),
          Pair(10, 0.333),
          Pair(20, 0.167),
          Pair(30, 0),
          Pair(20, -0.167),
          Pair(10, -0.333),
          Pair(0, -0.5),
        ];
        return generatePiLitLocations(startPoint, heading, laneWidth, piLitLocations);
    }
  }

  static List<LatLng> generatePiLitLocations(
      LatLng startPoint, double heading, double laneWidth, List<Pair<double, double>> distances) {
    List<LatLng> piLitLocations = [];
    for (Pair<double, double> loc in distances) {
      // Convert Units
      double longitudinalDistMeters = loc.first * Geometry.FEET_PER_METERS;
      double lateralDistMeters = loc.last * laneWidth;

      // Generate angle and hypotenuse
      double piLitAngleRelative = Geometry.DEGREES_PER_RADIAN * atan2(lateralDistMeters, longitudinalDistMeters);

      double piLitAngle = heading + piLitAngleRelative;
      double piLitDistance = sqrt(pow(longitudinalDistMeters, 2) + pow(lateralDistMeters, 2));

      // Get end of vector
      LatLng location = Geometry.getEndPoint(startPoint, piLitAngle, piLitDistance);
      piLitLocations.add(location);
    }

    return piLitLocations;
  }
}
