// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkplaceModelImpl _$$WorkplaceModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkplaceModelImpl(
      id: (json['id'] as num?)?.toInt(),
      organizationName: json['organizationName'] as String?,
      organizationId: json['organizationId'] as String?,
      departmentName: json['departmentName'] as String?,
      workplaceName: json['workplaceName'] as String?,
      workplaceId: json['workplaceId'] as String?,
    );

Map<String, dynamic> _$$WorkplaceModelImplToJson(
        _$WorkplaceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationName': instance.organizationName,
      'organizationId': instance.organizationId,
      'departmentName': instance.departmentName,
      'workplaceName': instance.workplaceName,
      'workplaceId': instance.workplaceId,
    };
