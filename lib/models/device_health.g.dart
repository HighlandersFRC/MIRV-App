// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_health.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceHealth _$$_DeviceHealthFromJson(Map<String, dynamic> json) =>
    _$_DeviceHealth(
      health: $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['health']) ??
          DeviceHealthType.unavailable,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$_DeviceHealthToJson(_$_DeviceHealth instance) =>
    <String, dynamic>{
      'health': _$DeviceHealthTypeEnumMap[instance.health],
      'details': instance.details,
    };

const _$DeviceHealthTypeEnumMap = {
  DeviceHealthType.healthy: 'healthy',
  DeviceHealthType.unhealthy: 'unhealthy',
  DeviceHealthType.degraded: 'degraded',
  DeviceHealthType.unavailable: 'unavailable',
};
