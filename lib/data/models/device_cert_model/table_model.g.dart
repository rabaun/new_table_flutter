// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: json['id'] as int?,
      serialNumber: json['serialNumber'] as String?,
      cerVerification: json['cerVerification'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serialNumber': instance.serialNumber,
      'cerVerification': instance.cerVerification,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
