// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_commands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverCommands _$$_RoverCommandsFromJson(Map<String, dynamic> json) =>
    _$_RoverCommands(
      commandType: $enumDecode(_$RoverCommandTypeEnumMap, json['commandType']),
      commandParameters: json['commandParameters'] ?? "",
    );

Map<String, dynamic> _$$_RoverCommandsToJson(_$_RoverCommands instance) =>
    <String, dynamic>{
      'commandType': _$RoverCommandTypeEnumMap[instance.commandType],
      'commandParameters': instance.commandParameters,
    };

const _$RoverCommandTypeEnumMap = {
  RoverCommandType.enable: 'enable',
  RoverCommandType.disable: 'disable',
  RoverCommandType.eStop: 'eStop',
  RoverCommandType.dock: 'dock',
  RoverCommandType.deploy: 'deploy',
  RoverCommandType.retrievePiLits: 'retrievePiLits',
  RoverCommandType.deployPiLits: 'deployPiLits',
};
