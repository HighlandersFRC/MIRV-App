// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

enum RoverHealthType { healthy, unhealthy, degraded, unavailable }

extension RoverHealthTypeColor1 on RoverHealthType {
  Color get color1 {
    var invalid1 = const Color.fromARGB(215, 115, 115, 115);
    var healthy1 = const Color.fromARGB(215, 0, 125, 0);
    var unhealthy1 = const Color.fromARGB(215, 135, 145, 0);
    var degraded1 = const Color.fromARGB(215, 120, 0, 0);

    switch (this) {
      case RoverHealthType.healthy:
        print("It's healthy");
        return healthy1;
      case RoverHealthType.unhealthy:
        print("it's unhealthy");
        return unhealthy1;
      case RoverHealthType.degraded:
        print("It's degraded");
        return degraded1;
      case RoverHealthType.unavailable:
      default:
        print("Error: Invalid Health Type");
        return invalid1;
    }
  }
}

extension RoverHealthTypeColor2 on RoverHealthType {
  Color get color2 {
    var invalid2 = const Color.fromARGB(224, 160, 160, 160);
    var healthy2 = const Color.fromARGB(225, 0, 150, 0);
    var unhealthy2 = const Color.fromARGB(225, 170, 180, 0);
    var degraded2 = const Color.fromARGB(225, 150, 0, 0);

    switch (this) {
      case RoverHealthType.healthy:
        print("It's healthy");
        return healthy2;
      case RoverHealthType.unhealthy:
        print("it's unhealthy");
        return unhealthy2;
      case RoverHealthType.degraded:
        print("It's degraded");
        return degraded2;
      case RoverHealthType.unavailable:
      default:
        print("Error: Invalid Health Type");
        return invalid2;
    }
  }
}

extension RoverHealthTypeColor3 on RoverHealthType {
  Color get color3 {
    var invalid3 = const Color.fromARGB(235, 190, 190, 190);
    var healthy3 = const Color.fromARGB(235, 0, 190, 0);
    var unhealthy3 = const Color.fromARGB(235, 200, 200, 0);
    var degraded3 = const Color.fromARGB(235, 185, 0, 0);

    switch (this) {
      case RoverHealthType.healthy:
        print("It's healthy");
        return healthy3;
      case RoverHealthType.unhealthy:
        print("it's unhealthy");
        return unhealthy3;
      case RoverHealthType.degraded:
        print("It's degraded");
        return degraded3;
      case RoverHealthType.unavailable:
      default:
        print("Error: Invalid Health Type");
        return invalid3;
    }
  }
}

extension RoverHealthTypeColor4 on RoverHealthType {
  Color get color4 {
    var invalid4 = const Color.fromARGB(245, 215, 215, 215);
    var healthy4 = const Color.fromARGB(245, 0, 210, 0);
    var unhealthy4 = const Color.fromARGB(245, 220, 220, 0);
    var degraded4 = const Color.fromARGB(245, 220, 0, 0);

    switch (this) {
      case RoverHealthType.healthy:
        print("It's healthy");
        return healthy4;
      case RoverHealthType.unhealthy:
        print("it's unhealthy");
        return unhealthy4;
      case RoverHealthType.degraded:
        print("It's degraded");
        return degraded4;
      case RoverHealthType.unavailable:
      default:
        print("Error: Invalid Health Type");
        return invalid4;
    }
  }
}

extension RoverHealthTypeColor5 on RoverHealthType {
  Color get color5 {
    var invalid5 = const Color.fromARGB(255, 215, 215, 215);
    var healthy5 = const Color.fromARGB(255, 0, 255, 0);
    var unhealthy5 = const Color.fromARGB(255, 255, 255, 0);
    var degraded5 = const Color.fromARGB(255, 255, 0, 0);

    switch (this) {
      case RoverHealthType.healthy:
        print("It's healthy");
        return healthy5;
      case RoverHealthType.unhealthy:
        print("it's unhealthy");
        return unhealthy5;
      case RoverHealthType.degraded:
        print("It's degraded");
        return degraded5;
      case RoverHealthType.unavailable:
      default:
        print("Error: Invalid Health Type");
        return invalid5;
    }
  }
}
