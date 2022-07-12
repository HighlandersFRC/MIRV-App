import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/rover_health_type.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/models/rover_status_type.dart';

part 'rover_metrics.freezed.dart';
part 'rover_metrics.g.dart';

@freezed
class RoverMetrics with _$RoverMetrics {
  const factory RoverMetrics(
      {@Default("unknown") String roverId,
      @Default(RoverStateType.remoteOperation) RoverStateType state, //RoverStateType
      @Default(RoverStatusType.available) RoverStatusType status, //RoverStatusType
      @Default(-1) int battery,
      @Default(RoverMetricHealth()) RoverMetricHealth health,
      @Default(RoverMetricTelemetry()) RoverMetricTelemetry telemetry}) = _RoverMetrics;

  factory RoverMetrics.fromJson(Map<String, dynamic> json) => _$RoverMetricsFromJson(json);
}

@freezed
class RoverMetricHealth with _$RoverMetricHealth {
  const factory RoverMetricHealth({
    @Default(RoverHealthType.unavailable) RoverHealthType electronics,
    @Default(RoverHealthType.unavailable) RoverHealthType drivetrain,
    @Default(RoverHealthType.unavailable) RoverHealthType intake,
    @Default(RoverHealthType.unavailable) RoverHealthType sensors,
    @Default(RoverHealthType.unavailable) RoverHealthType garage,
    @Default(RoverHealthType.unavailable) RoverHealthType power,
    @Default(RoverHealthType.unavailable) RoverHealthType general,
  }) = _RoverMetricHealth;

  factory RoverMetricHealth.fromJson(Map<String, dynamic> json) => _$RoverMetricHealthFromJson(json);
}

@freezed
class RoverMetricTelemetry with _$RoverMetricTelemetry {
  const factory RoverMetricTelemetry({
    @Default(RoverMetricLocation()) RoverMetricLocation location,
    @Default(0.0) double heading,
    @Default(0.0) double speed,
  }) = _RoverMetricTelemetry;

  factory RoverMetricTelemetry.fromJson(Map<String, dynamic> json) => _$RoverMetricTelemetryFromJson(json);
}

@freezed
class RoverMetricLocation with _$RoverMetricLocation {
  const factory RoverMetricLocation({
    @Default(0.0) double long,
    @Default(0.0) double lat,
  }) = _RoverMetricLocation;

  factory RoverMetricLocation.fromJson(Map<String, dynamic> json) => _$RoverMetricLocationFromJson(json);
}
