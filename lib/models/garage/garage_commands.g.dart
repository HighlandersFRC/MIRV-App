// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage_commands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralGarageCommand _$$GeneralGarageCommandFromJson(
        Map<String, dynamic> json) =>
    _$GeneralGarageCommand(
      $enumDecode(_$GarageCommandTypeEnumMap, json['command']),
    );

Map<String, dynamic> _$$GeneralGarageCommandToJson(
        _$GeneralGarageCommand instance) =>
    <String, dynamic>{
      'command': _$GarageCommandTypeEnumMap[instance.command],
    };

const _$GarageCommandTypeEnumMap = {
  GarageCommandType.lock: 'lock',
  GarageCommandType.unlock: 'unlock',
  GarageCommandType.retract: 'retract',
  GarageCommandType.enable: 'enable',
  GarageCommandType.deploy: 'deploy',
};
