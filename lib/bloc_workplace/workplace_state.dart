import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/workplace_model/workplace_model.dart';

part 'workplace_state.freezed.dart';

@freezed
class WorkplaceState with _$WorkplaceState {
  const factory WorkplaceState.initial() = _InitiaWorkplaceState;
  const factory WorkplaceState.loading() = LoadingWorkplaceState;

  const factory WorkplaceState.data({
    required List<WorkplaceModel>? workplaceList,
  }) = DataWorkplaceState;

  const factory WorkplaceState.error({required String error}) = WorkplaceError;
}