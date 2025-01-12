import 'package:bloc/bloc.dart';
import 'package:new_table_flutter/bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_event.dart';
import 'package:new_table_flutter/bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_state.dart';

import '../../main.dart';
import '../data/db/dao/ultraviolet_radiation_protocol_dao.dart';
import '../data/models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';

class UltravioletRadiationProtocolBloc extends Bloc<UltravioletRadiationProtocolEvent, UltravioletRadiationProtocolState> {
  late UltravioletRadiationProtocolDao ultravioletRadiationDao;
  List<UltravioletRadiationProtocolModel>? ultravioletRadiationList = [];

  UltravioletRadiationProtocolBloc(this.ultravioletRadiationDao) : super(const UltravioletRadiationProtocolState.initial()) {
    on<Initial>(initial);
    on<GetUltravioletRadiationProtocolEvent>(getUltravioletRadiationProtocol);
    on<AddUltravioletRadiationProtocolEvent>(addUltravioletRadiationProtocol);
    on<UpdateUltravioletRadiationProtocolEvent>(updateDatabase);
    on<GetOrganizationEvent>(getOrganization);
    on<DeleteUltravioletRadiationProtocolEvent>(removeDatabase);
  }

  void initial(
      Initial event,
      Emitter<UltravioletRadiationProtocolState> emit,
      ) async {
    emit(const LoadingUltravioletRadiationProtocolState());
    try {
      if (ultravioletRadiationList!.isEmpty) {
        ultravioletRadiationDao = getIt.get<UltravioletRadiationProtocolDao>();
        ultravioletRadiationList = await ultravioletRadiationDao.initialTable();
      } else {
        ultravioletRadiationList = ultravioletRadiationDao.list;
      }
    } catch (e) {
      emit(const UltravioletRadiationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataUltravioletRadiationProtocolState(
        ultravioletRadiationList: ultravioletRadiationList,
      ),
    );
  }

  void getUltravioletRadiationProtocol(
      GetUltravioletRadiationProtocolEvent event,
      Emitter<UltravioletRadiationProtocolState> emit,
      ) async {
    emit(const LoadingUltravioletRadiationProtocolState());
    try {
      ultravioletRadiationList = await ultravioletRadiationDao.getFromTableProtocol();
    } catch (e) {
      emit(const UltravioletRadiationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataUltravioletRadiationProtocolState(
        ultravioletRadiationList: ultravioletRadiationList,
      ),
    );
  }

  void addUltravioletRadiationProtocol(
      AddUltravioletRadiationProtocolEvent event,
      Emitter<UltravioletRadiationProtocolState> emit,
      ) async {
    try {
      emit(const LoadingUltravioletRadiationProtocolState());
      ultravioletRadiationList = await ultravioletRadiationDao.addInTableProtocol(event.ultravioletRadiation);
    } catch (e) {
      emit(const UltravioletRadiationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataUltravioletRadiationProtocolState(
        ultravioletRadiationList: ultravioletRadiationList,
      ),
    );
  }

  void getOrganization(
      GetOrganizationEvent event,
      Emitter<UltravioletRadiationProtocolState> emit,
      ) async {
    emit(const LoadingUltravioletRadiationProtocolState());
    try {
      ultravioletRadiationList = await ultravioletRadiationDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const UltravioletRadiationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataUltravioletRadiationProtocolState(
        ultravioletRadiationList: ultravioletRadiationList,
      ),
    );
  }

  void updateDatabase(
      UpdateUltravioletRadiationProtocolEvent event,
      Emitter<UltravioletRadiationProtocolState> emit,
      ) async {
    try {
      emit(const LoadingUltravioletRadiationProtocolState());
      ultravioletRadiationList = await ultravioletRadiationDao.updateTableProtocol(event.ultravioletRadiation);
    } catch (e) {
      emit(const UltravioletRadiationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataUltravioletRadiationProtocolState(
        ultravioletRadiationList: ultravioletRadiationList,
      ),
    );
  }

  void removeDatabase(
      DeleteUltravioletRadiationProtocolEvent event,
      Emitter<UltravioletRadiationProtocolState> emit,
      ) async {
    emit(const LoadingUltravioletRadiationProtocolState());
    try {
      ultravioletRadiationList = await ultravioletRadiationDao.removeTableProtocol(event.ultravioletRadiation);
    } catch (e) {
      emit(const UltravioletRadiationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataUltravioletRadiationProtocolState(
        ultravioletRadiationList: ultravioletRadiationList,
      ),
    );
  }
}
