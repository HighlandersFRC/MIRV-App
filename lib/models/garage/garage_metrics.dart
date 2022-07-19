import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/garage/garage_status_type.dart';
import 'package:mirv/models/garage/garage_state_type.dart';

part 'garage_metrics.freezed.dart';
part 'garage_metrics.g.dart';

@freezed
class GarageMetrics with _$GarageMetrics {
  const factory GarageMetrics({
    @Default("unknown") String garageId,
    @Default(GarageStateType.unlocked) GarageStateType state, //Rover StateType
    @Default(GarageStatusType.available) GarageStatusType status, //RoverStatusType}
  }) = _GarageMetrics;

  factory GarageMetrics.fromJson(Map<String, dynamic> json) => _$GarageMetricsFromJson(json);
}
