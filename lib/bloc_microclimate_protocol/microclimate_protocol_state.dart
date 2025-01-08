import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/microclimate_protocol_model/microclimate_protocol_model.dart';

part 'microclimate_protocol_state.freezed.dart';

@freezed
class MicroclimateState with _$MicroclimateState {
  const factory MicroclimateState.initial() = _InitiaMicroclimateState;
  const factory MicroclimateState.loading() = LoadingMicroclimateState;

  const factory MicroclimateState.data({
    required List<MicroclimateProtocolModel>? microclimateList,
  }) = DataMicroclimateState;

  const factory MicroclimateState.error({required String error}) = MicroclimateError;
}