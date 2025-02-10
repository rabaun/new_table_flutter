import 'package:freezed_annotation/freezed_annotation.dart';

part 'chemical_protocol_geolan_model.freezed.dart';
part 'chemical_protocol_geolan_model.g.dart';

@freezed
class ChemicalProtocolGeolanModel with _$ChemicalProtocolGeolanModel {
  const factory ChemicalProtocolGeolanModel({
    int? id,
    required String? organizationName,
    required String? organizationId,
    required String? measurementDate,
    required String? workplace,
    required String? workplaceId,
    required String? protocolId,
    required String? familyName,
    required String? parameterName,
    required String? parameterValue,
  }) = _ChemicalProtocolGeolanModel;

  factory ChemicalProtocolGeolanModel.fromJson(Map<String, dynamic> json) => _$ChemicalProtocolGeolanModelFromJson(json);
}
