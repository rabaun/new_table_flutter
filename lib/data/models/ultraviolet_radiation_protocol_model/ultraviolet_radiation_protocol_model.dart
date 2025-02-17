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
    String? protocolId,
    String? familyName,

    String? uvAIntensityH05_101,
    String? uvAIntensityH05_102,
    String? uvAIntensityH05_103,
    String? averageUvAIntensityH05_10,

    String? uvAIntensityH151,
    String? uvAIntensityH152,
    String? uvAIntensityH153,
    String? averageUvAIntensityH15,

    String? uvBIntensityH05_101,
    String? uvBIntensityH05_102,
    String? uvBIntensityH05_103,
    String? averageUvBIntensityH05_10,

    String? uvBIntensityH151,
    String? uvBIntensityH152,
    String? uvBIntensityH153,
    String? averageUvBIntensityH15

  }) = _UltravioletRadiationProtocolModel;

  factory UltravioletRadiationProtocolModel.fromJson(Map<String, dynamic> json) => _$UltravioletRadiationProtocolModelFromJson(json);
}