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
      parameterName: json['parameterName'] as String?,
      parameterValue: json['parameterValue'] as String?,
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
      'parameterName': instance.parameterName,
      'parameterValue': instance.parameterValue,
    };
