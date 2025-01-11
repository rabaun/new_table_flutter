import 'package:freezed_annotation/freezed_annotation.dart';

part 'microclimate_protocol_model.freezed.dart';
part 'microclimate_protocol_model.g.dart';

@freezed
class MicroclimateProtocolModel with _$MicroclimateProtocolModel {
  const factory MicroclimateProtocolModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? measurementDate,
    String? workplace,
    String? workplaceId,
    String? parameterName,
    String? airTemperature01m,
    String? airTemperature15m,
    String? tncIndex01m,
    String? tncIndex15m,
    String? airVelocity01m,
    String? airVelocity15m,
    String? relativeHumidity,
  }) = _MicroclimateProtocolModel;

  factory MicroclimateProtocolModel.fromJson(Map<String, dynamic> json) => _$MicroclimateProtocolModelFromJson(json);
}