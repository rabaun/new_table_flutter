
import 'package:get_it/get_it.dart';

import '../data/db/dao/device_cert_dao.dart';
import '../data/db/dao/device_dao.dart';
import '../data/db/dao/general_vibration_protocol_dao.dart';
import '../data/db/dao/local_vibration_protocol_dao.dart';
import '../data/db/dao/microclimate_protocol_dao.dart';
import '../data/db/dao/organization_dao.dart';
import '../data/db/dao/primary_protocol_dao.dart';
import '../data/db/dao/protocol_dao.dart';
import '../data/db/dao/severity_work_process_dao.dart';
import '../data/db/dao/ultraviolet_radiation_protocol_dao.dart';
import '../data/db/dao/workplace_dao.dart';

Future<bool?>? startGetIt(GetIt getIt) async {
  getIt.registerSingleton<DeviceDao>(DeviceDao());
  getIt.registerSingleton<DeviceCertDao>(DeviceCertDao());
  getIt.registerSingleton<OrganizationDao>(OrganizationDao());
  getIt.registerSingleton<ProtocolDao>(ProtocolDao());
  getIt.registerSingleton<PrimaryProtocolDao>(PrimaryProtocolDao());
  getIt.registerSingleton<MicroclimateProtocolDao>(MicroclimateProtocolDao());
  getIt.registerSingleton<WorkplaceDao>(WorkplaceDao());
  getIt.registerSingleton<GeneralVibrationProtocolDao>(GeneralVibrationProtocolDao());
  getIt.registerSingleton<LocalVibrationProtocolDao>(LocalVibrationProtocolDao());
  getIt.registerSingleton<UltravioletRadiationProtocolDao>(UltravioletRadiationProtocolDao());
  getIt.registerSingleton<SeverityWorkProcessDao>(SeverityWorkProcessDao());

  return null;
}


