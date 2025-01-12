// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ultraviolet_radiation_protocol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UltravioletRadiationProtocolModelImpl
    _$$UltravioletRadiationProtocolModelImplFromJson(
            Map<String, dynamic> json) =>
        _$UltravioletRadiationProtocolModelImpl(
          id: (json['id'] as num?)?.toInt(),
          organizationName: json['organizationName'] as String?,
          organizationId: json['organizationId'] as String?,
          measurementDate: json['measurementDate'] as String?,
          workplace: json['workplace'] as String?,
          workplaceId: json['workplaceId'] as String?,
          parameterName: json['parameterName'] as String?,
          uvAIntensityH05_10: json['uvAIntensityH05_10'] as String?,
          uvAIntensityH15: json['uvAIntensityH15'] as String?,
          uvBIntensityH05_10: json['uvBIntensityH05_10'] as String?,
          uvBIntensityH15: json['uvBIntensityH15'] as String?,
        );

Map<String, dynamic> _$$UltravioletRadiationProtocolModelImplToJson(
        _$UltravioletRadiationProtocolModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationName': instance.organizationName,
      'organizationId': instance.organizationId,
      'measurementDate': instance.measurementDate,
      'workplace': instance.workplace,
      'workplaceId': instance.workplaceId,
      'parameterName': instance.parameterName,
      'uvAIntensityH05_10': instance.uvAIntensityH05_10,
      'uvAIntensityH15': instance.uvAIntensityH15,
      'uvBIntensityH05_10': instance.uvBIntensityH05_10,
      'uvBIntensityH15': instance.uvBIntensityH15,
    };
