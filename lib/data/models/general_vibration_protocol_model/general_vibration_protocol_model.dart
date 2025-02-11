import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_vibration_protocol_model.freezed.dart';
part 'general_vibration_protocol_model.g.dart';

@freezed
class GeneralVibrationProtocolModel with _$GeneralVibrationProtocolModel {
  const factory GeneralVibrationProtocolModel({
    int? id,
    required String? organizationName,
    required String? organizationId,
    required String? measurementDate,
    required String? workplace,
    required String? workplaceId,
    required String? parameterName,
    required String? protocolId,
    required String? familyName,

    required String? correctedLevelX1,
    required String? correctedLevelX2,
    required String? correctedLevelX3,
    required String? averageCorrectedLevelX,

    required String? correctedLevelY1,
    required String? correctedLevelY2,
    required String? correctedLevelY3,
    required String? averageCorrectedLevelY,

    required String? correctedLevelZ1,
    required String? correctedLevelZ2,
    required String? correctedLevelZ3,
    required String? averageCorrectedLevelZ,
  }) = _GeneralVibrationProtocolModel;

  factory GeneralVibrationProtocolModel.fromJson(Map<String, dynamic> json) => _$GeneralVibrationProtocolModelFromJson(json);
}