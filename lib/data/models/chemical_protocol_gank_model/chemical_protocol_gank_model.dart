import 'package:freezed_annotation/freezed_annotation.dart';

part 'chemical_protocol_gank_model.freezed.dart';
part 'chemical_protocol_gank_model.g.dart';

@freezed
class ChemicalProtocolGankModel with _$ChemicalProtocolGankModel {
  const factory ChemicalProtocolGankModel({
    int? id,
    required String? organizationName,
    required String? organizationId,
    required String? measurementDate,
    required String? workplace,
    required String? workplaceId,
    required String? protocolId,
    required String? familyName,
    required String? parameterName,
    required String? concentration1_1,
    required String? concentration2_1,
    required String? averageConcentration,
  }) = _ChemicalProtocolGankModel;

  factory ChemicalProtocolGankModel.fromJson(Map<String, dynamic> json) => _$ChemicalProtocolGankModelFromJson(json);
}
