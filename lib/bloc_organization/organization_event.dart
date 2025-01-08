import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/organization_model/organization_model.dart';

part 'organization_event.freezed.dart';

@freezed
class OrganizationEvent with _$OrganizationEvent {
  const factory OrganizationEvent.initial() = Initial;

  const factory OrganizationEvent.addOrganization({
    required OrganizationModel? organization,
  }) = AddOrganizationEvent;

  const factory OrganizationEvent.getOrganization() = GetOrganizationEvent;

  const factory OrganizationEvent.remove({
    required OrganizationModel? organization,
  }) = DeleteOrganizationEvent;

  const factory OrganizationEvent.update({
    required OrganizationModel? organization,
  }) = UpdateOrganizationEvent;
}