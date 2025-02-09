import 'package:freezed_annotation/freezed_annotation.dart';

part 'primary_protocol_model.freezed.dart';
part 'primary_protocol_model.g.dart';

@freezed
class PrimaryProtocolModel with _$PrimaryProtocolModel {
  const factory PrimaryProtocolModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? measurementDate,
    String? workplace,
    String? workplaceId,
    String? protocolId,
    String? familyName,
    String? parameterName,
    String? parameterValue,
  }) = _PrimaryProtocolModel;

  factory PrimaryProtocolModel.fromJson(Map<String, dynamic> json) => _$PrimaryProtocolModelFromJson(json);
}
