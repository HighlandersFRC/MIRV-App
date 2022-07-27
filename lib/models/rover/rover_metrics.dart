import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/rover/rover_health_type.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/device_status_type.dart';

part 'rover_metrics.freezed.dart';
part 'rover_metrics.g.dart';

@freezed
class RoverMetrics with _$RoverMetrics {
  const factory RoverMetrics({
    required String rover_id,
    @Default(RoverStateType.disconnected) RoverStateType state, //Rover StateType
    @Default(DeviceStatusType.available) DeviceStatusType status, //RoverStatusType
    @Default(-1) int battery_voltage,
    @Default(-1) int battery_percent,
    @Default(RoverMetricHealth()) RoverMetricHealth health,
    @Default(RoverMetricTelemetry()) RoverMetricTelemetry telemetry,
  }) = _RoverMetrics;

  factory RoverMetrics.fromJson(Map<String, dynamic> json) => _$RoverMetricsFromJson(json);
}

@freezed
class RoverMetricHealth with _$RoverMetricHealth {
  const factory RoverMetricHealth({
    @Default(DeviceHealthType.unavailable) DeviceHealthType electronics,
    @Default(DeviceHealthType.unavailable) DeviceHealthType drivetrain,
    @Default(DeviceHealthType.unavailable) DeviceHealthType intake,
    @Default(DeviceHealthType.unavailable) DeviceHealthType sensors,
    @Default(DeviceHealthType.unavailable) DeviceHealthType garage,
    @Default(DeviceHealthType.unavailable) DeviceHealthType power,
    @Default(DeviceHealthType.unavailable) DeviceHealthType general,
  }) = _RoverMetricHealth;

  factory RoverMetricHealth.fromJson(Map<String, dynamic> json) => _$RoverMetricHealthFromJson(json);
}

@freezed
class RoverMetricTelemetry with _$RoverMetricTelemetry {
  const factory RoverMetricTelemetry({
    @Default(DeviceLocation()) DeviceLocation location,
    @Default(0.0) double heading,
    @Default(0.0) double speed,
  }) = _RoverMetricTelemetry;

  factory RoverMetricTelemetry.fromJson(Map<String, dynamic> json) => _$RoverMetricTelemetryFromJson(json);
}
