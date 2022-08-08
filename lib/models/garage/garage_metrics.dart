import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/device_health.dart';

part 'garage_metrics.freezed.dart';
part 'garage_metrics.g.dart';

@freezed
class GarageMetrics with _$GarageMetrics {
  const factory GarageMetrics({
    required String garage_id,
    String? linked_rover_id,
    required GarageStateType state,
    @Default(false) bool lights_on,
    @Default(DeviceHealthType.unavailable) DeviceHealthType health,
    String? health_details,
  }) = _GarageMetrics;

  factory GarageMetrics.fromJson(Map<String, dynamic> json) => _$GarageMetricsFromJson(json);
}
