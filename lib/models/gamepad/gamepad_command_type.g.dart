// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamepad_command_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$__GamepadAxisCommand _$$__GamepadAxisCommandFromJson(
        Map<String, dynamic> json) =>
    _$__GamepadAxisCommand(
      type: $enumDecode(_$GamepadAxisTypeEnumMap, json['type']),
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$__GamepadAxisCommandToJson(
        _$__GamepadAxisCommand instance) =>
    <String, dynamic>{
      'type': _$GamepadAxisTypeEnumMap[instance.type],
      'x': instance.x,
      'y': instance.y,
    };

const _$GamepadAxisTypeEnumMap = {
  GamepadAxisType.left: 'left',
  GamepadAxisType.right: 'right',
};

_$_GamepadTriggerCommand _$$_GamepadTriggerCommandFromJson(
        Map<String, dynamic> json) =>
    _$_GamepadTriggerCommand(
      type: $enumDecode(_$GamepadTriggerTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$_GamepadTriggerCommandToJson(
        _$_GamepadTriggerCommand instance) =>
    <String, dynamic>{
      'type': _$GamepadTriggerTypeEnumMap[instance.type],
      'value': instance.value,
    };

const _$GamepadTriggerTypeEnumMap = {
  GamepadTriggerType.left: 'left',
  GamepadTriggerType.right: 'right',
};

_$_GamepadBumperCommand _$$_GamepadBumperCommandFromJson(
        Map<String, dynamic> json) =>
    _$_GamepadBumperCommand(
      type: $enumDecode(_$GamepadBumperTypeEnumMap, json['type']),
      isPressed: (json['isPressed'] as num).toDouble(),
    );

Map<String, dynamic> _$$_GamepadBumperCommandToJson(
        _$_GamepadBumperCommand instance) =>
    <String, dynamic>{
      'type': _$GamepadBumperTypeEnumMap[instance.type],
      'isPressed': instance.isPressed,
    };

const _$GamepadBumperTypeEnumMap = {
  GamepadBumperType.left: 'left',
  GamepadBumperType.right: 'right',
};

_$_GamepadDPadCommand _$$_GamepadDPadCommandFromJson(
        Map<String, dynamic> json) =>
    _$_GamepadDPadCommand(
      type: $enumDecode(_$GamepadDPadTypeEnumMap, json['type']),
      isPressed: json['isPressed'] as int,
    );

Map<String, dynamic> _$$_GamepadDPadCommandToJson(
        _$_GamepadDPadCommand instance) =>
    <String, dynamic>{
      'type': _$GamepadDPadTypeEnumMap[instance.type],
      'isPressed': instance.isPressed,
    };

const _$GamepadDPadTypeEnumMap = {
  GamepadDPadType.left: 'left',
  GamepadDPadType.right: 'right',
  GamepadDPadType.up: 'up',
  GamepadDPadType.down: 'down',
};

_$_GamepadButtonCommand _$$_GamepadButtonCommandFromJson(
        Map<String, dynamic> json) =>
    _$_GamepadButtonCommand(
      type: $enumDecode(_$GamepadButtonTypeEnumMap, json['type']),
      isPressed: json['isPressed'] as bool,
    );

Map<String, dynamic> _$$_GamepadButtonCommandToJson(
        _$_GamepadButtonCommand instance) =>
    <String, dynamic>{
      'type': _$GamepadButtonTypeEnumMap[instance.type],
      'isPressed': instance.isPressed,
    };

const _$GamepadButtonTypeEnumMap = {
  GamepadButtonType.x: 'x',
  GamepadButtonType.y: 'y',
  GamepadButtonType.a: 'a',
  GamepadButtonType.b: 'b',
  GamepadButtonType.select: 'select',
  GamepadButtonType.start: 'start',
  GamepadButtonType.center3: 'center3',
  GamepadButtonType.home: 'home',
};
