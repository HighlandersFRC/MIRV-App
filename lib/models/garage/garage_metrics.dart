import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/garage/garage_status_type.dart';
import 'package:mirv/models/garage/garage_state_type.dart';

part 'garage_metrics.freezed.dart';
part 'garage_metrics.g.dart';

@freezed
class GarageMetrics with _$GarageMetrics {
  const factory GarageMetrics({
    @Default("unknown") String garageId,
    @Default(GarageStateType.unlocked) GarageStateType state, //Garage StateType
    @Default(GarageStatusType.available) GarageStatusType status, //GarageStatusType
    @Default(GarageMetricLocation()) GarageMetricLocation location}) = _GarageMetrics;

  factory GarageMetrics.fromJson(Map<String, dynamic> json) => _$GarageMetricsFromJson(json);
}

@freezed
class GarageMetricLocation with _$GarageMetricLocation {
  const factory GarageMetricLocation({
    @Default(0.0) double long,
    @Default(0.0) double lat,
  }) = _GarageMetricLocation;

  factory GarageMetricLocation.fromJson(Map<String, dynamic> json) => _$GarageMetricLocationFromJson(json);
}
