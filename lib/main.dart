import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:new_table_flutter/screen/device_screen.dart';
import 'package:new_table_flutter/screen/empty_screen.dart';
import 'package:new_table_flutter/screen/organization_screen.dart';

import 'bloc_device/bloc_device.dart';
import 'bloc_device/device_event.dart';
import 'bloc_device_cert/bloc_device_cert.dart';
import 'bloc_device_cert/device_cert_event.dart';
import 'bloc_general_vibration_protocol/bloc_general_vibration_protocol.dart';
import 'bloc_general_vibration_protocol/general_vibration_protocol_event.dart';
import 'bloc_local_vibration_protocol/bloc_local_vibration_protocol.dart';
import 'bloc_local_vibration_protocol/local_vibration_protocol_event.dart';
import 'bloc_microclimate_protocol/bloc_microclimate_protocol.dart';
import 'bloc_microclimate_protocol/microclimate_protocol_event.dart';
import 'bloc_organization/bloc_organization.dart';
import 'bloc_organization/organization_event.dart';
import 'bloc_primary_protocol/bloc_primary_protocol.dart';
import 'bloc_primary_protocol/primary_protocol_event.dart';
import 'bloc_protocol/bloc_protocol.dart';
import 'bloc_protocol/protocol_event.dart';
import 'bloc_workplace/bloc_workplace.dart';
import 'bloc_workplace/workplace_event.dart';
import 'data/db/dao/device_cert_dao.dart';
import 'data/db/dao/device_dao.dart';
import 'data/db/dao/general_vibration_protocol_dao.dart';
import 'data/db/dao/local_vibration_protocol_dao.dart';
import 'data/db/dao/microclimate_protocol_dao.dart';
import 'data/db/dao/organization_dao.dart';
import 'data/db/dao/primary_protocol_dao.dart';
import 'data/db/dao/protocol_dao.dart';
import 'data/db/dao/workplace_dao.dart';
import 'di_container/di.dart';
import 'generated/l10n.dart';

late GetIt getIt;

void main() async {
  getIt = GetIt.instance;
  await startGetIt(getIt);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DeviceDao deviceDao = DeviceDao();
  final DeviceCertDao deviceCertDao = DeviceCertDao();
  final OrganizationDao organizationDao = OrganizationDao();
  final ProtocolDao protocolDao = ProtocolDao();
  final PrimaryProtocolDao primaryProtocolDao = PrimaryProtocolDao();
  final WorkplaceDao workplaceDao = WorkplaceDao();
  final MicroclimateProtocolDao microclimateDao = MicroclimateProtocolDao();
  final GeneralVibrationProtocolDao generalVibrationProtocolDao = GeneralVibrationProtocolDao();
  final LocalVibrationProtocolDao localVibrationProtocolDao = LocalVibrationProtocolDao();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<DeviceBloc>(
              create: (context) => DeviceBloc(deviceDao)..add(const DeviceEvent.initial())),
          BlocProvider<DeviceCertBloc>(
              create: (context) =>
                  DeviceCertBloc(deviceCertDao)..add(const DeviceCertEvent.initial())),
          BlocProvider<OrganizationBloc>(
              create: (context) =>
                  OrganizationBloc(organizationDao)..add(const OrganizationEvent.initial())),
          BlocProvider<ProtocolNameBloc>(
              create: (context) =>
                  ProtocolNameBloc(protocolDao)..add(const ProtocolNameEvent.initial())),
          BlocProvider<PrimaryProtocolBloc>(
              create: (context) => PrimaryProtocolBloc(primaryProtocolDao)
                ..add(const PrimaryProtocolEvent.initial())),
          BlocProvider<WorkplaceBloc>(
              create: (context) =>
                  WorkplaceBloc(workplaceDao)..add(const WorkplaceEvent.initial())),
          BlocProvider<MicroclimateProtocolBloc>(
              create: (context) => MicroclimateProtocolBloc(microclimateDao)
                ..add(const MicroclimateEvent.initial())),
          BlocProvider<GeneralVibrationProtocolBloc>(
              create: (context) => GeneralVibrationProtocolBloc(generalVibrationProtocolDao)
                ..add(const GeneralVibrationProtocolEvent.initial())),
          BlocProvider<LocalVibrationProtocolBloc>(
              create: (context) => LocalVibrationProtocolBloc(localVibrationProtocolDao)
                ..add(const LocalVibrationProtocolEvent.initial())),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Padding(
            padding: EdgeInsets.all(8.0),
            child: MyHomePage(),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List? list = [
    S.current.device_card,
    S.current.instrument_verification_screen,
    S.current.organization
  ];

  getName(String value) {
    dynamic title = const DeviceScreen();
    switch (value) {
      case "Экран поверок приборов":
        title = const DeviceScreen();
        break;
      case "Новый первичный протокол":
        title = const OrganizationScreen();
        break;
      case "Карточка прибора":
        title = const EmptyScreen();
        break;
      default:
        title = const EmptyScreen();
    }
    return title;
  }

  void onBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount;
    if (Platform.isIOS) {
      crossAxisCount = 1;
    } else if (Platform.isAndroid) {
      crossAxisCount = 2;
    } else if (Platform.isWindows) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 3; // По умолчанию для других платформ
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: list?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getName(list?[index] ?? ''),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffC6EEFBFF),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(textAlign: TextAlign.center, "${list?[index]}" ?? ''),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
