import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_table_flutter/bloc_protocol/protocol_dialog.dart';
import 'package:new_table_flutter/bloc_protocol/protocol_event.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/workplace_model/workplace_model.dart';
import '../screen/chemical_protocol_gank_screen.dart';
import '../screen/chemical_protocol_geolan_screen.dart';
import '../screen/general_vibration_protocol_screen.dart';
import '../screen/intensity_work_process_screen.dart';
import '../screen/local_vibration_protocol_screen.dart';
import '../screen/microclimate_protocol_screen.dart';
import '../screen/primary_protocol_screen.dart';
import '../screen/severity_work_process_screen.dart';
import '../screen/ultraviolet_radiation_protocol_screen.dart';
import 'bloc_protocol.dart';

class NewProtocolNameBody extends StatelessWidget {
  const NewProtocolNameBody(
      {super.key, required this.organization, this.workplaceName, this.protocolNameList});

  final List<ProtocolNameModel>? protocolNameList;
  final OrganizationModel? organization;
  final WorkplaceModel? workplaceName;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProtocolNameBloc>(context).add(
        ProtocolNameEvent.getProtocol(organization: organization, workplaceName: workplaceName));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Список вредных факторов на РМ")),
        centerTitle: true,
        actions: [
          _floatingButton(context),
        ],
      ),
      body: ListView.builder(
        itemCount: protocolNameList?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Переход на новый экран с анимацией
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      getName(protocolNameList![index].protocolName.toString(), index),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0); // Начальная позиция (справа)
                    const end = Offset.zero; // Конечная позиция (центр)
                    const curve = Curves.easeInOut; // Кривая анимации

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              BlocProvider.of<ProtocolNameBloc>(context)
                  .add(ProtocolNameEvent.remove(protocolName: protocolNameList?[index]));
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  protocolNameList?[index].protocolName ?? '', // Отображаем название организации
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  getName(String value, int index) {
    dynamic title = PrimaryProtocolScreen(
      protocolName: protocolNameList?[index],
    );
    switch (value) {
      case "Шум":
        title = PrimaryProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Вибрация локальная":
        title = LocalVibrationProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Вибрация общая":
        title = GeneralVibrationProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Освещение":
        title = PrimaryProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Химический ГАНК":
        title = ChemicalProtocolGankScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Химический Геолан":
        title = ChemicalProtocolGeolanScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "УФ-излучение":
        title = UltravioletRadiationProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Микроклимат":
        title = MicroclimateProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Аэрозоли АПДФ":
        title = PrimaryProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Лазерное излучение":
        title = PrimaryProtocolScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Тяжесть турдового процесса":
        title = SeverityWorkProcessScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      case "Напряженность турдового процесса":
        title = IntensityWorkProcessScreen(
          protocolName: protocolNameList?[index],
        );
        break;
      default:
        title = PrimaryProtocolScreen(
          protocolName: protocolNameList?[index],
        );
    }
    return title;
  }

  Widget _floatingButton(context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
        child: Container(
            width: 40.0, // Установите ширину круга
            height: 40.0, // Установите высоту круга
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.withOpacity(0.7), // Полупрозрачный красный фон
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Цвет тени
                  blurRadius: 10.0, // Размытие тени
                  spreadRadius: 2.0, // Расширение тени
                  offset: Offset(0, 4), // Смещение тени
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddProtocolNameDialog(
                      workplace: workplaceName,
                      organization: organization,
                    );
                  },
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              iconSize: 20.0, // Размер иконк
            )));
  }

  Widget _buildListItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent, // Цвет фона карточки
          borderRadius: BorderRadius.circular(12), // Овальные углы
        ),
        padding: const EdgeInsets.all(16.0), // Отступы внутри карточки
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Заголовок с подчеркиванием
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.underline, // Подчеркивание
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
