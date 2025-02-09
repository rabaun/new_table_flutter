// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_protocol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrimaryProtocolModelImpl _$$PrimaryProtocolModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrimaryProtocolModelImpl(
      id: (json['id'] as num?)?.toInt(),
      organizationName: json['organizationName'] as String?,
      organizationId: json['organizationId'] as String?,
      measurementDate: json['measurementDate'] as String?,
      workplace: json['workplace'] as String?,
      workplaceId: json['workplaceId'] as String?,
      protocolId: json['protocolId'] as String?,
      familyName: json['familyName'] as String?,
      parameterName: json['parameterName'] as String?,
      parameterValue1: json['parameterValue1'] as String?,
      parameterValue2: json['parameterValue2'] as String?,
      parameterValue3: json['parameterValue3'] as String?,
      averageConcentration: json['averageConcentration'] as String?,
    );

Map<String, dynamic> _$$PrimaryProtocolModelImplToJson(
        _$PrimaryProtocolModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationName': instance.organizationName,
      'organizationId': instance.organizationId,
      'measurementDate': instance.measurementDate,
      'workplace': instance.workplace,
      'workplaceId': instance.workplaceId,
      'protocolId': instance.protocolId,
      'familyName': instance.familyName,
      'parameterName': instance.parameterName,
      'parameterValue1': instance.parameterValue1,
      'parameterValue2': instance.parameterValue2,
      'parameterValue3': instance.parameterValue3,
      'averageConcentration': instance.averageConcentration,
    };
