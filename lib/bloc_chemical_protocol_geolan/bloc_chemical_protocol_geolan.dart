import 'package:bloc/bloc.dart';
import '../../main.dart';
import '../data/db/dao/chemical_protocol_geolan_dao.dart';
import '../data/models/chemical_protocol_geolan_model/chemical_protocol_geolan_model.dart';
import 'chemical_protocol_geolan_event.dart';
import 'chemical_protocol_geolan_state.dart';

class ChemicalProtocolGeolanBloc extends Bloc<ChemicalProtocolGeolanEvent, ChemicalProtocolGeolanState> {
  late ChemicalProtocolGeolanDao chemicalProtocolGeolanDao;
  List<ChemicalProtocolGeolanModel>? chemicalProtocolGeolan = [];

  ChemicalProtocolGeolanBloc(this.chemicalProtocolGeolanDao) : super(const ChemicalProtocolGeolanState.initial()) {
    on<InitialChemicalProtocolEvent>(initial);
    on<GetChemicalProtocolGeolanEvent>(getChemicalProtocolGeolan);
    on<AddChemicalProtocolGeolanEvent>(addChemicalProtocolGeolan);
    on<UpdateChemicalProtocolGeolanEvent>(updateDatabase);
    on<GetChemicalProtocolEvent>(getProtocol);
    on<DeleteChemicalProtocolGeolanEvent>(removeDatabase);
  }

  void initial(
      InitialChemicalProtocolEvent event,
      Emitter<ChemicalProtocolGeolanState> emit,
      ) async {
    emit(const LoadingChemicalProtocolGeolan());
    try {
      if (chemicalProtocolGeolan!.isEmpty) {
        chemicalProtocolGeolanDao = getIt.get<ChemicalProtocolGeolanDao>();
        chemicalProtocolGeolan = await chemicalProtocolGeolanDao.getFromTableProtocol();
      } else {
        chemicalProtocolGeolan = chemicalProtocolGeolanDao.list;
      }
    } catch (e) {
      emit(const ChemicalProtocolGeolanError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGeolanState(
        chemicalProtocolGeolan: chemicalProtocolGeolan,
      ),
    );
  }

  void getChemicalProtocolGeolan(
      GetChemicalProtocolGeolanEvent event,
      Emitter<ChemicalProtocolGeolanState> emit,
      ) async {
    emit(const LoadingChemicalProtocolGeolan());
    try {
      chemicalProtocolGeolan = await  chemicalProtocolGeolanDao.getFromTableProtocol();
    } catch (e) {
      emit(const ChemicalProtocolGeolanError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGeolanState(
        chemicalProtocolGeolan:  chemicalProtocolGeolan,
      ),
    );
  }

  void addChemicalProtocolGeolan(
      AddChemicalProtocolGeolanEvent event,
      Emitter<ChemicalProtocolGeolanState> emit,
      ) async {
    try {
      emit(const LoadingChemicalProtocolGeolan());
      chemicalProtocolGeolan = await  chemicalProtocolGeolanDao.addInTableProtocol(event. chemicalProtocolGeolan);
    } catch (e) {
      emit(const ChemicalProtocolGeolanError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGeolanState(
        chemicalProtocolGeolan: chemicalProtocolGeolan,
      ),
    );
  }

  void getProtocol(
      GetChemicalProtocolEvent event,
      Emitter<ChemicalProtocolGeolanState> emit,
      ) async {
    emit(const LoadingChemicalProtocolGeolan());
    try {
      chemicalProtocolGeolan = await  chemicalProtocolGeolanDao.getProtocol(event.protocolName);
    } catch (e) {
      emit(const ChemicalProtocolGeolanError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGeolanState(
        chemicalProtocolGeolan:  chemicalProtocolGeolan,
      ),
    );
  }

  void updateDatabase(
      UpdateChemicalProtocolGeolanEvent event,
      Emitter<ChemicalProtocolGeolanState> emit,
      ) async {
    try {
      emit(const LoadingChemicalProtocolGeolan());
      chemicalProtocolGeolan = await  chemicalProtocolGeolanDao.updateTableProtocol(event.chemicalProtocolGeolan);
    } catch (e) {
      emit(const ChemicalProtocolGeolanError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGeolanState(
        chemicalProtocolGeolan:  chemicalProtocolGeolan,
      ),
    );
  }

  void removeDatabase(
      DeleteChemicalProtocolGeolanEvent event,
      Emitter<ChemicalProtocolGeolanState> emit,
      ) async {
    emit(const LoadingChemicalProtocolGeolan());
    try {
      chemicalProtocolGeolan = await chemicalProtocolGeolanDao.removeTableProtocol(event.chemicalProtocolGeolan);
    } catch (e) {
      emit(const ChemicalProtocolGeolanError(error: "Form is empty!"));
    }
    emit(
      DataChemicalProtocolGeolanState(
        chemicalProtocolGeolan: chemicalProtocolGeolan,
      ),
    );
  }
}
