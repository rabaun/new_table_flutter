import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/workplace_model/workplace_model.dart';


part 'protocol_event.freezed.dart';

@freezed
class ProtocolNameEvent with _$ProtocolNameEvent {
  const factory ProtocolNameEvent.initial() = Initial;

  const factory ProtocolNameEvent.addProtocolName({
    required ProtocolNameModel? protocolName,
  }) = AddProtocolNameEvent;

  const factory ProtocolNameEvent.getProtocolName() = GetProtocolNameEvent;

  const factory ProtocolNameEvent.remove({
    required ProtocolNameModel? protocolName,
  }) = DeleteProtocolName;

  const factory ProtocolNameEvent.getProtocol({
    required OrganizationModel? organization,
    required WorkplaceModel? workplaceName
  }) = GetProtocolEvent;

  const factory ProtocolNameEvent.update({
    required ProtocolNameModel? protocolName,
  }) = UpdateProtocolName;
}