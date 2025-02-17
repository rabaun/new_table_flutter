import 'package:freezed_annotation/freezed_annotation.dart';

part 'intensity_work_process_model.freezed.dart';
part 'intensity_work_process_model.g.dart';

@freezed
class IntensityWorkProcessModel with _$IntensityWorkProcessModel {
  const factory IntensityWorkProcessModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? measurementDate,
    String? workplace,
    String? workplaceId,
    String? parameterName,
    String? protocolId,
    String? familyName,

    String? signalDensity,
    String? simultaneousObjectsCount,
    String? opticalDeviceUsage,
    String? voiceApparatusLoadHours,
    String? auditoryAnalyzerLoad,
    String? focusedObservationDuration,
    String? monotonyLoads,
    String? elementsCount,
    String? monotonyEnvironment,
    String? activeObservationTime,
  }) = _IntensityWorkProcessModel;

  factory IntensityWorkProcessModel.fromJson(Map<String, dynamic> json) =>
      _$IntensityWorkProcessModelFromJson(json);
}
