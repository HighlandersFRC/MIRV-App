import 'package:freezed_annotation/freezed_annotation.dart';

part 'rover_commands.freezed.dart';
part 'rover_commands.g.dart';

@freezed
class RoverCommands with _$RoverCommands {
  const factory RoverCommands({
    required String buttonInput,
  }) = _RoverCommands;
  factory RoverCommands.fromJson(Map<String, dynamic> json) =>
      _$RoverCommandsFromJson(json);

  Map<String, dynamic> toJson() {
    return {
      'buttonInput': buttonInput,
    };
  }
}
