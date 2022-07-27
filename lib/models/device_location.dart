import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'device_location.freezed.dart';
part 'device_location.g.dart';

@freezed
class DeviceLocation with _$DeviceLocation {
  const DeviceLocation._();

  const factory DeviceLocation({
    @Default(0.0) double long,
    @Default(0.0) double lat,
  }) = _DeviceLocation;

  get latLng => LatLng(lat, long);

  factory DeviceLocation.fromJson(Map<String, dynamic> json) => _$DeviceLocationFromJson(json);
}
