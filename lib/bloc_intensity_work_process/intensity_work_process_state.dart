import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/intensity_work_process_model/intensity_work_process_model.dart';
part 'intensity_work_process_state.freezed.dart';

@freezed
class IntensityWorkProcessState with _$IntensityWorkProcessState {
  const factory IntensityWorkProcessState.initial() = _InitiaIntensityWorkProcessState;

  const factory IntensityWorkProcessState.loading() = LoadingIntensityWorkProcessState;

  const factory IntensityWorkProcessState.data({
    required List<IntensityWorkProcessModel>? intensityWorkProcess,
  }) = DataIntensityWorkProcessState;

  const factory IntensityWorkProcessState.error({required String error}) =
  IntensityWorkProcessStateError;
}
