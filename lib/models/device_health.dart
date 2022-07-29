import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'device_health.freezed.dart';
part 'device_health.g.dart';

@freezed
class DeviceHealth with _$DeviceHealth {
  const factory DeviceHealth({
    @Default(DeviceHealthType.unavailable) DeviceHealthType health,
    String? details,
  }) = _DeviceHealth;

  factory DeviceHealth.fromJson(Map<String, dynamic> json) => _$DeviceHealthFromJson(json);
}

enum DeviceHealthType { healthy, unhealthy, degraded, unavailable }

extension RoverHealthTypeColor1 on DeviceHealthType {
  Color get color1 {
    var invalid1 = const Color.fromARGB(215, 115, 115, 115);
    var healthy1 = const Color.fromARGB(215, 0, 125, 0);
    var unhealthy1 = const Color.fromARGB(215, 135, 145, 0);
    var degraded1 = const Color.fromARGB(215, 120, 0, 0);

    switch (this) {
      case DeviceHealthType.healthy:
        return healthy1;
      case DeviceHealthType.unhealthy:
        return unhealthy1;
      case DeviceHealthType.degraded:
        return degraded1;
      case DeviceHealthType.unavailable:
      default:
        return invalid1;
    }
  }
}
