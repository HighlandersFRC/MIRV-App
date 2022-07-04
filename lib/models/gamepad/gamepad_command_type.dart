import 'package:freezed_annotation/freezed_annotation.dart';

import 'gamepad_axis_type.dart';

part 'gamepad_command_type.freezed.dart';
part 'gamepad_command_type.g.dart';

class GamepadCommand {
  final GamepadCommandType type;
  final dynamic command;
  GamepadCommand({required this.type, required this.command});

  dynamic _getCommand(GamepadCommandType type, dynamic command) {
    switch (type) {
      case GamepadCommandType.axis:
        return GamepadAxisCommand.fromJson(command);
      case GamepadCommandType.trigger:
        return GamepadTriggerCommand.fromJson(command);
      case GamepadCommandType.bumper:
        return GamepadBumperCommand.fromJson(command);
      case GamepadCommandType.dpad:
        return GamepadDPadCommand.fromJson(command);
      case GamepadCommandType.button:
        return GamepadButtonCommand.fromJson(command);
      default:
    }
  }

  static GamepadCommandType _getValue(String val) {
    switch (val) {
      case "axis":
        return GamepadCommandType.axis;
      case "trigger":
        return GamepadCommandType.trigger;
      case "bumper":
        return GamepadCommandType.bumper;
      case "dpad":
        return GamepadCommandType.dpad;
      case "button":
        return GamepadCommandType.button;
      default:
        return GamepadCommandType.button;
    }
  }

  Map<String, dynamic> fromJson(Map<String, dynamic> json) => <String, dynamic>{
        'type': _getValue(json['type']),
        'command': _getCommand(json['type'], json['command']),
      };
}

@freezed
class GamepadAxisCommand with _$GamepadAxisCommand {
  const factory GamepadAxisCommand(
      {required GamepadAxisType type,
      required double x, //RoverStateType
      required double y,
      required DateTime ts}) = _GamepadAxisCommand;

  factory GamepadAxisCommand.fromJson(Map<String, dynamic> json) => _$GamepadAxisCommandFromJson(json);
}

@freezed
class GamepadTriggerCommand with _$GamepadTriggerCommand {
  const factory GamepadTriggerCommand({required GamepadTriggerType type, required double value}) = _GamepadTriggerCommand;

  factory GamepadTriggerCommand.fromJson(Map<String, dynamic> json) => _$GamepadTriggerCommandFromJson(json);
}

@freezed
class GamepadBumperCommand with _$GamepadBumperCommand {
  const factory GamepadBumperCommand({required GamepadBumperType type, required double isPressed}) = _GamepadBumperCommand;

  factory GamepadBumperCommand.fromJson(Map<String, dynamic> json) => _$GamepadBumperCommandFromJson(json);
}

@freezed
class GamepadDPadCommand with _$GamepadDPadCommand {
  const factory GamepadDPadCommand({required GamepadDPadType type, required int isPressed}) = _GamepadDPadCommand;

  factory GamepadDPadCommand.fromJson(Map<String, dynamic> json) => _$GamepadDPadCommandFromJson(json);
}

@freezed
class GamepadButtonCommand with _$GamepadButtonCommand {
  const factory GamepadButtonCommand({required GamepadButtonType type, required bool isPressed}) = _GamepadButtonCommand;

  factory GamepadButtonCommand.fromJson(Map<String, dynamic> json) => _$GamepadButtonCommandFromJson(json);
}
