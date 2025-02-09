import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/chemical_protocol_gank_model/chemical_protocol_gank_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'chemical_protocol_gank_event.freezed.dart';

@freezed
class ChemicalProtocolGankEvent with _$ChemicalProtocolGankEvent {
  const factory ChemicalProtocolGankEvent.initial() = Initial;

  const factory ChemicalProtocolGankEvent.addChemicalProtocolGank({
    required ChemicalProtocolGankModel? chemicalProtocolGank,
  }) = AddChemicalProtocolGankEvent;

  const factory ChemicalProtocolGankEvent.getChemicalProtocolGank() = GetChemicalProtocolGankEvent;

  const factory ChemicalProtocolGankEvent.remove({
    required ChemicalProtocolGankModel? chemicalProtocolGank,
  }) = DeleteChemicalProtocolGankEvent;

  const factory ChemicalProtocolGankEvent.getProtocol({
    required ProtocolNameModel? protocolName
  }) = GetOrganizationEvent;

  const factory ChemicalProtocolGankEvent.update({
    required ChemicalProtocolGankModel? chemicalProtocolGank,
  }) = UpdateChemicalProtocolGankEvent;
}
