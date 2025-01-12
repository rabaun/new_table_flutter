import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';

part 'ultraviolet_radiation_protocol_state.freezed.dart';

@freezed
class UltravioletRadiationProtocolState with _$UltravioletRadiationProtocolState {
  const factory UltravioletRadiationProtocolState.initial() = _InitiaUltravioletRadiationProtocolState;
  const factory UltravioletRadiationProtocolState.loading() = LoadingUltravioletRadiationProtocolState;

  const factory UltravioletRadiationProtocolState.data({
    required List<UltravioletRadiationProtocolModel>? ultravioletRadiationList,
  }) = DataUltravioletRadiationProtocolState;

  const factory UltravioletRadiationProtocolState.error({required String error}) = UltravioletRadiationProtocolError;
}