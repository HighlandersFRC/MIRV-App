import 'package:flutter/material.dart';

enum RoverHealthType { healthy, unhealthy, degraded, unavailable }

extension RoverHealthTypeExtension on RoverHealthType {
  Color get colors {
    var invalid = Colors.grey;
    var healthy = Colors.green;
    var unhealthy = Colors.amber;
    var degraded = Colors.red;

    switch (this) {
      case RoverHealthType.healthy:
        print("It's healthy");
        return healthy;
      case RoverHealthType.unhealthy:
        print("it's unhealthy");
        return unhealthy;
      case RoverHealthType.degraded:
        print("It's degraded");
        return degraded;
      case RoverHealthType.unavailable:
      default:
        print("Error: Invalid Health Type");
        return invalid;
    }
  }
}

extension RoverHealthTypeBackColor on RoverHealthType {
  Color get colorBack {
    var invalidBack = Color.fromARGB(100, 0, 0, 0);
    var healthyBack = Color.fromARGB(100, 76, 175, 79);
    var unhealthyBack = Color.fromARGB(100, 255, 193, 7);
    var degradedBack = Color.fromARGB(100, 244, 67, 54);

    switch (this) {
      case RoverHealthType.healthy:
        print("It's healthy");
        return healthyBack;
      case RoverHealthType.unhealthy:
        print("it's unhealthy");
        return unhealthyBack;
      case RoverHealthType.degraded:
        print("It's degraded");
        return degradedBack;
      case RoverHealthType.unavailable:
      default:
        print("Error: Invalid Health Type");
        return invalidBack;
    }
  }
}
