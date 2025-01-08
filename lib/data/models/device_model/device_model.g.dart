// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceModelImpl _$$DeviceModelImplFromJson(Map<String, dynamic> json) =>
    _$DeviceModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      serialNumber: json['serialNumber'] as String?,
      registryNumber: json['registryNumber'] as String?,
    );

Map<String, dynamic> _$$DeviceModelImplToJson(_$DeviceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'serialNumber': instance.serialNumber,
      'registryNumber': instance.registryNumber,
    };
