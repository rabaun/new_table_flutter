import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/chemical_protocol_gank_model/chemical_protocol_gank_model.dart';

part 'chemical_protocol_gank_state.freezed.dart';

@freezed
class ChemicalProtocolGankState with _$ChemicalProtocolGankState {
  const factory ChemicalProtocolGankState.initial() = _InitiaChemicalProtocolGankState;
  const factory ChemicalProtocolGankState.loading() = LoadingChemicalProtocolGankState;

  const factory ChemicalProtocolGankState.data({
    required List<ChemicalProtocolGankModel>? chemicalProtocolGankList,
  }) = DataChemicalProtocolGankState;

  const factory ChemicalProtocolGankState.error({required String error}) = ChemicalProtocolGankStateError;
}