import 'package:bloc/bloc.dart';
import '../../main.dart';
import '../data/db/dao/lighting_protocol_dao.dart';
import '../data/models/lighting_protocol_model/lighting_protocol_model.dart';
import 'lighting_protocol_event.dart';
import 'lighting_protocol_state.dart';

class LightingProtocolBloc extends Bloc<LightingProtocolEvent, LightingProtocolState> {
  late LightingProtocolDao lightingProtocolDao;
  List<LightingProtocolModel>? lightingProtocolList = [];

  LightingProtocolBloc(this.lightingProtocolDao) : super(const LightingProtocolState.initial()) {
    on<Initial>(initial);
    on<GetLightingProtocolEvent>(getProtocolName);
    on<AddLightingProtocolEvent>(addProtocolName);
    on<UpdateLightingProtocolEvent>(updateDatabase);
    on<GetProtocolEvent>(getProtocol);
    on<DeleteLightingProtocolEvent>(removeDatabase);
  }

  void initial(
      Initial event,
      Emitter<LightingProtocolState> emit,
      ) async {
    emit(const LoadingLightingProtocolState());
    try {
      if (lightingProtocolList!.isEmpty) {
        lightingProtocolDao = getIt.get<LightingProtocolDao>();
        lightingProtocolList = await lightingProtocolDao.getFromTableProtocol();
      } else {
        lightingProtocolList = lightingProtocolDao.list;
      }
    } catch (e) {
      emit(const LightingProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLightingProtocolState(
        lightingProtocolList: lightingProtocolList,
      ),
    );
  }

  void getProtocolName(
      GetLightingProtocolEvent event,
      Emitter<LightingProtocolState> emit,
      ) async {
    emit(const LoadingLightingProtocolState());
    try {
      lightingProtocolList = await  lightingProtocolDao.getFromTableProtocol();
    } catch (e) {
      emit(const LightingProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLightingProtocolState(
        lightingProtocolList: lightingProtocolList,
      ),
    );
  }

  void addProtocolName(
      AddLightingProtocolEvent event,
      Emitter<LightingProtocolState> emit,
      ) async {
    try {
      emit(const LoadingLightingProtocolState());
      lightingProtocolList = await  lightingProtocolDao.addInTableProtocol(event.lightingProtocol);
    } catch (e) {
      emit(const LightingProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLightingProtocolState(
        lightingProtocolList: lightingProtocolList,
      ),
    );
  }

  void getProtocol(
      GetProtocolEvent event,
      Emitter<LightingProtocolState> emit,
      ) async {
    emit(const LoadingLightingProtocolState());
    try {
      lightingProtocolList = await  lightingProtocolDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const LightingProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLightingProtocolState(
        lightingProtocolList: lightingProtocolList,
      ),
    );
  }

  void updateDatabase(
      UpdateLightingProtocolEvent event,
      Emitter<LightingProtocolState> emit,
      ) async {
    try {
      emit(const LoadingLightingProtocolState());
      lightingProtocolList = await  lightingProtocolDao.updateTableProtocol(event.lightingProtocol);
    } catch (e) {
      emit(const LightingProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLightingProtocolState(
        lightingProtocolList: lightingProtocolList,
      ),
    );
  }

  void removeDatabase(
      DeleteLightingProtocolEvent event,
      Emitter<LightingProtocolState> emit,
      ) async {
    emit(const LoadingLightingProtocolState());
    try {
      lightingProtocolList = await lightingProtocolDao.removeTableProtocol(event.lightingProtocol);
    } catch (e) {
      emit(const LightingProtocolError(error: "Form is empty!"));
    }
    emit(
      DataLightingProtocolState(
        lightingProtocolList: lightingProtocolList,
      ),
    );
  }
}
