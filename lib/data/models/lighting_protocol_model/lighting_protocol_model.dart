import 'package:freezed_annotation/freezed_annotation.dart';

part 'lighting_protocol_model.freezed.dart';
part 'lighting_protocol_model.g.dart';

@freezed
class LightingProtocolModel with _$LightingProtocolModel {
  const factory LightingProtocolModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? measurementDate,
    String? workplace,
    String? workplaceId,
    String? protocolId,
    String? familyName,
    String? parameterName,
    String? parameterValue1,
    String? parameterValue2,
    String? parameterValue3,
    String? averageConcentration
  }) = _LightingProtocolModel;

  factory LightingProtocolModel.fromJson(Map<String, dynamic> json) => _$LightingProtocolModelFromJson(json);
}