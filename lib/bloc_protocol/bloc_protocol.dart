import 'package:bloc/bloc.dart';
import 'package:new_table_flutter/bloc_protocol/protocol_event.dart';
import 'package:new_table_flutter/bloc_protocol/protocol_state.dart';

import '../../main.dart';
import '../data/db/dao/protocol_dao.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class ProtocolNameBloc extends Bloc<ProtocolNameEvent, ProtocolNameState> {
  late ProtocolDao protocolDao;
  List<ProtocolNameModel>? protocolList = [];

  ProtocolNameBloc(this.protocolDao) : super(const ProtocolNameState.initial()) {
    on<Initial>(initial);
    on<GetProtocolNameEvent>(getProtocolName);
    on<AddProtocolNameEvent>(addProtocolName);
    on<UpdateProtocolName>(updateDatabase);
    on<GetProtocolEvent>(getProtocol);
    on<DeleteProtocolName>(removeDatabase);
  }

  void initial(
      Initial event,
      Emitter<ProtocolNameState> emit,
      ) async {
    emit(const LoadingProtocolNameState());
    try {
      if (protocolList!.isEmpty) {
        protocolDao = getIt.get<ProtocolDao>();
        protocolList = await protocolDao.getProtocolName();
      } else {
        protocolList = protocolDao.list;
      }
    } catch (e) {
      emit(const ProtocolNameError(error: "Form is empty!"));
    }
    emit(
      DataProtocolNameState(
        protocolNameList: protocolList,
      ),
    );
  }

  void getProtocolName(
      GetProtocolNameEvent event,
      Emitter<ProtocolNameState> emit,
      ) async {
    emit(const LoadingProtocolNameState());
    try {
      protocolList = await protocolDao.getProtocolName();
    } catch (e) {
      emit(const ProtocolNameError(error: "Form is empty!"));
    }
    emit(
      DataProtocolNameState(
        protocolNameList: protocolList,
      ),
    );
  }

  void addProtocolName(
      AddProtocolNameEvent event,
      Emitter<ProtocolNameState> emit,
      ) async {
    try {
      emit(const LoadingProtocolNameState());
      protocolList = await protocolDao.addProtocolName(event.protocolName);
    } catch (e) {
      emit(const ProtocolNameError(error: "Form is empty!"));
    }
    emit(
      DataProtocolNameState(
        protocolNameList: protocolList,
      ),
    );
  }

  void getProtocol(
      GetProtocolEvent event,
      Emitter<ProtocolNameState> emit,
      ) async {
    emit(const LoadingProtocolNameState());
    try {
      protocolList = await protocolDao.getProtocol(event.organization, event.workplaceName);
    } catch (e) {
      emit(const ProtocolNameError(error: "Form is empty!"));
    }
    emit(
      DataProtocolNameState(
        protocolNameList: protocolList,
      ),
    );
  }

  void updateDatabase(
      UpdateProtocolName event,
      Emitter<ProtocolNameState> emit,
      ) async {
    try {
      emit(const LoadingProtocolNameState());
      protocolList = await protocolDao.updateProtocol(event.protocolName);
    } catch (e) {
      emit(const ProtocolNameError(error: "Form is empty!"));
    }
    emit(
      DataProtocolNameState(
        protocolNameList: protocolList,
      ),
    );
  }

  void removeDatabase(
      DeleteProtocolName event,
      Emitter<ProtocolNameState> emit,
      ) async {
    emit(const LoadingProtocolNameState());
    try {
      protocolList = await protocolDao.removeProtocolName(event.protocolName);
    } catch (e) {
      emit(const ProtocolNameError(error: "Form is empty!"));
    }
    emit(
      DataProtocolNameState(
        protocolNameList: protocolList,
      ),
    );
  }
}
