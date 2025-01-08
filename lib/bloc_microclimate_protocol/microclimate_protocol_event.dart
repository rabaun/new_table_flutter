import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/microclimate_protocol_model/microclimate_protocol_model.dart';
import '../data/models/organization_model/organization_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/workplace_model/workplace_model.dart';

part 'microclimate_protocol_event.freezed.dart';

@freezed
class MicroclimateEvent with _$MicroclimateEvent {
  const factory MicroclimateEvent.initial() = Initial;

  const factory MicroclimateEvent.addMicroclimate({
    required MicroclimateProtocolModel? microclimate,
  }) = AddMicroclimateEvent;

  const factory MicroclimateEvent.getMicroclimate() = GetMicroclimateEvent;

  const factory MicroclimateEvent.remove({
    required MicroclimateProtocolModel? microclimate,
  }) = DeleteMicroclimateEvent;

  const factory MicroclimateEvent.getOrganization({
    required ProtocolNameModel? protocolName
  }) = GetOrganizationEvent;

  const factory MicroclimateEvent.update({
    required MicroclimateProtocolModel? microclimate,
  }) = UpdateMicroclimateEvent;
}
