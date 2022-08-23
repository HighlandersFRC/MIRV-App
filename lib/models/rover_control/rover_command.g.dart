// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverCommand _$$_RoverCommandFromJson(Map<String, dynamic> json) =>
    _$_RoverCommand(
      $enumDecode(_$RoverSubsystemTypeEnumMap, json['subsystem']),
      $enumDecode(_$RoverCommandTypeEnumMap, json['command']),
      client_id: json['client_id'] as String?,
      commandParameters: json['commandParameters'] == null
          ? null
          : RoverCommandParameters.fromJson(
              json['commandParameters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoverCommandToJson(_$_RoverCommand instance) =>
    <String, dynamic>{
      'subsystem': _$RoverSubsystemTypeEnumMap[instance.subsystem],
      'command': _$RoverCommandTypeEnumMap[instance.command],
      'client_id': instance.client_id,
      'commandParameters': instance.commandParameters,
    };

const _$RoverSubsystemTypeEnumMap = {
  RoverSubsystemType.general: 'general',
  RoverSubsystemType.intake: 'intake',
  RoverSubsystemType.drivetrain: 'drivetrain',
  RoverSubsystemType.heartbeat: 'heartbeat',
  RoverSubsystemType.pi_lit: 'pi_lit',
  RoverSubsystemType.garage: 'garage',
  RoverSubsystemType.camera: 'camera',
};

const _$RoverCommandTypeEnumMap = {
  RoverCommandType.deploy: 'deploy',
  RoverCommandType.cancel: 'cancel',
  RoverCommandType.stow: 'stow',
  RoverCommandType.enable: 'enable',
  RoverCommandType.disable: 'disable',
  RoverCommandType.e_stop: 'e_stop',
  RoverCommandType.start_manual_control: 'start_manual_control',
  RoverCommandType.stop_manual_control: 'stop_manual_control',
  RoverCommandType.deploy_pi_lits: 'deploy_pi_lits',
  RoverCommandType.retrieve_pi_lits: 'retrieve_pi_lits',
  RoverCommandType.enable_remote_operation: 'enable_remote_operation',
  RoverCommandType.disable_remote_operation: 'disable_remote_operation',
  RoverCommandType.heartbeat: 'heartbeat',
  RoverCommandType.place_1_pi_lit: 'place_1_pi_lit',
  RoverCommandType.pickup_1_pi_lit: 'pickup_1_pi_lit',
  RoverCommandType.unload_pi_lits: 'unload_pi_lits',
  RoverCommandType.load_pi_lits: 'load_pi_lits',
  RoverCommandType.deploy_intake: 'deploy_intake',
  RoverCommandType.retract_intake: 'retract_intake',
  RoverCommandType.idle: 'idle',
  RoverCommandType.wave: 'wave',
  RoverCommandType.wave_reverse: 'wave_reverse',
  RoverCommandType.simultaneous: 'simultaneous',
  RoverCommandType.set_number_pi_lits: 'set_number_pi_lits',
  RoverCommandType.arcade: 'arcade',
  RoverCommandType.tank: 'tank',
  RoverCommandType.to_location: 'to_location',
  RoverCommandType.switch_camera: 'switch_camera',
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

_$RoverCommandParametersDestination
    _$$RoverCommandParametersDestinationFromJson(Map<String, dynamic> json) =>
        _$RoverCommandParametersDestination(
          (json['lat'] as num).toDouble(),
          (json['long'] as num).toDouble(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RoverCommandParametersDestinationToJson(
        _$RoverCommandParametersDestination instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'runtimeType': instance.$type,
    };

_$RoverCommandParametersPiLit _$$RoverCommandParametersPiLitFromJson(
        Map<String, dynamic> json) =>
    _$RoverCommandParametersPiLit(
      json['piLitsLeft'] as int,
      json['piLitsRight'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RoverCommandParametersPiLitToJson(
        _$RoverCommandParametersPiLit instance) =>
    <String, dynamic>{
      'piLitsLeft': instance.piLitsLeft,
      'piLitsRight': instance.piLitsRight,
      'runtimeType': instance.$type,
    };

_$RoverCommandParametersPiLitPlacement
    _$$RoverCommandParametersPiLitPlacementFromJson(
            Map<String, dynamic> json) =>
        _$RoverCommandParametersPiLitPlacement(
          DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
          $enumDecode(_$PiLitFormationTypeEnumMap, json['formation']),
          (json['heading'] as num).toDouble(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RoverCommandParametersPiLitPlacementToJson(
        _$RoverCommandParametersPiLitPlacement instance) =>
    <String, dynamic>{
      'location': instance.location,
      'formation': _$PiLitFormationTypeEnumMap[instance.formation],
      'heading': instance.heading,
      'runtimeType': instance.$type,
    };

const _$PiLitFormationTypeEnumMap = {
  PiLitFormationType.taper_right_3: 'taper_right_3',
  PiLitFormationType.taper_left_3: 'taper_left_3',
  PiLitFormationType.taper_right_5: 'taper_right_5',
  PiLitFormationType.taper_left_5: 'taper_left_5',
  PiLitFormationType.spear_7: 'spear_7',
};

_$RoverCommandParametersCamera _$$RoverCommandParametersCameraFromJson(
        Map<String, dynamic> json) =>
    _$RoverCommandParametersCamera(
      $enumDecode(_$CameraTypeEnumMap, json['camera']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RoverCommandParametersCameraToJson(
        _$RoverCommandParametersCamera instance) =>
    <String, dynamic>{
      'camera': _$CameraTypeEnumMap[instance.camera],
      'runtimeType': instance.$type,
    };

const _$CameraTypeEnumMap = {
  CameraType.webcam_front: 'webcam_front',
  CameraType.vision_front: 'vision_front',
  CameraType.vision_back: 'vision_back',
};
