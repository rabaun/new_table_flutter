import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_vibration_protocol_model.freezed.dart';
part 'local_vibration_protocol_model.g.dart';

@freezed
class LocalVibrationProtocolModel with _$LocalVibrationProtocolModel {
  const factory LocalVibrationProtocolModel({
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
  }) = _LocalVibrationProtocolModel;

  factory LocalVibrationProtocolModel.fromJson(Map<String, dynamic> json) => _$LocalVibrationProtocolModelFromJson(json);
}