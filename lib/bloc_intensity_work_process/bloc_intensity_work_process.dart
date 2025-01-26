import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/db/dao/intensity_work_process_dao.dart';
import '../data/models/intensity_work_process_model/intensity_work_process_model.dart';
import '../main.dart';
import 'intensity_work_process_event.dart';
import 'intensity_work_process_state.dart';

class IntensityWorkProcessBloc extends Bloc<IntensityWorkProcessEvent, IntensityWorkProcessState> {
  late IntensityWorkProcessDao intensityWorkProcessDao;
  List<IntensityWorkProcessModel>? intensityWorkProcessList = [];

  IntensityWorkProcessBloc(this.intensityWorkProcessDao)
      : super(const IntensityWorkProcessState.initial()) {
    on<Initial>(initial);
    on<GetIntensityWorkProcessEvent>(getIntensityWorkProcess);
    on<AddIntensityWorkProcessEvent>(addIntensityWorkProcess);
    on<UpdateIntensityWorkProcessEvent>(updateDatabase);
    on<GetOrganizationEvent>(getProtocol);
    on<DeleteIntensityWorkProcessEvent>(removeDatabase);
  }

  void initial(
      Initial event,
      Emitter<IntensityWorkProcessState> emit,
      ) async {
    emit(const LoadingIntensityWorkProcessState());
    try {
      if (intensityWorkProcessList!.isEmpty) {
        intensityWorkProcessDao = getIt.get<IntensityWorkProcessDao>();
        intensityWorkProcessList = await intensityWorkProcessDao.initialTable();
      } else {
        intensityWorkProcessList = intensityWorkProcessDao.list;
      }
    } catch (e) {
      emit(const IntensityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataIntensityWorkProcessState(
        intensityWorkProcess: intensityWorkProcessList,
      ),
    );
  }

  void getIntensityWorkProcess(
      GetIntensityWorkProcessEvent event,
      Emitter<IntensityWorkProcessState> emit,
      ) async {
    emit(const LoadingIntensityWorkProcessState());
    try {
      intensityWorkProcessList = await intensityWorkProcessDao.getFromTableProtocol();
    } catch (e) {
      emit(const IntensityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataIntensityWorkProcessState(
        intensityWorkProcess: intensityWorkProcessList,
      ),
    );
  }

  void addIntensityWorkProcess(
      AddIntensityWorkProcessEvent event,
      Emitter<IntensityWorkProcessState> emit,
      ) async {
    try {
      emit(const LoadingIntensityWorkProcessState());
      intensityWorkProcessList =
      await intensityWorkProcessDao.addInTableProtocol(event.intensityWorkProcess);
    } catch (e) {
      emit(const IntensityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataIntensityWorkProcessState(
        intensityWorkProcess: intensityWorkProcessList,
      ),
    );
  }

  void getProtocol(
      GetOrganizationEvent event,
      Emitter<IntensityWorkProcessState> emit,
      ) async {
    emit(const LoadingIntensityWorkProcessState());
    try {
      intensityWorkProcessList = await intensityWorkProcessDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const IntensityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataIntensityWorkProcessState(
        intensityWorkProcess: intensityWorkProcessList,
      ),
    );
  }

  void updateDatabase(
      UpdateIntensityWorkProcessEvent event,
      Emitter<IntensityWorkProcessState> emit,
      ) async {
    try {
      emit(const LoadingIntensityWorkProcessState());
      intensityWorkProcessList =
      await intensityWorkProcessDao.updateTableProtocol(event.intensityWorkProcess);
    } catch (e) {
      emit(const IntensityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataIntensityWorkProcessState(
        intensityWorkProcess: intensityWorkProcessList,
      ),
    );
  }

  void removeDatabase(
      DeleteIntensityWorkProcessEvent event,
      Emitter<IntensityWorkProcessState> emit,
      ) async {
    emit(const LoadingIntensityWorkProcessState());
    try {
      intensityWorkProcessList =
      await intensityWorkProcessDao.removeTableProtocol(event.intensityWorkProcess);
    } catch (e) {
      emit(const IntensityWorkProcessStateError(error: "Form is empty!"));
    }
    emit(
      DataIntensityWorkProcessState(
        intensityWorkProcess: intensityWorkProcessList,
      ),
    );
  }
}
