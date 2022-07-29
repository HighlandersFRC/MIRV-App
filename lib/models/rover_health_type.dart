import 'package:flutter/material.dart';

enum RoverHealthType { healthy, unhealthy, degraded, unavailable }

extension RoverHealthTypeColor1 on RoverHealthType {
  MaterialStateProperty<Color> get color1 {
    var invalid1 = MaterialStateProperty.all(Color.fromARGB(125, 103, 109, 105));
    var healthy1 = MaterialStateProperty.all(Color.fromARGB(125, 21, 117, 58));
    var unhealthy1 = MaterialStateProperty.all(Color.fromARGB(164, 234, 238, 19));
    var degraded1 = MaterialStateProperty.all(Color.fromARGB(124, 190, 18, 18));

    switch (this) {
      case RoverHealthType.healthy:
        return healthy1;
      case RoverHealthType.unhealthy:
        return unhealthy1;
      case RoverHealthType.degraded:
        return degraded1;
      case RoverHealthType.unavailable:
      default:
        return invalid1;
    }
  }
}
