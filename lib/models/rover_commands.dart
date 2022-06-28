import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/models/rover_command_type.dart';
import 'package:test/models/command.json';
part 'rover_commands.freezed.dart';
part 'rover_commands.g.dart';

@freezed
class RoverCommands with _$RoverCommands {
  const factory RoverCommands({
    required RoverCommandType commandType,
    @Default("") dynamic commandParameters,
  }) = _RoverCommands;
  factory RoverCommands.fromJson(Map<String, dynamic> json) =>
      _$RoverCommandsFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
