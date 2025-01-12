// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_vibration_protocol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralVibrationProtocolModelImpl
    _$$GeneralVibrationProtocolModelImplFromJson(Map<String, dynamic> json) =>
        _$GeneralVibrationProtocolModelImpl(
          id: (json['id'] as num?)?.toInt(),
          organizationName: json['organizationName'] as String?,
          organizationId: json['organizationId'] as String?,
          measurementDate: json['measurementDate'] as String?,
          workplace: json['workplace'] as String?,
          workplaceId: json['workplaceId'] as String?,
          parameterName: json['parameterName'] as String?,
          correctedLevelX: json['correctedLevelX'] as String?,
          correctedLevelY: json['correctedLevelY'] as String?,
          correctedLevelZ: json['correctedLevelZ'] as String?,
        );

Map<String, dynamic> _$$GeneralVibrationProtocolModelImplToJson(
        _$GeneralVibrationProtocolModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationName': instance.organizationName,
      'organizationId': instance.organizationId,
      'measurementDate': instance.measurementDate,
      'workplace': instance.workplace,
      'workplaceId': instance.workplaceId,
      'parameterName': instance.parameterName,
      'correctedLevelX': instance.correctedLevelX,
      'correctedLevelY': instance.correctedLevelY,
      'correctedLevelZ': instance.correctedLevelZ,
    };
