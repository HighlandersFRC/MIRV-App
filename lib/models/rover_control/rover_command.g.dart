// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralRoverCommand _$$GeneralRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$GeneralRoverCommand(
      $enumDecode(_$RoverCommandTypeGeneralEnumMap, json['command']),
      subsystem:
          $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ??
              RoverSubsystemType.general,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GeneralRoverCommandToJson(
        _$GeneralRoverCommand instance) =>
    <String, dynamic>{
      'command': _$RoverCommandTypeGeneralEnumMap[instance.command],
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeGeneralEnumMap = {
  RoverCommandTypeGeneral.deploy: 'deploy',
  RoverCommandTypeGeneral.cancel: 'cancel',
  RoverCommandTypeGeneral.stow: 'stow',
  RoverCommandTypeGeneral.enable: 'enable',
  RoverCommandTypeGeneral.disable: 'disable',
  RoverCommandTypeGeneral.e_stop: 'e_stop',
  RoverCommandTypeGeneral.start_manual_control: 'start_manual_control',
  RoverCommandTypeGeneral.stop_manual_control: 'stop_manual_control',
  RoverCommandTypeGeneral.deploy_pi_lits: 'deploy_pi_lits',
  RoverCommandTypeGeneral.retrieve_pi_lits: 'retrieve_pi_lits',
  RoverCommandTypeGeneral.enable_remote_operation: 'enable_remote_operation',
  RoverCommandTypeGeneral.disable_remote_operation: 'disable_remote_operation',
};

const _$RoverSubsystemTypeEnumMap = {
  RoverSubsystemType.general: 'general',
  RoverSubsystemType.intake: 'intake',
  RoverSubsystemType.drivetrain: 'drivetrain',
  RoverSubsystemType.movement: 'movement',
  RoverSubsystemType.conveyor: 'conveyor',
  RoverSubsystemType.sensors: 'sensors',
  RoverSubsystemType.heartbeat: 'heartbeat',
};

_$HeartbeatRoverCommand _$$HeartbeatRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$HeartbeatRoverCommand(
      $enumDecode(_$RoverCommandTypeHeartbeatEnumMap, json['command']),
      subsystem:
          $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ??
              RoverSubsystemType.heartbeat,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HeartbeatRoverCommandToJson(
        _$HeartbeatRoverCommand instance) =>
    <String, dynamic>{
      'command': _$RoverCommandTypeHeartbeatEnumMap[instance.command],
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeHeartbeatEnumMap = {
  RoverCommandTypeHeartbeat.heartbeat: 'heartbeat',
};

_$IntakeRoverCommand _$$IntakeRoverCommandFromJson(Map<String, dynamic> json) =>
    _$IntakeRoverCommand(
      $enumDecode(_$RoverCommandTypeIntakeEnumMap, json['command']),
      subsystem:
          $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ??
              RoverSubsystemType.intake,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IntakeRoverCommandToJson(
        _$IntakeRoverCommand instance) =>
    <String, dynamic>{
      'command': _$RoverCommandTypeIntakeEnumMap[instance.command],
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeIntakeEnumMap = {
  RoverCommandTypeIntake.place_1_pi_lit: 'place_1_pi_lit',
  RoverCommandTypeIntake.pickup_1_pi_lit: 'pickup_1_pi_lit',
};

_$DrivetrainRoverCommand _$$DrivetrainRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$DrivetrainRoverCommand(
      $enumDecode(_$RoverCommandTypeDrivetrainEnumMap, json['command']),
      RoverCommandParameters.fromJson(
          json['commandParameters'] as Map<String, dynamic>),
      subsystem:
          $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ??
              RoverSubsystemType.drivetrain,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DrivetrainRoverCommandToJson(
        _$DrivetrainRoverCommand instance) =>
    <String, dynamic>{
      'command': _$RoverCommandTypeDrivetrainEnumMap[instance.command],
      'commandParameters': instance.commandParameters,
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeDrivetrainEnumMap = {
  RoverCommandTypeDrivetrain.arcade: 'arcade',
  RoverCommandTypeDrivetrain.tank: 'tank',
};

_$MovementRoverCommand _$$MovementRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$MovementRoverCommand(
      $enumDecode(_$RoverCommandTypeMovementEnumMap, json['command']),
      RoverCommandParameters.fromJson(
          json['commandParameters'] as Map<String, dynamic>),
      subsystem:
          $enumDecodeNullable(_$RoverSubsystemTypeEnumMap, json['subsystem']) ??
              RoverSubsystemType.movement,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MovementRoverCommandToJson(
        _$MovementRoverCommand instance) =>
    <String, dynamic>{
      'command': _$RoverCommandTypeMovementEnumMap[instance.command],
      'commandParameters': instance.commandParameters,
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'runtimeType': instance.$type,
    };

const _$RoverCommandTypeMovementEnumMap = {
  RoverCommandTypeMovement.to_location: 'to_location',
};

_$RoverCommandParametersDrivetrain _$$RoverCommandParametersDrivetrainFromJson(
        Map<String, dynamic> json) =>
    _$RoverCommandParametersDrivetrain(
      (json['x'] as num).toDouble(),
      (json['y'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RoverCommandParametersDrivetrainToJson(
        _$RoverCommandParametersDrivetrain instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'runtimeType': instance.$type,
    };

_$RoverCommandParametersMovement _$$RoverCommandParametersMovementFromJson(
        Map<String, dynamic> json) =>
    _$RoverCommandParametersMovement(
      (json['lat'] as num).toDouble(),
      (json['long'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RoverCommandParametersMovementToJson(
        _$RoverCommandParametersMovement instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'runtimeType': instance.$type,
    };
