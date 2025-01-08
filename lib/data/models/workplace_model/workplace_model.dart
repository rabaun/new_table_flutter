import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace_model.freezed.dart';
part 'workplace_model.g.dart';

@freezed
class WorkplaceModel with _$WorkplaceModel {
  const factory WorkplaceModel({
    int? id,
    String? organizationName,
    String? departmentName,
    String? workplaceName,
    String? workplaceId,
  }) = _WorkplaceModel;

  factory WorkplaceModel.fromJson(Map<String, dynamic> json) => _$WorkplaceModelFromJson(json);
}