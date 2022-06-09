import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/models/rover_status_type.dart';

part 'rover_summary.freezed.dart';
part 'rover_summary.g.dart';

@freezed
class RoverSummary with _$RoverSummary {
  const factory RoverSummary(
      {@Default("unknown") String roverId,
      @Default(RoverStateType.disabled) RoverStateType state, //RoverStateType
      @Default(RoverStatusType.unavailable) RoverStatusType status, //RoverStatusType
      @Default(-1) int battery}) = _RoverSummary;

  factory RoverSummary.fromJson(Map<String, dynamic> json) => _$RoverSummaryFromJson(json);
}
