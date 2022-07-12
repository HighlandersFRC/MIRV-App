// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralRoverCommand _$$GeneralRoverCommandFromJson(Map<String, dynamic> json) => _$GeneralRoverCommand(
      $enumDecode(_$RoverCommandTypeGeneralEnumMap, json['commandType']),
      subsystem: $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ?? RoverSubsystemType.general,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GeneralRoverCommandToJson(_$GeneralRoverCommand instance) => <String, dynamic>{
      'commandType': _$RoverCommandTypeGeneralEnumMap[instance.commandType],
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeGeneralEnumMap = {
  RoverCommandTypeGeneral.deploy: 'deploy',
  RoverCommandTypeGeneral.stow: 'stow',
  RoverCommandTypeGeneral.enable: 'enable',
  RoverCommandTypeGeneral.disable: 'disable',
  RoverCommandTypeGeneral.e_stop: 'e_stop',
  RoverCommandTypeGeneral.deploy_pi_lits: 'deploy_pi_lits',
  RoverCommandTypeGeneral.retrieve_pi_lits: 'retrieve_pi_lits',
  RoverCommandTypeGeneral.enable_remote_operation: 'enable_remote_operation',
};

const _$RoverSubsystemTypeEnumMap = {
  RoverSubsystemType.general: 'general',
  RoverSubsystemType.intake: 'intake',
  RoverSubsystemType.drivetrain: 'drivetrain',
  RoverSubsystemType.conveyor: 'conveyor',
  RoverSubsystemType.sensors: 'sensors',
};

_$IntakeRoverCommand _$$IntakeRoverCommandFromJson(Map<String, dynamic> json) => _$IntakeRoverCommand(
      $enumDecode(_$RoverCommandTypeIntakeEnumMap, json['commandType']),
      subsystem: $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ?? RoverSubsystemType.intake,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IntakeRoverCommandToJson(_$IntakeRoverCommand instance) => <String, dynamic>{
      'commandType': _$RoverCommandTypeIntakeEnumMap[instance.commandType],
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeIntakeEnumMap = {
  RoverCommandTypeIntake.disable: 'disable',
  RoverCommandTypeIntake.reset: 'reset',
  RoverCommandTypeIntake.intake: 'intake',
  RoverCommandTypeIntake.store: 'store',
  RoverCommandTypeIntake.deposit: 'deposit',
  RoverCommandTypeIntake.switch_left: 'switch_left',
  RoverCommandTypeIntake.switch_right: 'switch_right',
};

_$DrivetrainRoverCommand _$$DrivetrainRoverCommandFromJson(Map<String, dynamic> json) => _$DrivetrainRoverCommand(
      $enumDecode(_$RoverCommandTypeDrivetrainEnumMap, json['commandType']),
      (json['x'] as num).toDouble(),
      (json['y'] as num).toDouble(),
      subsystem: $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ?? RoverSubsystemType.drivetrain,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DrivetrainRoverCommandToJson(_$DrivetrainRoverCommand instance) => <String, dynamic>{
      'commandType': _$RoverCommandTypeDrivetrainEnumMap[instance.commandType],
      'x': instance.x,
      'y': instance.y,
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeDrivetrainEnumMap = {
  RoverCommandTypeDrivetrain.arcade: 'arcade',
  RoverCommandTypeDrivetrain.tank: 'tank',
};
