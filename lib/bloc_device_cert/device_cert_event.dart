import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/device_cert_model/table_model.dart';
import '../data/models/device_model/device_model.dart';

part 'device_cert_event.freezed.dart';

@freezed
class DeviceCertEvent with _$DeviceCertEvent {
  const factory DeviceCertEvent.initial() = InitialDeviceCert;

  const factory DeviceCertEvent.addDevice({
    required DeviceCertModel? deviceCertModel,
  }) = AddDeviceCertEvent;

  const factory DeviceCertEvent.getDevice() = GetDeviceCertEvent;

  const factory DeviceCertEvent.remove({
    required DeviceCertModel? deviceCertModel,
  }) = DeleteDeviceCertEvent;

  const factory DeviceCertEvent.update({
    required DeviceCertModel? deviceCertModel,
  }) = UpdateDeviceCertEvent;

  const factory DeviceCertEvent.getSerialNumberData({
    required DeviceModel? deviceModel,
  }) = GetSerialNumberDataEvent;
}