import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/pi_lit_state_type.dart';
import 'package:mirv/models/rover/rover_health_type.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/device_status_type.dart';

part 'rover_metrics.freezed.dart';
part 'rover_metrics.g.dart';

@freezed
class RoverMetrics with _$RoverMetrics {
  const factory RoverMetrics({
    required String rover_id,
    required RoverStateType state, //Rover StateType
    required DeviceStatusType status, //RoverStatusType
    @Default(-1) int battery_voltage,
    required int battery_percent,
    required RoverMetricHealth health,
    required RoverMetricTelemetry telemetry,
    required RoverPiLits pi_lits,
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
    required DeviceLocation location,
    required double heading,
    required double speed,
  }) = _RoverMetricTelemetry;

  factory RoverMetricTelemetry.fromJson(Map<String, dynamic> json) => _$RoverMetricTelemetryFromJson(json);
}

@freezed
class RoverPiLits with _$RoverPiLits {
  const factory RoverPiLits({
    required PiLitStateType state,
    required int pi_lits_stowed_left,
    required int pi_lits_stowed_right,
    required List<PiLit> deployed_pi_lits,
  }) = _RoverPiLits;

  factory RoverPiLits.fromJson(Map<String, dynamic> json) => _$RoverPiLitsFromJson(json);
}

@freezed
class PiLit with _$PiLit {
  const factory PiLit({
    required String pi_lit_id,
    required DeviceLocation location,
  }) = _PiLit;

  factory PiLit.fromJson(Map<String, dynamic> json) => _$PiLitFromJson(json);
}
