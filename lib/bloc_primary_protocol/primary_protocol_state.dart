import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/primary_protocol_model/primary_protocol_model.dart';

part 'primary_protocol_state.freezed.dart';

@freezed
class PrimaryProtocolState with _$PrimaryProtocolState {
  const factory PrimaryProtocolState.initial() = _InitiaPrimaryProtocolState;
  const factory PrimaryProtocolState.loading() = LoadingPrimaryProtocolState;

  const factory PrimaryProtocolState.data({
    required List<PrimaryProtocolModel>? primaryProtocolList,
  }) = DataPrimaryProtocolState;

  const factory PrimaryProtocolState.error({required String error}) = PrimaryProtocolError;
}