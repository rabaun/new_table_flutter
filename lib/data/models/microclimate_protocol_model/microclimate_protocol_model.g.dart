// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'microclimate_protocol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MicroclimateProtocolModelImpl _$$MicroclimateProtocolModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MicroclimateProtocolModelImpl(
      id: json['id'] as int?,
      organizationName: json['organizationName'] as String?,
      measurementDate: json['measurementDate'] as String?,
      workplace: json['workplace'] as String?,
      workplaceId: json['workplaceId'] as String?,
      parameterName: json['parameterName'] as String?,
      airTemperature01m: json['airTemperature01m'] as String?,
      airTemperature15m: json['airTemperature15m'] as String?,
      tncIndex01m: json['tncIndex01m'] as String?,
      tncIndex15m: json['tncIndex15m'] as String?,
      airVelocity01m: json['airVelocity01m'] as String?,
      airVelocity15m: json['airVelocity15m'] as String?,
      relativeHumidity: json['relativeHumidity'] as String?,
    );

Map<String, dynamic> _$$MicroclimateProtocolModelImplToJson(
        _$MicroclimateProtocolModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationName': instance.organizationName,
      'measurementDate': instance.measurementDate,
      'workplace': instance.workplace,
      'workplaceId': instance.workplaceId,
      'parameterName': instance.parameterName,
      'airTemperature01m': instance.airTemperature01m,
      'airTemperature15m': instance.airTemperature15m,
      'tncIndex01m': instance.tncIndex01m,
      'tncIndex15m': instance.tncIndex15m,
      'airVelocity01m': instance.airVelocity01m,
      'airVelocity15m': instance.airVelocity15m,
      'relativeHumidity': instance.relativeHumidity,
    };
