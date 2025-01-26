import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_table_flutter/bloc_severity_work_process_protocol/severity_work_process_event.dart';
import 'package:new_table_flutter/bloc_severity_work_process_protocol/severity_work_process_state.dart';

import '../data/db/dao/severity_work_process_dao.dart';
import '../data/models/severity_work_process_model/severity_work_process_model.dart';
import '../main.dart';

class SeverityWorkProcessBloc extends Bloc<SeverityWorkProcessEvent, SeverityWorkProcessState> {
  late SeverityWorkProcessDao severityWorkProcessDao;
  List<SeverityWorkProcessModel>? severityWorkProcessList = [];

  SeverityWorkProcessBloc(this.severityWorkProcessDao)
      : super(const SeverityWorkProcessState.initial()) {
    on<Initial>(initial);
    on<GetSeverityWorkProcessEvent>(getSeverityWorkProcess);
    on<AddSeverityWorkProcessEvent>(addSeverityWorkProcess);
    on<UpdateSeverityWorkProcessEvent>(updateDatabase);
    on<GetOrganizationEvent>(getProtocol);
    on<DeleteSeverityWorkProcessEvent>(removeDatabase);
  }

  void initial(
    Initial event,
    Emitter<SeverityWorkProcessState> emit,
  ) async {
    emit(const LoadingSeverityWorkProcessState());
    try {
      if (severityWorkProcessList!.isEmpty) {
        severityWorkProcessDao = getIt.get<SeverityWorkProcessDao>();
        severityWorkProcessList = await severityWorkProcessDao.initialTable();
      } else {
        severityWorkProcessList = severityWorkProcessDao.list;
      }
    } catch (e) {
      emit(const SeverityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataSeverityWorkProcessState(
        severityWorkProcessList: severityWorkProcessList,
      ),
    );
  }

  void getSeverityWorkProcess(
    GetSeverityWorkProcessEvent event,
    Emitter<SeverityWorkProcessState> emit,
  ) async {
    emit(const LoadingSeverityWorkProcessState());
    try {
      severityWorkProcessList = await severityWorkProcessDao.getFromTableProtocol();
    } catch (e) {
      emit(const SeverityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataSeverityWorkProcessState(
        severityWorkProcessList: severityWorkProcessList,
      ),
    );
  }

  void addSeverityWorkProcess(
    AddSeverityWorkProcessEvent event,
    Emitter<SeverityWorkProcessState> emit,
  ) async {
    try {
      emit(const LoadingSeverityWorkProcessState());
      severityWorkProcessList =
          await severityWorkProcessDao.addInTableProtocol(event.severityWorkProcess);
    } catch (e) {
      emit(const SeverityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataSeverityWorkProcessState(
        severityWorkProcessList: severityWorkProcessList,
      ),
    );
  }

  void getProtocol(
    GetOrganizationEvent event,
    Emitter<SeverityWorkProcessState> emit,
  ) async {
    emit(const LoadingSeverityWorkProcessState());
    try {
      severityWorkProcessList = await severityWorkProcessDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const SeverityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataSeverityWorkProcessState(
        severityWorkProcessList: severityWorkProcessList,
      ),
    );
  }

  void updateDatabase(
    UpdateSeverityWorkProcessEvent event,
    Emitter<SeverityWorkProcessState> emit,
  ) async {
    try {
      emit(const LoadingSeverityWorkProcessState());
      severityWorkProcessList =
          await severityWorkProcessDao.updateTableProtocol(event.severityWorkProcess);
    } catch (e) {
      emit(const SeverityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataSeverityWorkProcessState(
        severityWorkProcessList: severityWorkProcessList,
      ),
    );
  }

  void removeDatabase(
    DeleteSeverityWorkProcessEvent event,
    Emitter<SeverityWorkProcessState> emit,
  ) async {
    emit(const LoadingSeverityWorkProcessState());
    try {
      severityWorkProcessList =
          await severityWorkProcessDao.removeTableProtocol(event.severityWorkProcess);
    } catch (e) {
      emit(const SeverityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataSeverityWorkProcessState(
        severityWorkProcessList: severityWorkProcessList,
      ),
    );
  }
}
