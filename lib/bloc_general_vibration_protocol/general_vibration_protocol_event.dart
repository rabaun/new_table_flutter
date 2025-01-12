import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/general_vibration_protocol_model/general_vibration_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'general_vibration_protocol_event.freezed.dart';

@freezed
class GeneralVibrationProtocolEvent with _$GeneralVibrationProtocolEvent {
  const factory GeneralVibrationProtocolEvent.initial() = Initial;

  const factory GeneralVibrationProtocolEvent.addGeneralVibrationProtocol({
    required GeneralVibrationProtocolModel? generalVibrationProtocol,
  }) = AddGeneralVibrationProtocolEvent;

  const factory GeneralVibrationProtocolEvent.getGeneralVibrationProtocol() = GetGeneralVibrationProtocolEvent;

  const factory GeneralVibrationProtocolEvent.remove({
    required GeneralVibrationProtocolModel? generalVibrationProtocol,
  }) = DeleteGeneralVibrationProtocol;

  const factory GeneralVibrationProtocolEvent.getOrganization({
    required ProtocolNameModel? protocolName
  }) = GetOrganizationEvent;

  const factory GeneralVibrationProtocolEvent.update({
    required GeneralVibrationProtocolModel? generalVibrationProtocol,
  }) = UpdateGeneralVibrationProtocolEvent;
}
