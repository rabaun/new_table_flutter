import 'package:bloc/bloc.dart';

import '../../main.dart';
import '../data/db/dao/chemical_protocol_gank_dao.dart';
import '../data/models/chemical_protocol_gank_model/chemical_protocol_gank_model.dart';
import 'chemical_protocol_gank_event.dart';
import 'chemical_protocol_gank_state.dart';

class ChemicalProtocolGankBloc extends Bloc<ChemicalProtocolGankEvent, ChemicalProtocolGankState> {
  late ChemicalProtocolGankDao chemicalProtocolGankDao;
  List<ChemicalProtocolGankModel>? chemicalProtocolGankList = [];

  ChemicalProtocolGankBloc(this.chemicalProtocolGankDao)
      : super(const ChemicalProtocolGankState.initial()) {
    on<Initial>(initial);
    on<GetChemicalProtocolGankEvent>(getChemicalProtocolGank);
    on<AddChemicalProtocolGankEvent>(addChemicalProtocolGank);
    on<UpdateChemicalProtocolGankEvent>(updateDatabase);
    on<GetOrganizationEvent>(getOrganization);
    on<DeleteChemicalProtocolGankEvent>(removeDatabase);
  }

  void initial(
    Initial event,
    Emitter<ChemicalProtocolGankState> emit,
  ) async {
    emit(const LoadingChemicalProtocolGankState());
    try {
      if (chemicalProtocolGankList!.isEmpty) {
        chemicalProtocolGankDao = getIt.get<ChemicalProtocolGankDao>();
        chemicalProtocolGankList = await chemicalProtocolGankDao.initialTable();
      } else {
        chemicalProtocolGankList = chemicalProtocolGankDao.list;
      }
    } catch (e) {
      emit(const ChemicalProtocolGankStateError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGankState(
        chemicalProtocolGankList: chemicalProtocolGankList,
      ),
    );
  }

  void getChemicalProtocolGank(
    GetChemicalProtocolGankEvent event,
    Emitter<ChemicalProtocolGankState> emit,
  ) async {
    emit(const LoadingChemicalProtocolGankState());
    try {
      chemicalProtocolGankList = await chemicalProtocolGankDao.getFromTableProtocol();
    } catch (e) {
      emit(const ChemicalProtocolGankStateError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGankState(
        chemicalProtocolGankList: chemicalProtocolGankList,
      ),
    );
  }

  void addChemicalProtocolGank(
    AddChemicalProtocolGankEvent event,
    Emitter<ChemicalProtocolGankState> emit,
  ) async {
    try {
      emit(const LoadingChemicalProtocolGankState());
      chemicalProtocolGankList =
          await chemicalProtocolGankDao.addInTableProtocol(event.chemicalProtocolGank);
    } catch (e) {
      emit(const ChemicalProtocolGankStateError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGankState(
        chemicalProtocolGankList: chemicalProtocolGankList,
      ),
    );
  }

  void getOrganization(
    GetOrganizationEvent event,
    Emitter<ChemicalProtocolGankState> emit,
  ) async {
    emit(const LoadingChemicalProtocolGankState());
    try {
      chemicalProtocolGankList = await chemicalProtocolGankDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const ChemicalProtocolGankStateError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGankState(
        chemicalProtocolGankList: chemicalProtocolGankList,
      ),
    );
  }

  void updateDatabase(
    UpdateChemicalProtocolGankEvent event,
    Emitter<ChemicalProtocolGankState> emit,
  ) async {
    try {
      emit(const LoadingChemicalProtocolGankState());
      chemicalProtocolGankList =
          await chemicalProtocolGankDao.updateTableProtocol(event.chemicalProtocolGank);
    } catch (e) {
      emit(const ChemicalProtocolGankStateError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGankState(
        chemicalProtocolGankList: chemicalProtocolGankList,
      ),
    );
  }

  void removeDatabase(
    DeleteChemicalProtocolGankEvent event,
    Emitter<ChemicalProtocolGankState> emit,
  ) async {
    emit(const LoadingChemicalProtocolGankState());
    try {
      chemicalProtocolGankList =
          await chemicalProtocolGankDao.removeTableProtocol(event.chemicalProtocolGank);
    } catch (e) {
      emit(const ChemicalProtocolGankStateError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGankState(
        chemicalProtocolGankList: chemicalProtocolGankList,
      ),
    );
  }
}
