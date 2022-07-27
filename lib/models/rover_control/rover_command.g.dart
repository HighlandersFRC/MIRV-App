// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralRoverCommand _$$GeneralRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$GeneralRoverCommand(
      json['command'],
      subsystem: json['subsystem'] ?? RoverSubsystemType.general,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GeneralRoverCommandToJson(
        _$GeneralRoverCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'subsystem': instance.subsystem,
      'runtimeType': instance.$type,
    };

_$HeartbeatRoverCommand _$$HeartbeatRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$HeartbeatRoverCommand(
      json['command'],
      subsystem: json['subsystem'] ?? RoverSubsystemType.general,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HeartbeatRoverCommandToJson(
        _$HeartbeatRoverCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'subsystem': instance.subsystem,
      'runtimeType': instance.$type,
    };

_$IntakeRoverCommand _$$IntakeRoverCommandFromJson(Map<String, dynamic> json) =>
    _$IntakeRoverCommand(
      json['command'],
      subsystem: json['subsystem'] ?? RoverSubsystemType.intake,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IntakeRoverCommandToJson(
        _$IntakeRoverCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'subsystem': instance.subsystem,
      'runtimeType': instance.$type,
    };

_$DrivetrainRoverCommand _$$DrivetrainRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$DrivetrainRoverCommand(
      json['command'],
      RoverCommandParameters.fromJson(
          json['commandParameters'] as Map<String, dynamic>),
      subsystem: json['subsystem'] ?? RoverSubsystemType.drivetrain,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DrivetrainRoverCommandToJson(
        _$DrivetrainRoverCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'commandParameters': instance.commandParameters,
      'subsystem': instance.subsystem,
      'runtimeType': instance.$type,
    };

_$MovementRoverCommand _$$MovementRoverCommandFromJson(
        Map<String, dynamic> json) =>
    _$MovementRoverCommand(
      json['command'],
      RoverCommandParameters.fromJson(
          json['commandParameters'] as Map<String, dynamic>),
      subsystem: json['subsystem'] ?? RoverSubsystemType.movement,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MovementRoverCommandToJson(
        _$MovementRoverCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'commandParameters': instance.commandParameters,
      'subsystem': instance.subsystem,
      'runtimeType': instance.$type,
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
