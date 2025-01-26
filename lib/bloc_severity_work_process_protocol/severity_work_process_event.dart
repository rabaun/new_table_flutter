import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/severity_work_process_model/severity_work_process_model.dart';

part 'severity_work_process_event.freezed.dart';

@freezed
class SeverityWorkProcessEvent with _$SeverityWorkProcessEvent {
  const factory SeverityWorkProcessEvent.initial() = Initial;

  const factory SeverityWorkProcessEvent.addSeverityWorkProcess({
    required SeverityWorkProcessModel? severityWorkProcess,
  }) = AddSeverityWorkProcessEvent;

  const factory SeverityWorkProcessEvent.getSeverityWorkProcessn() =
  GetSeverityWorkProcessEvent;

  const factory SeverityWorkProcessEvent.remove({
    required SeverityWorkProcessModel? severityWorkProcess,
  }) = DeleteSeverityWorkProcessEvent;

  const factory SeverityWorkProcessEvent.getProtocol(
      {required ProtocolNameModel? protocolName}) = GetOrganizationEvent;

  const factory SeverityWorkProcessEvent.update({
    required SeverityWorkProcessModel? severityWorkProcess,
  }) = UpdateSeverityWorkProcessEvent;
}
