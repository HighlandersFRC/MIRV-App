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

extension DeviceHealthTypeColor1 on DeviceHealthType {
  MaterialStateProperty<Color> get color1 {
    var invalid1 = MaterialStateProperty.all(Color.fromARGB(125, 103, 109, 105));
    var healthy1 = MaterialStateProperty.all(Color.fromARGB(125, 21, 117, 58));
    var unhealthy1 = MaterialStateProperty.all(Color.fromARGB(163, 238, 205, 19));
    var degraded1 = MaterialStateProperty.all(Color.fromARGB(124, 190, 18, 18));
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
