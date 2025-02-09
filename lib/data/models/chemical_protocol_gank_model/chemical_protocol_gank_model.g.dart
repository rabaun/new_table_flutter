// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chemical_protocol_gank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChemicalProtocolGankModelImpl _$$ChemicalProtocolGankModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChemicalProtocolGankModelImpl(
      id: (json['id'] as num?)?.toInt(),
      organizationName: json['organizationName'] as String?,
      organizationId: json['organizationId'] as String?,
      measurementDate: json['measurementDate'] as String?,
      workplace: json['workplace'] as String?,
      workplaceId: json['workplaceId'] as String?,
      protocolId: json['protocolId'] as String?,
      familyName: json['familyName'] as String?,
      parameterName: json['parameterName'] as String?,
      concentration1_1: json['concentration1_1'] as String?,
      concentration2_1: json['concentration2_1'] as String?,
      averageConcentration: json['averageConcentration'] as String?,
    );

Map<String, dynamic> _$$ChemicalProtocolGankModelImplToJson(
        _$ChemicalProtocolGankModelImpl instance) =>
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
      'concentration1_1': instance.concentration1_1,
      'concentration2_1': instance.concentration2_1,
      'averageConcentration': instance.averageConcentration,
    };
