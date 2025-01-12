import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/general_vibration_protocol_model/general_vibration_protocol_model.dart';
import '../data/models/local_vibration_protocol_model/local_vibration_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'local_vibration_protocol_event.freezed.dart';

@freezed
class LocalVibrationProtocolEvent with _$LocalVibrationProtocolEvent {
  const factory LocalVibrationProtocolEvent.initial() = Initial;

  const factory LocalVibrationProtocolEvent.addLocalVibrationProtocol({
    required LocalVibrationProtocolModel? localVibrationProtocol,
  }) = AddLocalVibrationProtocolEvent;

  const factory LocalVibrationProtocolEvent.getLocalVibrationProtocol() = GetLocalVibrationProtocolEvent;

  const factory LocalVibrationProtocolEvent.remove({
    required LocalVibrationProtocolModel? localVibrationProtocol,
  }) = DeleteLocalVibrationProtocolEvent;

  const factory LocalVibrationProtocolEvent.getOrganization({
    required ProtocolNameModel? protocolName
  }) = GetOrganizationEvent;

  const factory LocalVibrationProtocolEvent.update({
    required LocalVibrationProtocolModel? localVibrationProtocol,
  }) = UpdateLocalVibrationProtocolEvent;
}
