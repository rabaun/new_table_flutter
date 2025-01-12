import 'package:bloc/bloc.dart';

import '../../main.dart';
import '../data/db/dao/general_vibration_protocol_dao.dart';
import '../data/models/general_vibration_protocol_model/general_vibration_protocol_model.dart';
import 'general_vibration_protocol_event.dart';
import 'general_vibration_protocol_state.dart';

class GeneralVibrationProtocolBloc
    extends Bloc<GeneralVibrationProtocolEvent, GeneralVibrationProtocolState> {
  late GeneralVibrationProtocolDao generalVibrationProtocolDao;
  List<GeneralVibrationProtocolModel>? generalVibrationProtocolList = [];

  GeneralVibrationProtocolBloc(this.generalVibrationProtocolDao)
      : super(const GeneralVibrationProtocolState.initial()) {
    on<Initial>(initial);
    on<GetGeneralVibrationProtocolEvent>(GeneralVibration);
    on<AddGeneralVibrationProtocolEvent>(addGeneralVibration);
    on<UpdateGeneralVibrationProtocolEvent>(updateDatabase);
    on<GetOrganizationEvent>(getOrganization);
    on<DeleteGeneralVibrationProtocol>(removeDatabase);
  }

  void initial(
    Initial event,
    Emitter<GeneralVibrationProtocolState> emit,
  ) async {
    emit(const LoadingGeneralVibrationProtocolState());
    try {
      if (generalVibrationProtocolList!.isEmpty) {
        generalVibrationProtocolDao = getIt.get<GeneralVibrationProtocolDao>();
        generalVibrationProtocolList = await generalVibrationProtocolDao.initialTable();
      } else {
        generalVibrationProtocolList = generalVibrationProtocolDao.list;
      }
    } catch (e) {
      emit(const GeneralVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataGeneralVibrationProtocolState(
        generalVibrationProtocol: generalVibrationProtocolList,
      ),
    );
  }

  void GeneralVibration(
    GetGeneralVibrationProtocolEvent event,
    Emitter<GeneralVibrationProtocolState> emit,
  ) async {
    emit(const LoadingGeneralVibrationProtocolState());
    try {
      generalVibrationProtocolList = await generalVibrationProtocolDao.getFromTableProtocol();
    } catch (e) {
      emit(const GeneralVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataGeneralVibrationProtocolState(
        generalVibrationProtocol: generalVibrationProtocolList,
      ),
    );
  }

  void addGeneralVibration(
    AddGeneralVibrationProtocolEvent event,
    Emitter<GeneralVibrationProtocolState> emit,
  ) async {
    try {
      emit(const LoadingGeneralVibrationProtocolState());
      generalVibrationProtocolList =
          await generalVibrationProtocolDao.addInTableProtocol(event.generalVibrationProtocol);
    } catch (e) {
      emit(const GeneralVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataGeneralVibrationProtocolState(
        generalVibrationProtocol: generalVibrationProtocolList,
      ),
    );
  }

  void getOrganization(
    GetOrganizationEvent event,
    Emitter<GeneralVibrationProtocolState> emit,
  ) async {
    emit(const LoadingGeneralVibrationProtocolState());
    try {
      generalVibrationProtocolList =
          await generalVibrationProtocolDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const GeneralVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataGeneralVibrationProtocolState(
        generalVibrationProtocol: generalVibrationProtocolList,
      ),
    );
  }

  void updateDatabase(
    UpdateGeneralVibrationProtocolEvent event,
    Emitter<GeneralVibrationProtocolState> emit,
  ) async {
    try {
      emit(const LoadingGeneralVibrationProtocolState());
      generalVibrationProtocolList =
          await generalVibrationProtocolDao.updateTableProtocol(event.generalVibrationProtocol);
    } catch (e) {
      emit(const GeneralVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataGeneralVibrationProtocolState(
        generalVibrationProtocol: generalVibrationProtocolList,
      ),
    );
  }

  void removeDatabase(
    DeleteGeneralVibrationProtocol event,
    Emitter<GeneralVibrationProtocolState> emit,
  ) async {
    emit(const LoadingGeneralVibrationProtocolState());
    try {
      generalVibrationProtocolList =
          await generalVibrationProtocolDao.removeTableProtocol(event.generalVibrationProtocol);
    } catch (e) {
      emit(const GeneralVibrationProtocolError(error: "Form is empty!"));
    }
    emit(
      DataGeneralVibrationProtocolState(
        generalVibrationProtocol: generalVibrationProtocolList,
      ),
    );
  }
}
