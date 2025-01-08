
import 'package:get_it/get_it.dart';

import '../data/db/dao/device_cert_dao.dart';
import '../data/db/dao/device_dao.dart';
import '../data/db/dao/microclimate_protocol_dao.dart';
import '../data/db/dao/organization_dao.dart';
import '../data/db/dao/primary_protocol_dao.dart';
import '../data/db/dao/protocol_dao.dart';
import '../data/db/dao/workplace_dao.dart';

Future<bool?>? startGetIt(GetIt getIt) async {
  getIt.registerSingleton<DeviceDao>(DeviceDao());
  getIt.registerSingleton<DeviceCertDao>(DeviceCertDao());
  getIt.registerSingleton<OrganizationDao>(OrganizationDao());
  getIt.registerSingleton<ProtocolDao>(ProtocolDao());
  getIt.registerSingleton<PrimaryProtocolDao>(PrimaryProtocolDao());
  getIt.registerSingleton<MicroclimateProtocolDao>(MicroclimateProtocolDao());
  getIt.registerSingleton<WorkplaceDao>(WorkplaceDao());

  return null;
}


