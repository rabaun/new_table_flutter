import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/severity_work_process_model/severity_work_process_model.dart';

part 'severity_work_process_state.freezed.dart';

@freezed
class SeverityWorkProcessState with _$SeverityWorkProcessState {
  const factory SeverityWorkProcessState.initial() = _InitiaSeverityWorkProcessState;
  const factory SeverityWorkProcessState.loading() = LoadingSeverityWorkProcessState;

  const factory SeverityWorkProcessState.data({
    required List<SeverityWorkProcessModel>? severityWorkProcessList,
  }) = DataSeverityWorkProcessState;

  const factory SeverityWorkProcessState.error({required String error}) = SeverityWorkProcessStateError;
}