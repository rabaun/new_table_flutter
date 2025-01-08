import 'package:bloc/bloc.dart';

import '../../main.dart';
import '../data/db/dao/organization_dao.dart';
import '../data/models/organization_model/organization_model.dart';
import 'organization_event.dart';
import 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  late OrganizationDao organizationDao;
  List<OrganizationModel>? organizationList = [];

  OrganizationBloc(this.organizationDao) : super(const OrganizationState.initial()) {
    on<Initial>(initial);
    on<GetOrganizationEvent>(getOrganization);
    on<AddOrganizationEvent>(addOrganization);
    on<UpdateOrganizationEvent>(updateOrganization);
    on<DeleteOrganizationEvent>(removeOrganization);
  }

  void initial(
    Initial event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(const LoadingOrganizationState());
    try {
      if (organizationList!.isEmpty) {
        organizationDao = getIt.get<OrganizationDao>();
        organizationList = await organizationDao.getOrganization();
      } else {
        organizationList = organizationDao.organizationList;
      }
    } catch (e) {
      emit(const OrganizationError(error: "Form is empty!"));
    }
    emit(
      DataOrganizationState(
        organizationList: organizationList,
      ),
    );
  }

  void getOrganization(
    GetOrganizationEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(const LoadingOrganizationState());
    try {
      organizationList = await organizationDao.getOrganization();
    } catch (e) {
      emit(const OrganizationError(error: "Form is empty!"));
    }
    emit(
      DataOrganizationState(
        organizationList: organizationList,
      ),
    );
  }

  void addOrganization(
    AddOrganizationEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      emit(const LoadingOrganizationState());
      organizationList = await organizationDao.addOrganization(event.organization);
    } catch (e) {
      emit(const OrganizationError(error: "Form is empty!"));
    }
    emit(
      DataOrganizationState(
        organizationList: organizationList,
      ),
    );
  }

  void updateOrganization(
    UpdateOrganizationEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      emit(const LoadingOrganizationState());
      organizationList = await organizationDao.updateOrganization(event.organization);
    } catch (e) {
      emit(const OrganizationError(error: "Form is empty!"));
    }
    emit(
      DataOrganizationState(
        organizationList: organizationList,
      ),
    );
  }

  void removeOrganization(
    DeleteOrganizationEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(const LoadingOrganizationState());
    try {
      organizationList = await organizationDao.removeOrganization(event.organization);
    } catch (e) {
      emit(const OrganizationError(error: "Form is empty!"));
    }
    emit(
      DataOrganizationState(
        organizationList: organizationList,
      ),
    );
  }
}
