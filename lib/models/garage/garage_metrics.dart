import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/garage/garage_position.dart';
import 'package:mirv/models/garage/garage_status_type.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/rover_metrics.dart';

part 'garage_metrics.freezed.dart';
part 'garage_metrics.g.dart';

@freezed
class GarageMetrics with _$GarageMetrics {
  const factory GarageMetrics(
      {required String garage_id,
      String? linked_rover_id,
      required bool latched,
      @Default(GaragePosition.down) GaragePosition position, //Garage StateType
      @Default(GarageStatusType.available) GarageStatusType status, //GarageStatusType
      @Default(RoverMetricLocation()) RoverMetricLocation location}) = _GarageMetrics;

  factory GarageMetrics.fromJson(Map<String, dynamic> json) => _$GarageMetricsFromJson(json);
}
