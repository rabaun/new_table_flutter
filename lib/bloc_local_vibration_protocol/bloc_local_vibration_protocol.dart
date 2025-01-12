import 'package:bloc/bloc.dart';

import '../../main.dart';
import '../data/db/dao/local_vibration_protocol_dao.dart';
import '../data/models/local_vibration_protocol_model/local_vibration_protocol_model.dart';
import 'local_vibration_protocol_event.dart';
import 'local_vibration_protocol_state.dart';

class LocalVibrationProtocolBloc
    extends Bloc<LocalVibrationProtocolEvent, LocalVibrationProtocolState> {
  late LocalVibrationProtocolDao localVibrationProtocolDao;
  List<LocalVibrationProtocolModel>? localVibrationProtocolList = [];

  LocalVibrationProtocolBloc(this.localVibrationProtocolDao)
      : super(const LocalVibrationProtocolState.initial()) {
    on<Initial>(initial);
    on<GetLocalVibrationProtocolEvent>(LocalVibration);
    on<AddLocalVibrationProtocolEvent>(addLocalVibration);
    on<UpdateLocalVibrationProtocolEvent>(updateDatabase);
    on<GetOrganizationEvent>(getOrganization);
    on<DeleteLocalVibrationProtocolEvent>(removeDatabase);
  }

  void initial(
    Initial event,
    Emitter<LocalVibrationProtocolState> emit,
  ) async {
    emit(const LoadingLocalVibrationProtocolState());
    try {
      if (localVibrationProtocolList!.isEmpty) {
        localVibrationProtocolDao = getIt.get<LocalVibrationProtocolDao>();
        localVibrationProtocolList = await localVibrationProtocolDao.initialTable();
      } else {
        localVibrationProtocolList = localVibrationProtocolDao.list;
      }
    } catch (e) {
      emit(const LocalVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLocalVibrationProtocolState(
        localVibrationProtocol: localVibrationProtocolList,
      ),
    );
  }

  void LocalVibration(
    GetLocalVibrationProtocolEvent event,
    Emitter<LocalVibrationProtocolState> emit,
  ) async {
    emit(const LoadingLocalVibrationProtocolState());
    try {
      localVibrationProtocolList = await localVibrationProtocolDao.getFromTableProtocol();
    } catch (e) {
      emit(const LocalVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLocalVibrationProtocolState(
        localVibrationProtocol: localVibrationProtocolList,
      ),
    );
  }

  void addLocalVibration(
    AddLocalVibrationProtocolEvent event,
    Emitter<LocalVibrationProtocolState> emit,
  ) async {
    try {
      emit(const LoadingLocalVibrationProtocolState());
      localVibrationProtocolList =
          await localVibrationProtocolDao.addInTableProtocol(event.localVibrationProtocol);
    } catch (e) {
      emit(const LocalVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLocalVibrationProtocolState(
        localVibrationProtocol: localVibrationProtocolList,
      ),
    );
  }

  void getOrganization(
    GetOrganizationEvent event,
    Emitter<LocalVibrationProtocolState> emit,
  ) async {
    emit(const LoadingLocalVibrationProtocolState());
    try {
      localVibrationProtocolList =
          await localVibrationProtocolDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const LocalVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLocalVibrationProtocolState(
        localVibrationProtocol: localVibrationProtocolList,
      ),
    );
  }

  void updateDatabase(
    UpdateLocalVibrationProtocolEvent event,
    Emitter<LocalVibrationProtocolState> emit,
  ) async {
    try {
      emit(const LoadingLocalVibrationProtocolState());
      localVibrationProtocolList =
          await localVibrationProtocolDao.updateTableProtocol(event.localVibrationProtocol);
    } catch (e) {
      emit(const LocalVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLocalVibrationProtocolState(
        localVibrationProtocol: localVibrationProtocolList,
      ),
    );
  }

  void removeDatabase(
      DeleteLocalVibrationProtocolEvent event,
    Emitter<LocalVibrationProtocolState> emit,
  ) async {
    emit(const LoadingLocalVibrationProtocolState());
    try {
      localVibrationProtocolList =
          await localVibrationProtocolDao.removeTableProtocol(event.localVibrationProtocol);
    } catch (e) {
      emit(const LocalVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLocalVibrationProtocolState(
        localVibrationProtocol: localVibrationProtocolList,
      ),
    );
  }
}
