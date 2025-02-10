// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chemical_protocol_geolan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChemicalProtocolGeolanModelImpl _$$ChemicalProtocolGeolanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChemicalProtocolGeolanModelImpl(
      id: (json['id'] as num?)?.toInt(),
      organizationName: json['organizationName'] as String?,
      organizationId: json['organizationId'] as String?,
      measurementDate: json['measurementDate'] as String?,
      workplace: json['workplace'] as String?,
      workplaceId: json['workplaceId'] as String?,
      protocolId: json['protocolId'] as String?,
      familyName: json['familyName'] as String?,
      parameterName: json['parameterName'] as String?,
      parameterValue: json['parameterValue'] as String?,
    );

Map<String, dynamic> _$$ChemicalProtocolGeolanModelImplToJson(
        _$ChemicalProtocolGeolanModelImpl instance) =>
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
      'parameterValue': instance.parameterValue,
    };
