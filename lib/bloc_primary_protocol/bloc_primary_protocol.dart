import 'package:bloc/bloc.dart';
import 'package:new_table_flutter/bloc_primary_protocol/primary_protocol_event.dart';
import 'package:new_table_flutter/bloc_primary_protocol/primary_protocol_state.dart';
import '../../main.dart';
import '../data/db/dao/primary_protocol_dao.dart';
import '../data/models/primary_protocol_model/primary_protocol_model.dart';

class PrimaryProtocolBloc extends Bloc<PrimaryProtocolEvent, PrimaryProtocolState> {
  late PrimaryProtocolDao primaryProtocolDao;
  List<PrimaryProtocolModel>? primaryProtocolList = [];

  PrimaryProtocolBloc(this.primaryProtocolDao) : super(const PrimaryProtocolState.initial()) {
    on<Initial>(initial);
    on<GetPrimaryProtocolEvent>(getProtocolName);
    on<AddPrimaryProtocolEvent>(addProtocolName);
    on<UpdatePrimaryProtocolEvent>(updateDatabase);
    on<GetProtocolEvent>(getProtocol);
    on<DeletePrimaryProtocolEvent>(removeDatabase);
  }

  void initial(
      Initial event,
      Emitter<PrimaryProtocolState> emit,
      ) async {
    emit(const LoadingPrimaryProtocolState());
    try {
      if (primaryProtocolList!.isEmpty) {
        primaryProtocolDao = getIt.get<PrimaryProtocolDao>();
        primaryProtocolList = await primaryProtocolDao.getFromTableProtocol();
      } else {
        primaryProtocolList = primaryProtocolDao.list;
      }
    } catch (e) {
      emit(const PrimaryProtocolError(error: "Form is empty!"));
    }
    emit(
      DataPrimaryProtocolState(
        primaryProtocolList: primaryProtocolList,
      ),
    );
  }

  void getProtocolName(
      GetPrimaryProtocolEvent event,
      Emitter<PrimaryProtocolState> emit,
      ) async {
    emit(const LoadingPrimaryProtocolState());
    try {
      primaryProtocolList = await  primaryProtocolDao.getFromTableProtocol();
    } catch (e) {
      emit(const PrimaryProtocolError(error: "Form is empty!"));
    }
    emit(
      DataPrimaryProtocolState(
        primaryProtocolList:  primaryProtocolList,
      ),
    );
  }

  void addProtocolName(
      AddPrimaryProtocolEvent event,
      Emitter<PrimaryProtocolState> emit,
      ) async {
    try {
      emit(const LoadingPrimaryProtocolState());
      primaryProtocolList = await  primaryProtocolDao.addInTableProtocol(event. primaryProtocol);
    } catch (e) {
      emit(const PrimaryProtocolError(error: "Form is empty!"));
    }
    emit(
      DataPrimaryProtocolState(
        primaryProtocolList: primaryProtocolList,
      ),
    );
  }

  void getProtocol(
      GetProtocolEvent event,
      Emitter<PrimaryProtocolState> emit,
      ) async {
    emit(const LoadingPrimaryProtocolState());
    try {
      primaryProtocolList = await  primaryProtocolDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const PrimaryProtocolError(error: "Form is empty!"));
    }
    emit(
      DataPrimaryProtocolState(
        primaryProtocolList:  primaryProtocolList,
      ),
    );
  }

  void updateDatabase(
      UpdatePrimaryProtocolEvent event,
      Emitter<PrimaryProtocolState> emit,
      ) async {
    try {
      emit(const LoadingPrimaryProtocolState());
      primaryProtocolList = await  primaryProtocolDao.updateTableProtocol(event. primaryProtocol);
    } catch (e) {
      emit(const PrimaryProtocolError(error: "Form is empty!"));
    }
    emit(
      DataPrimaryProtocolState(
        primaryProtocolList:  primaryProtocolList,
      ),
    );
  }

  void removeDatabase(
      DeletePrimaryProtocolEvent event,
      Emitter<PrimaryProtocolState> emit,
      ) async {
    emit(const LoadingPrimaryProtocolState());
    try {
      primaryProtocolList = await primaryProtocolDao.removeTableProtocol(event.primaryProtocol);
    } catch (e) {
      emit(const PrimaryProtocolError(error: "Form is empty!"));
    }
    emit(
      DataPrimaryProtocolState(
        primaryProtocolList: primaryProtocolList,
      ),
    );
  }
}
