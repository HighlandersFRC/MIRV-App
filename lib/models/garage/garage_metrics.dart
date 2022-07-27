import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/garage/garage_status_type.dart';
import 'package:mirv/models/rover/rover_health_type.dart';
import 'package:mirv/models/rover/rover_metrics.dart';

part 'garage_metrics.freezed.dart';
part 'garage_metrics.g.dart';

@freezed
class GarageMetrics with _$GarageMetrics {
  const factory GarageMetrics({
    required String garage_id,
    String? linked_rover_id,
    required GarageStateType state,
    @Default(GarageStatusType.available) GarageStatusType status,
    @Default(GarageMetricHealth()) GarageMetricHealth health,
    required DeviceLocation location,
  }) = _GarageMetrics;

  factory GarageMetrics.fromJson(Map<String, dynamic> json) => _$GarageMetricsFromJson(json);
}

@freezed
class GarageMetricHealth with _$GarageMetricHealth {
  const factory GarageMetricHealth({
    @Default(DeviceHealthType.unavailable) DeviceHealthType motor_controllers,
  }) = _GarageMetricHealth;

  factory GarageMetricHealth.fromJson(Map<String, dynamic> json) => _$GarageMetricHealthFromJson(json);
}
