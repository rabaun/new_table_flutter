import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/lighting_protocol_model/lighting_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'lighting_protocol_event.freezed.dart';

@freezed
class LightingProtocolEvent with _$LightingProtocolEvent {
  const factory LightingProtocolEvent.initial() = Initial;

  const factory LightingProtocolEvent.addTableProtocol({
    required LightingProtocolModel? lightingProtocol,
  }) = AddLightingProtocolEvent;

  const factory LightingProtocolEvent.getTableProtocol() = GetLightingProtocolEvent;

  const factory LightingProtocolEvent.getProtocol({
    required ProtocolNameModel? protocolName,
    required ProtocolNameModel? workplaceName,
  }) = GetProtocolEvent;

  const factory LightingProtocolEvent.remove({
    required LightingProtocolModel? lightingProtocol,
  }) = DeleteLightingProtocolEvent;

  const factory LightingProtocolEvent.update({
    required LightingProtocolModel? lightingProtocol,
  }) = UpdateLightingProtocolEvent;
}
