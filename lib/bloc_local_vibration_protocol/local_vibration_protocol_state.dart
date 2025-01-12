import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/local_vibration_protocol_model/local_vibration_protocol_model.dart';

part 'local_vibration_protocol_state.freezed.dart';

@freezed
class LocalVibrationProtocolState with _$LocalVibrationProtocolState {
  const factory LocalVibrationProtocolState.initial() = _InitiaLocalVibrationProtocolState;

  const factory LocalVibrationProtocolState.loading() = LoadingLocalVibrationProtocolState;

  const factory LocalVibrationProtocolState.data({
    required List<LocalVibrationProtocolModel>? localVibrationProtocol,
  }) = DataLocalVibrationProtocolState;

  const factory LocalVibrationProtocolState.error({required String error}) =
      LocalVibrationProtocolError;
}
