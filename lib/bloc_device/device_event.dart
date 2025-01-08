import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/device_model/device_model.dart';

part 'device_event.freezed.dart';

@freezed
class DeviceEvent with _$DeviceEvent {
  const factory DeviceEvent.initial() = Initial;

  const factory DeviceEvent.addDevice({
    required DeviceModel? device,
  }) = AddDeviceEvent;

  const factory DeviceEvent.getDevice() = GetDeviceEvent;

  const factory DeviceEvent.remove({
    required DeviceModel? device,
  }) = DeleteDeviceEvent;

  const factory DeviceEvent.update({
    required DeviceModel? device,
  }) = UpdateDeviceEvent;
}