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
      protocolId: json['protocolId'] as String?,
      familyName: json['familyName'] as String?,
      correctedLevelX1: json['correctedLevelX1'] as String?,
      correctedLevelX2: json['correctedLevelX2'] as String?,
      correctedLevelX3: json['correctedLevelX3'] as String?,
      averageCorrectedLevelX: json['averageCorrectedLevelX'] as String?,
      correctedLevelY1: json['correctedLevelY1'] as String?,
      correctedLevelY2: json['correctedLevelY2'] as String?,
      correctedLevelY3: json['correctedLevelY3'] as String?,
      averageCorrectedLevelY: json['averageCorrectedLevelY'] as String?,
      correctedLevelZ1: json['correctedLevelZ1'] as String?,
      correctedLevelZ2: json['correctedLevelZ2'] as String?,
      correctedLevelZ3: json['correctedLevelZ3'] as String?,
      averageCorrectedLevelZ: json['averageCorrectedLevelZ'] as String?,
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
      'protocolId': instance.protocolId,
      'familyName': instance.familyName,
      'correctedLevelX1': instance.correctedLevelX1,
      'correctedLevelX2': instance.correctedLevelX2,
      'correctedLevelX3': instance.correctedLevelX3,
      'averageCorrectedLevelX': instance.averageCorrectedLevelX,
      'correctedLevelY1': instance.correctedLevelY1,
      'correctedLevelY2': instance.correctedLevelY2,
      'correctedLevelY3': instance.correctedLevelY3,
      'averageCorrectedLevelY': instance.averageCorrectedLevelY,
      'correctedLevelZ1': instance.correctedLevelZ1,
      'correctedLevelZ2': instance.correctedLevelZ2,
      'correctedLevelZ3': instance.correctedLevelZ3,
      'averageCorrectedLevelZ': instance.averageCorrectedLevelZ,
    };
