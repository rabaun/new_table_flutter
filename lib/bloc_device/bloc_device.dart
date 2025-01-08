import 'package:bloc/bloc.dart';

import '../../main.dart';
import '../data/db/dao/device_dao.dart';
import '../data/models/device_model/device_model.dart';
import 'device_event.dart';
import 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  late DeviceDao deviceDao;
  List<DeviceModel>? deviceModelList = [];

  DeviceBloc(this.deviceDao) : super(const DeviceState.initial()) {
    on<Initial>(initial);
    on<GetDeviceEvent>(getDevice);
    on<AddDeviceEvent>(addDevice);
    on<UpdateDeviceEvent>(updateDatabase);
    on<DeleteDeviceEvent>(removeDatabase);
  }

  void initial(
    Initial event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const LoadingDeviceState());
    try {
      if (deviceModelList!.isEmpty) {
        deviceDao = getIt.get<DeviceDao>();
        deviceModelList = await deviceDao.getDevice();
      } else {
        deviceModelList = deviceDao.deviceList;
      }
    } catch (e) {
      emit(const DeviceError(error: "Form is empty!"));
    }
    emit(
      DataDeviceState(
        deviceModelList: deviceModelList,
      ),
    );
  }

  void getDevice(
    GetDeviceEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const LoadingDeviceState());
    try {
      deviceModelList = await deviceDao.getDevice();
    } catch (e) {
      emit(const DeviceError(error: "Form is empty!"));
    }
    emit(
      DataDeviceState(
        deviceModelList: deviceModelList,
      ),
    );
  }

  void addDevice(
    AddDeviceEvent event,
    Emitter<DeviceState> emit,
  ) async {
    try {
      emit(const LoadingDeviceState());
      deviceModelList = await deviceDao.addDevice(event.device);
    } catch (e) {
      emit(const DeviceError(error: "Form is empty!"));
    }
    emit(
      DataDeviceState(
        deviceModelList: deviceModelList,
      ),
    );
  }

  void updateDatabase(
    UpdateDeviceEvent event,
    Emitter<DeviceState> emit,
  ) async {
    try {
      emit(const LoadingDeviceState());
      deviceModelList = await deviceDao.updateDevice(event.device);
    } catch (e) {
      emit(const DeviceError(error: "Form is empty!"));
    }
    emit(
      DataDeviceState(
        deviceModelList: deviceModelList,
      ),
    );
  }

  void removeDatabase(
    DeleteDeviceEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const LoadingDeviceState());
    try {
      deviceModelList = await deviceDao.removeDevice(event.device);
    } catch (e) {
      emit(const DeviceError(error: "Form is empty!"));
    }
    emit(
      DataDeviceState(
        deviceModelList: deviceModelList,
      ),
    );
  }
}
