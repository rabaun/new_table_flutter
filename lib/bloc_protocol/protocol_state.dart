import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';

part 'protocol_state.freezed.dart';

@freezed
class ProtocolNameState with _$ProtocolNameState {
  const factory ProtocolNameState.initial() = _InitiaProtocolNameState;
  const factory ProtocolNameState.loading() = LoadingProtocolNameState;

  const factory ProtocolNameState.data({
    required List<ProtocolNameModel>? protocolNameList,
  }) = DataProtocolNameState;

  const factory ProtocolNameState.error({required String error}) = ProtocolNameError;
}