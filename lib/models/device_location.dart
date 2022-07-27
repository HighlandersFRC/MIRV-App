import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_location.freezed.dart';
part 'device_location.g.dart';

@freezed
class DeviceLocation with _$DeviceLocation {
  const factory DeviceLocation({
    @Default(0.0) double long,
    @Default(0.0) double lat,
  }) = _DeviceLocation;

  factory DeviceLocation.fromJson(Map<String, dynamic> json) => _$DeviceLocationFromJson(json);
}
