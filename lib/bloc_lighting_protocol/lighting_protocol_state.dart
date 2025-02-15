import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/lighting_protocol_model/lighting_protocol_model.dart';

part 'lighting_protocol_state.freezed.dart';

@freezed
class LightingProtocolState with _$LightingProtocolState {
  const factory LightingProtocolState.initial() = _InitiaLightingProtocolState;

  const factory LightingProtocolState.loading() = LoadingLightingProtocolState;

  const factory LightingProtocolState.data({
    required List<LightingProtocolModel>? lightingProtocolList,
  }) = DataLightingProtocolState;

  const factory LightingProtocolState.error({required String error}) = LightingProtocolError;
}
