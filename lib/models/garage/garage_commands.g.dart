// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage_commands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralGarageCommand _$$GeneralGarageCommandFromJson(
        Map<String, dynamic> json) =>
    _$GeneralGarageCommand(
      json['command'],
      subsystem: json['subsystem'] ?? GarageSubsystemType.general,
    );

Map<String, dynamic> _$$GeneralGarageCommandToJson(
        _$GeneralGarageCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'subsystem': instance.subsystem,
    };
