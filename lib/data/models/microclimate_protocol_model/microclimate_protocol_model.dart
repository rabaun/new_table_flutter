import 'package:freezed_annotation/freezed_annotation.dart';

part 'microclimate_protocol_model.freezed.dart';
part 'microclimate_protocol_model.g.dart';

@freezed
class MicroclimateProtocolModel with _$MicroclimateProtocolModel {
  const factory MicroclimateProtocolModel({
    int? id,
    required String? organizationName,
    required String? organizationId,
    required String? measurementDate,
    required String? workplace,
    required String? workplaceId,
    required String? parameterName,
    required String? protocolId,
    required String? familyName,

    // Поля для температуры на высоте 1 м
    required String? airTemperature01m1,
    required String? airTemperature01m2,
    required String? airTemperature01m3,
    required String? averageAirTemperature01m,

    // Поля для температуры на высоте 15 м
    required String? airTemperature15m1,
    required String? airTemperature15m2,
    required String? airTemperature15m3,
    required String? averageAirTemperature15m,

    // Поля для индекса TNC на высоте 1 м
    required String? tncIndex01m1,
    required String? tncIndex01m2,
    required String? tncIndex01m3,
    required String? averageTncIndex01m,

    // Поля для индекса TNC на высоте 15 м
    required String? tncIndex15m1,
    required String? tncIndex15m2,
    required String? tncIndex15m3,
    required String? averageTncIndex15m,

    // Поля для скорости воздуха на высоте 1 м
    required String? airVelocity01m1,
    required String? airVelocity01m2,
    required String? airVelocity01m3,
    required String? averageAirVelocity01m,

    // Поля для скорости воздуха на высоте 15 м
    required String? airVelocity15m1,
    required String? airVelocity15m2,
    required String? airVelocity15m3,
    required String? averageAirVelocity15m,

    // Поля для относительной влажности
    required String? relativeHumidity1,
    required String? relativeHumidity2,
    required String? relativeHumidity3,
    required String? averageRelativeHumidity,
    required String? thermalRadiationIntensity05m1,
    required String? thermalRadiationIntensity05m2,
    required String? thermalRadiationIntensity05m3,
    required String? averageThermalRadiationIntensity05m,
    required String? thermalRadiationIntensity1m1,
    required String? thermalRadiationIntensity1m2,
    required String? thermalRadiationIntensity1m3,
    required String? averageThermalRadiationIntensity1m,
    required String? thermalRadiationIntensity15m1,
    required String? thermalRadiationIntensity15m2,
    required String? thermalRadiationIntensity15m3,
    required String? averageThermalRadiationIntensity15m,
    required String? thermalRadiationExposureDose1,
    required String? thermalRadiationExposureDose2,
    required String? thermalRadiationExposureDose3,
    required String? averageThermalRadiationExposureDose,
  }) = _MicroclimateProtocolModel;

  factory MicroclimateProtocolModel.fromJson(Map<String, dynamic> json) =>
      _$MicroclimateProtocolModelFromJson(json);
}
