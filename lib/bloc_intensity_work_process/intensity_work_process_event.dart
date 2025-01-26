import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/intensity_work_process_model/intensity_work_process_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'intensity_work_process_event.freezed.dart';

@freezed
class IntensityWorkProcessEvent with _$IntensityWorkProcessEvent {
  const factory IntensityWorkProcessEvent.initial() = Initial;

  const factory IntensityWorkProcessEvent.add({
    required IntensityWorkProcessModel? intensityWorkProcess,
  }) = AddIntensityWorkProcessEvent;

  const factory IntensityWorkProcessEvent.get() = GetIntensityWorkProcessEvent;

  const factory IntensityWorkProcessEvent.remove({
    required IntensityWorkProcessModel? intensityWorkProcess,
  }) = DeleteIntensityWorkProcessEvent;

  const factory IntensityWorkProcessEvent.getOrganization(
      {required ProtocolNameModel? protocolName}) = GetOrganizationEvent;

  const factory IntensityWorkProcessEvent.update({
    required IntensityWorkProcessModel? intensityWorkProcess,
  }) = UpdateIntensityWorkProcessEvent;
}
