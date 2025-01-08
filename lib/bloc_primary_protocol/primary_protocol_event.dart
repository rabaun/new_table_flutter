import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/primary_protocol_model/primary_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'primary_protocol_event.freezed.dart';

@freezed
class PrimaryProtocolEvent with _$PrimaryProtocolEvent {
  const factory PrimaryProtocolEvent.initial() = Initial;

  const factory PrimaryProtocolEvent.addTableProtocol({
    required PrimaryProtocolModel? primaryProtocol,
  }) = AddPrimaryProtocolEvent;

  const factory PrimaryProtocolEvent.getTableProtocol() = GetPrimaryProtocolEvent;

  const factory PrimaryProtocolEvent.getProtocol({
    required ProtocolNameModel? organization,
    required ProtocolNameModel? workplaceName,
  }) = GetProtocolEvent;

  const factory PrimaryProtocolEvent.remove({
    required PrimaryProtocolModel? primaryProtocol,
  }) = DeletePrimaryProtocolEvent;

  const factory PrimaryProtocolEvent.update({
    required PrimaryProtocolModel? primaryProtocol,
  }) = UpdatePrimaryProtocolEvent;
}
