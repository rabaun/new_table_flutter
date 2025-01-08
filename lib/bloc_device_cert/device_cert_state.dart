import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/device_cert_model/table_model.dart';

part 'device_cert_state.freezed.dart';

@freezed
class DeviceCertState with _$DeviceCertState {
  const factory DeviceCertState.initial() = _DeviceCertInitialState;
  const factory DeviceCertState.loading() = LoadingDeviceCertState;

  const factory DeviceCertState.data({
    required List<DeviceCertModel>? deviceCertModel,
  }) = DataDeviceCertState;

  const factory DeviceCertState.error({required String error}) = DeviceCertError;
}
