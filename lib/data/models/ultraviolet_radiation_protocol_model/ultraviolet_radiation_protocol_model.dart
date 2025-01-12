import 'package:freezed_annotation/freezed_annotation.dart';

part 'ultraviolet_radiation_protocol_model.freezed.dart';
part 'ultraviolet_radiation_protocol_model.g.dart';

@freezed
class UltravioletRadiationProtocolModel with _$UltravioletRadiationProtocolModel {
  const factory UltravioletRadiationProtocolModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? measurementDate,
    String? workplace,
    String? workplaceId,
    String? parameterName,
    String? uvAIntensityH05_10,
    String? uvAIntensityH15,
    String? uvBIntensityH05_10,
    String? uvBIntensityH15,
  }) = _UltravioletRadiationProtocolModel;

  factory UltravioletRadiationProtocolModel.fromJson(Map<String, dynamic> json) => _$UltravioletRadiationProtocolModelFromJson(json);
}