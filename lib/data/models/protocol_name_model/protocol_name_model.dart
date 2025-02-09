import 'package:freezed_annotation/freezed_annotation.dart';

part 'protocol_name_model.freezed.dart';
part 'protocol_name_model.g.dart';

@freezed
class ProtocolNameModel with _$ProtocolNameModel {
  const factory ProtocolNameModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? workplace,
    String? workplaceId,
    String? protocolName,
    String? protocolId,
  }) = _ProtocolNameModel;

  factory ProtocolNameModel.fromJson(Map<String, dynamic> json) => _$ProtocolNameModelFromJson(json);
}