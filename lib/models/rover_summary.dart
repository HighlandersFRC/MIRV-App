import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/models/rover_status_type.dart';

part 'rover_summary.freezed.dart';
part 'rover_summary.g.dart';

@freezed
class RoverSummary with _$RoverSummary {
  const factory RoverSummary(
      {@Default("unknown") String rover_id,
      @Default(RoverStateType.disconnected) RoverStateType state, //Rover StateType
      @Default(RoverStatusType.available) RoverStatusType status, //RoverStatusType
      @Default(-1) int battery_percent}) = _RoverSummary;

  factory RoverSummary.fromJson(Map<String, dynamic> json) => _$RoverSummaryFromJson(json);
}
