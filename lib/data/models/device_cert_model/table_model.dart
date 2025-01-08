import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_model.freezed.dart';

part 'table_model.g.dart';

@freezed
class DeviceCertModel with _$DeviceCertModel {
  const factory DeviceCertModel({
     int? id,
     String? serialNumber,
     String? cerVerification,
     String? startTime,
     String? endTime,
  }) = _TableModel;

  factory DeviceCertModel.fromJson(Map<String, dynamic> json) => _$DeviceCertModelFromJson(json);
}