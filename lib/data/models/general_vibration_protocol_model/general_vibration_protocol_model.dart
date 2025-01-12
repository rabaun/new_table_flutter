import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_vibration_protocol_model.freezed.dart';
part 'general_vibration_protocol_model.g.dart';

@freezed
class GeneralVibrationProtocolModel with _$GeneralVibrationProtocolModel {
  const factory GeneralVibrationProtocolModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? measurementDate,
    String? workplace,
    String? workplaceId,
    String? parameterName,
    String? correctedLevelX,
    String? correctedLevelY,
    String? correctedLevelZ,
  }) = _GeneralVibrationProtocolModel;

  factory GeneralVibrationProtocolModel.fromJson(Map<String, dynamic> json) => _$GeneralVibrationProtocolModelFromJson(json);
}