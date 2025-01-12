import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/general_vibration_protocol_model/general_vibration_protocol_model.dart';

part 'general_vibration_protocol_state.freezed.dart';

@freezed
class GeneralVibrationProtocolState with _$GeneralVibrationProtocolState {
  const factory GeneralVibrationProtocolState.initial() = _InitiaGeneralVibrationProtocolState;
  const factory GeneralVibrationProtocolState.loading() = LoadingGeneralVibrationProtocolState;

  const factory GeneralVibrationProtocolState.data({
    required List<GeneralVibrationProtocolModel>? generalVibrationProtocol,
  }) = DataGeneralVibrationProtocolState;

  const factory GeneralVibrationProtocolState.error({required String error}) = GeneralVibrationProtocolError;
}