import 'package:bloc/bloc.dart';
import 'package:new_table_flutter/bloc_workplace/workplace_event.dart';
import 'package:new_table_flutter/bloc_workplace/workplace_state.dart';

import '../../main.dart';
import '../data/db/dao/workplace_dao.dart';
import '../data/models/workplace_model/workplace_model.dart';

class WorkplaceBloc extends Bloc<WorkplaceEvent, WorkplaceState> {
  late WorkplaceDao workplaceDao;
  List<WorkplaceModel>? workplaceList = [];

  WorkplaceBloc(this.workplaceDao) : super(const WorkplaceState.initial()) {
    on<Initial>(initial);
    on<GetWorkplaceEvent>(getWorkplace);
    on<AddWorkplaceEvent>(addWorkplace);
    on<UpdateWorkplace>(updateDatabase);
    on<GetOrganizationEvent>(getOrganization);
    on<DeleteWorkplace>(removeDatabase);
  }

  void initial(
      Initial event,
      Emitter<WorkplaceState> emit,
      ) async {
    emit(const LoadingWorkplaceState());
    try {
      if (workplaceList!.isEmpty) {
        workplaceDao = getIt.get<WorkplaceDao>();
        workplaceList = await workplaceDao.initialTable();
      } else {
        workplaceList = workplaceDao.list;
      }
    } catch (e) {
      emit(const WorkplaceError(error: "Form is empty!"));
    }
    emit(
      DataWorkplaceState(
        workplaceList: workplaceList,
      ),
    );
  }

  void getWorkplace(
      GetWorkplaceEvent event,
      Emitter<WorkplaceState> emit,
      ) async {
    emit(const LoadingWorkplaceState());
    try {
      workplaceList = await workplaceDao.getFromTable();
    } catch (e) {
      emit(const WorkplaceError(error: "Form is empty!"));
    }
    emit(
      DataWorkplaceState(
        workplaceList: workplaceList,
      ),
    );
  }

  void addWorkplace(
      AddWorkplaceEvent event,
      Emitter<WorkplaceState> emit,
      ) async {
    try {
      emit(const LoadingWorkplaceState());
      workplaceList = await workplaceDao.addInTable(event.workplace);
    } catch (e) {
      emit(const WorkplaceError(error: "Form is empty!"));
    }
    emit(
      DataWorkplaceState(
        workplaceList: workplaceList,
      ),
    );
  }

  void getOrganization(
      GetOrganizationEvent event,
      Emitter<WorkplaceState> emit,
      ) async {
    emit(const LoadingWorkplaceState());
    try {
      workplaceList = await workplaceDao.getWorkplace(event.organization);
    } catch (e) {
      emit(const WorkplaceError(error: "Form is empty!"));
    }
    emit(
      DataWorkplaceState(
        workplaceList: workplaceList,
      ),
    );
  }

  void updateDatabase(
      UpdateWorkplace event,
      Emitter<WorkplaceState> emit,
      ) async {
    try {
      emit(const LoadingWorkplaceState());
      workplaceList = await workplaceDao.updateTable(event.workplaceName);
    } catch (e) {
      emit(const WorkplaceError(error: "Form is empty!"));
    }
    emit(
      DataWorkplaceState(
        workplaceList: workplaceList,
      ),
    );
  }

  void removeDatabase(
      DeleteWorkplace event,
      Emitter<WorkplaceState> emit,
      ) async {
    emit(const LoadingWorkplaceState());
    try {
      workplaceList = await workplaceDao.removeTable(event.workplace);
    } catch (e) {
      emit(const WorkplaceError(error: "Form is empty!"));
    }
    emit(
      DataWorkplaceState(
        workplaceList: workplaceList,
      ),
    );
  }
}
