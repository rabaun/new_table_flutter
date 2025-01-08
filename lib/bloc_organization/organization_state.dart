import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/organization_model/organization_model.dart';

part 'organization_state.freezed.dart';

@freezed
class OrganizationState with _$OrganizationState {
  const factory OrganizationState.initial() = _InitiaOrganizationState;
  const factory OrganizationState.loading() = LoadingOrganizationState;

  const factory OrganizationState.data({
    required List<OrganizationModel>? organizationList,
  }) = DataOrganizationState;

  const factory OrganizationState.error({required String error}) = OrganizationError;
}