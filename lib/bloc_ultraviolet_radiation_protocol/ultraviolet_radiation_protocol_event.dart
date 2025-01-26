import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';

part 'ultraviolet_radiation_protocol_event.freezed.dart';

@freezed
class UltravioletRadiationProtocolEvent with _$UltravioletRadiationProtocolEvent {
  const factory UltravioletRadiationProtocolEvent.initial() = Initial;

  const factory UltravioletRadiationProtocolEvent.addUltravioletRadiation({
    required UltravioletRadiationProtocolModel? ultravioletRadiation,
  }) = AddUltravioletRadiationProtocolEvent;

  const factory UltravioletRadiationProtocolEvent.getUltravioletRadiation() =
      GetUltravioletRadiationProtocolEvent;

  const factory UltravioletRadiationProtocolEvent.remove({
    required UltravioletRadiationProtocolModel? ultravioletRadiation,
  }) = DeleteUltravioletRadiationProtocolEvent;

  const factory UltravioletRadiationProtocolEvent.getOrganization(
      {required ProtocolNameModel? protocolName}) = GetOrganizationEvent;

  const factory UltravioletRadiationProtocolEvent.update({
    required UltravioletRadiationProtocolModel? ultravioletRadiation,
  }) = UpdateUltravioletRadiationProtocolEvent;
}
