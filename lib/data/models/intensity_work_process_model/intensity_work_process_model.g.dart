// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intensity_work_process_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IntensityWorkProcessModelImpl _$$IntensityWorkProcessModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IntensityWorkProcessModelImpl(
      id: (json['id'] as num?)?.toInt(),
      organizationName: json['organizationName'] as String?,
      organizationId: json['organizationId'] as String?,
      measurementDate: json['measurementDate'] as String?,
      workplace: json['workplace'] as String?,
      workplaceId: json['workplaceId'] as String?,
      parameterName: json['parameterName'] as String?,
      protocolId: json['protocolId'] as String?,
      familyName: json['familyName'] as String?,
      signalDensity: json['signalDensity'] as String?,
      simultaneousObjectsCount: json['simultaneousObjectsCount'] as String?,
      opticalDeviceUsage: json['opticalDeviceUsage'] as String?,
      voiceApparatusLoadHours: json['voiceApparatusLoadHours'] as String?,
      auditoryAnalyzerLoad: json['auditoryAnalyzerLoad'] as String?,
      focusedObservationDuration: json['focusedObservationDuration'] as String?,
      monotonyLoads: json['monotonyLoads'] as String?,
      elementsCount: json['elementsCount'] as String?,
      monotonyEnvironment: json['monotonyEnvironment'] as String?,
      activeObservationTime: json['activeObservationTime'] as String?,
    );

Map<String, dynamic> _$$IntensityWorkProcessModelImplToJson(
        _$IntensityWorkProcessModelImpl instance) =>
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
      'signalDensity': instance.signalDensity,
      'simultaneousObjectsCount': instance.simultaneousObjectsCount,
      'opticalDeviceUsage': instance.opticalDeviceUsage,
      'voiceApparatusLoadHours': instance.voiceApparatusLoadHours,
      'auditoryAnalyzerLoad': instance.auditoryAnalyzerLoad,
      'focusedObservationDuration': instance.focusedObservationDuration,
      'monotonyLoads': instance.monotonyLoads,
      'elementsCount': instance.elementsCount,
      'monotonyEnvironment': instance.monotonyEnvironment,
      'activeObservationTime': instance.activeObservationTime,
    };
