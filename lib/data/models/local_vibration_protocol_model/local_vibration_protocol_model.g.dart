// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_vibration_protocol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalVibrationProtocolModelImpl _$$LocalVibrationProtocolModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalVibrationProtocolModelImpl(
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

Map<String, dynamic> _$$LocalVibrationProtocolModelImplToJson(
        _$LocalVibrationProtocolModelImpl instance) =>
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
