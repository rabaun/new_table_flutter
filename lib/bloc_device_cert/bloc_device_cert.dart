import 'package:bloc/bloc.dart';

import '../../main.dart';
import '../data/db/dao/device_cert_dao.dart';
import '../data/models/device_cert_model/table_model.dart';
import 'device_cert_event.dart';
import 'device_cert_state.dart';

class DeviceCertBloc extends Bloc<DeviceCertEvent, DeviceCertState> {
  late DeviceCertDao deviceCertDao;
  List<DeviceCertModel>? deviceCertModelList = [];

  DeviceCertBloc(this.deviceCertDao) : super(const DeviceCertState.initial()) {
    on<InitialDeviceCert>(initial);
    on<GetDeviceCertEvent>(getFromTable);
    on<AddDeviceCertEvent>(addInTable);
    on<GetSerialNumberDataEvent>(getSerialNumberData);
    on<UpdateDeviceCertEvent>(updateTable);
    on<DeleteDeviceCertEvent>(removeTable);
  }

  void initial(
    InitialDeviceCert event,
    Emitter<DeviceCertState> emit,
  ) async {
    emit(const LoadingDeviceCertState());
    try {
      if (deviceCertModelList!.isEmpty) {
        deviceCertDao = getIt.get<DeviceCertDao>();
        deviceCertModelList = await deviceCertDao.initialTable();
      } else {
        deviceCertModelList = deviceCertDao.list;
      }
    } catch (e) {
      emit(const DeviceCertError(error: "Form is empty!"));
    }
    emit(
      DataDeviceCertState(
        deviceCertModel: deviceCertModelList,
      ),
    );
  }

  void getFromTable(
    GetDeviceCertEvent event,
    Emitter<DeviceCertState> emit,
  ) async {
    emit(const LoadingDeviceCertState());
    try {
      deviceCertModelList = await deviceCertDao.getFromTable();
    } catch (e) {
      emit(const DeviceCertError(error: "Form is empty!"));
    }
    emit(
      DataDeviceCertState(
        deviceCertModel: deviceCertModelList,
      ),
    );
  }

  void addInTable(
    AddDeviceCertEvent event,
    Emitter<DeviceCertState> emit,
  ) async {
    try {
      emit(const LoadingDeviceCertState());
      deviceCertModelList = await deviceCertDao.addInTable(event.deviceCertModel);
    } catch (e) {
      emit(const DeviceCertError(error: "Form is empty!"));
    }
    emit(
      DataDeviceCertState(
        deviceCertModel: deviceCertModelList,
      ),
    );
  }

  void getSerialNumberData(
    GetSerialNumberDataEvent event,
    Emitter<DeviceCertState> emit,
  ) async {
    emit(const LoadingDeviceCertState());
    try {
      deviceCertModelList = await deviceCertDao.getSerialNumberData(event.deviceModel);
    } catch (e) {
      emit(const DeviceCertError(error: "Form is empty!"));
    }
    emit(
      DataDeviceCertState(
        deviceCertModel: deviceCertModelList,
      ),
    );
  }

  void updateTable(
    UpdateDeviceCertEvent event,
    Emitter<DeviceCertState> emit,
  ) async {
    try {
      emit(const LoadingDeviceCertState());
      deviceCertModelList = await deviceCertDao.updateTable(event.deviceCertModel);
    } catch (e) {
      emit(const DeviceCertError(error: "Form is empty!"));
    }
    emit(
      DataDeviceCertState(
        deviceCertModel: deviceCertModelList,
      ),
    );
  }

  void removeTable(
    DeleteDeviceCertEvent event,
    Emitter<DeviceCertState> emit,
  ) async {
    emit(const LoadingDeviceCertState());
    try {
      deviceCertModelList = await deviceCertDao.removeTable(event.deviceCertModel);
    } catch (e) {
      emit(const DeviceCertError(error: "Form is empty!"));
    }
    emit(
      DataDeviceCertState(
        deviceCertModel: deviceCertModelList,
      ),
    );
  }
}
