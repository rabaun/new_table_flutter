// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProtocolNameModelImpl _$$ProtocolNameModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProtocolNameModelImpl(
      id: json['id'] as int?,
      organizationName: json['organizationName'] as String?,
      workplace: json['workplace'] as String?,
      workplaceId: json['workplaceId'] as String?,
      protocolName: json['protocolName'] as String?,
    );

Map<String, dynamic> _$$ProtocolNameModelImplToJson(
        _$ProtocolNameModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationName': instance.organizationName,
      'workplace': instance.workplace,
      'workplaceId': instance.workplaceId,
      'protocolName': instance.protocolName,
    };
