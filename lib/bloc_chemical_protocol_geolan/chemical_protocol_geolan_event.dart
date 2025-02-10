import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/chemical_protocol_geolan_model/chemical_protocol_geolan_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'chemical_protocol_geolan_event.freezed.dart';

@freezed
class ChemicalProtocolGeolanEvent with _$ChemicalProtocolGeolanEvent {
  const factory ChemicalProtocolGeolanEvent.initial() = InitialChemicalProtocolEvent;

  const factory ChemicalProtocolGeolanEvent.addTableProtocol({
    required ChemicalProtocolGeolanModel? chemicalProtocolGeolan,
  }) = AddChemicalProtocolGeolanEvent;

  const factory ChemicalProtocolGeolanEvent.getTableProtocol() = GetChemicalProtocolGeolanEvent;

  const factory ChemicalProtocolGeolanEvent.getProtocol({
    required ProtocolNameModel? protocolName,
    required ProtocolNameModel? workplaceName,
  }) = GetChemicalProtocolEvent;

  const factory ChemicalProtocolGeolanEvent.remove({
    required ChemicalProtocolGeolanModel? chemicalProtocolGeolan,
  }) = DeleteChemicalProtocolGeolanEvent;

  const factory ChemicalProtocolGeolanEvent.update({
    required ChemicalProtocolGeolanModel? chemicalProtocolGeolan,
  }) = UpdateChemicalProtocolGeolanEvent;
}