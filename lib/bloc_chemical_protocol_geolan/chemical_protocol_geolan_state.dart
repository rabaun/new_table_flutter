import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/chemical_protocol_geolan_model/chemical_protocol_geolan_model.dart';

part 'chemical_protocol_geolan_state.freezed.dart';

@freezed
class ChemicalProtocolGeolanState with _$ChemicalProtocolGeolanState {
  const factory ChemicalProtocolGeolanState.initial() = _InitiaChemicalProtocolGeolan;
  const factory ChemicalProtocolGeolanState.loading() = LoadingChemicalProtocolGeolan;

  const factory ChemicalProtocolGeolanState.data({
    required List<ChemicalProtocolGeolanModel>? chemicalProtocolGeolan,
  }) = DataChemicalProtocolGeolanState;

  const factory ChemicalProtocolGeolanState.error({required String error}) = ChemicalProtocolGeolanError;
}