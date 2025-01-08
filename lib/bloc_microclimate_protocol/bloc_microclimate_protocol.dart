import 'package:bloc/bloc.dart';

import '../../main.dart';
import '../data/db/dao/microclimate_protocol_dao.dart';
import '../data/models/microclimate_protocol_model/microclimate_protocol_model.dart';
import 'microclimate_protocol_event.dart';
import 'microclimate_protocol_state.dart';

class MicroclimateProtocolBloc extends Bloc<MicroclimateEvent, MicroclimateState> {
  late MicroclimateProtocolDao microclimateDao;
  List<MicroclimateProtocolModel>? microclimateList = [];

  MicroclimateProtocolBloc(this.microclimateDao) : super(const MicroclimateState.initial()) {
    on<Initial>(initial);
    on<GetMicroclimateEvent>(getMicroclimate);
    on<AddMicroclimateEvent>(addMicroclimate);
    on<UpdateMicroclimateEvent>(updateDatabase);
    on<GetOrganizationEvent>(getOrganization);
    on<DeleteMicroclimateEvent>(removeDatabase);
  }

  void initial(
      Initial event,
      Emitter<MicroclimateState> emit,
      ) async {
    emit(const LoadingMicroclimateState());
    try {
      if (microclimateList!.isEmpty) {
        microclimateDao = getIt.get<MicroclimateProtocolDao>();
        microclimateList = await microclimateDao.initialTable();
      } else {
        microclimateList = microclimateDao.list;
      }
    } catch (e) {
      emit(const MicroclimateError(error: "Form is empty!"));
    }
    emit(
      DataMicroclimateState(
        microclimateList: microclimateList,
      ),
    );
  }

  void getMicroclimate(
      GetMicroclimateEvent event,
      Emitter<MicroclimateState> emit,
      ) async {
    emit(const LoadingMicroclimateState());
    try {
      microclimateList = await microclimateDao.getFromTableProtocol();
    } catch (e) {
      emit(const MicroclimateError(error: "Form is empty!"));
    }
    emit(
      DataMicroclimateState(
        microclimateList: microclimateList,
      ),
    );
  }

  void addMicroclimate(
      AddMicroclimateEvent event,
      Emitter<MicroclimateState> emit,
      ) async {
    try {
      emit(const LoadingMicroclimateState());
      microclimateList = await microclimateDao.addInTableProtocol(event.microclimate);
    } catch (e) {
      emit(const MicroclimateError(error: "Form is empty!"));
    }
    emit(
      DataMicroclimateState(
        microclimateList: microclimateList,
      ),
    );
  }

  void getOrganization(
      GetOrganizationEvent event,
      Emitter<MicroclimateState> emit,
      ) async {
    emit(const LoadingMicroclimateState());
    try {
      microclimateList = await microclimateDao.getWorkplace(event.protocolName);
    } catch (e) {
      emit(const MicroclimateError(error: "Form is empty!"));
    }
    emit(
      DataMicroclimateState(
        microclimateList: microclimateList,
      ),
    );
  }

  void updateDatabase(
      UpdateMicroclimateEvent event,
      Emitter<MicroclimateState> emit,
      ) async {
    try {
      emit(const LoadingMicroclimateState());
      microclimateList = await microclimateDao.updateTableProtocol(event.microclimate);
    } catch (e) {
      emit(const MicroclimateError(error: "Form is empty!"));
    }
    emit(
      DataMicroclimateState(
        microclimateList: microclimateList,
      ),
    );
  }

  void removeDatabase(
      DeleteMicroclimateEvent event,
      Emitter<MicroclimateState> emit,
      ) async {
    emit(const LoadingMicroclimateState());
    try {
      microclimateList = await microclimateDao.removeTableProtocol(event.microclimate);
    } catch (e) {
      emit(const MicroclimateError(error: "Form is empty!"));
    }
    emit(
      DataMicroclimateState(
        microclimateList: microclimateList,
      ),
    );
  }
}
