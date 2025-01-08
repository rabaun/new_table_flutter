import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/workplace_model/workplace_model.dart';

part 'workplace_event.freezed.dart';

@freezed
class WorkplaceEvent with _$WorkplaceEvent {
  const factory WorkplaceEvent.initial() = Initial;

  const factory WorkplaceEvent.addWorkplace({
    required WorkplaceModel? workplace,
  }) = AddWorkplaceEvent;

  const factory WorkplaceEvent.getWorkplace() = GetWorkplaceEvent;

  const factory WorkplaceEvent.remove({
    required WorkplaceModel? workplace,
  }) = DeleteWorkplace;

  const factory WorkplaceEvent.getOrganization({
    required OrganizationModel? organization,
  }) = GetOrganizationEvent;

  const factory WorkplaceEvent.update({
    required WorkplaceModel? workplaceName,
  }) = UpdateWorkplace;
}
