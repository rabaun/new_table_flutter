import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/local_vibration_protocol_model/local_vibration_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_local_vibration_protocol.dart';
import 'local_vibration_protocol_dialog.dart';
import 'local_vibration_protocol_event.dart';

class NewLocalVibrationProtocolBody extends StatelessWidget {
  const NewLocalVibrationProtocolBody(
      {super.key, required this.localVibrationProtocol, required this.protocolNameModel});

  final List<LocalVibrationProtocolModel>? localVibrationProtocol;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocalVibrationProtocolBloc>(context)
        .add(LocalVibrationProtocolEvent.getOrganization(protocolName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по общей вибрации")),
        centerTitle: true, // this is all you need
        actions: [
          localVibrationProtocol != null && localVibrationProtocol!.isEmpty
              ? _floatingButton(context)
              : Container(),
        ],
      ),
      body: ListView.builder(
          itemCount: localVibrationProtocol?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // _buildListItem('ИД', localVibrationProtocol?[index].id?.toString()),
                _buildListItem('Организация', localVibrationProtocol?[index].organizationName),
                // _buildListItem('ИД организации', localVibrationProtocol?[index].organizationId),
                _buildListItem('Дата измерения', localVibrationProtocol?[index].measurementDate),
                _buildListItem('Место работы', localVibrationProtocol?[index].workplace),
                // _buildListItem('ИД места работы', localVibrationProtocol?[index].workplaceId),
                _buildListItem('Название параметра', localVibrationProtocol?[index].parameterName),
                _buildListItem('Фамилия работника', localVibrationProtocol?[index].familyName),

                _buildListItem('Вибрация по X №1', localVibrationProtocol?[index].correctedLevelX1),
                _buildListItem('Вибрация по X №2', localVibrationProtocol?[index].correctedLevelX2),
                _buildListItem('Вибрация по X №3', localVibrationProtocol?[index].correctedLevelX3),
                _buildListItem('Среднее значение вибрация по X',
                    localVibrationProtocol?[index].averageCorrectedLevelX),

                _buildListItem('Вибрация по Y №1', localVibrationProtocol?[index].correctedLevelY1),
                _buildListItem('Вибрация по Y №2', localVibrationProtocol?[index].correctedLevelY2),
                _buildListItem('Вибрация по Y №3', localVibrationProtocol?[index].correctedLevelY3),
                _buildListItem('Среднее значение вибрация по Y',
                    localVibrationProtocol?[index].averageCorrectedLevelY),

                _buildListItem('Вибрация по Z №1', localVibrationProtocol?[index].correctedLevelZ1),
                _buildListItem('Вибрация по Z №2', localVibrationProtocol?[index].correctedLevelZ2),
                _buildListItem('Вибрация по Z №3', localVibrationProtocol?[index].correctedLevelZ3),
                _buildListItem('Среднее значение вибрация по Z',
                    localVibrationProtocol?[index].averageCorrectedLevelZ),

                updateButton(context, index)
              ],
            );
          }),
      // floatingActionButton: _floatingButton(context),
    );
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
                    return AddLocalVibrationProtocolDialog(
                      protocolName: protocolNameModel,
                    );
                  },
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              iconSize: 20.0, // Размер иконк
            )));
  }

  Widget updateButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddLocalVibrationProtocolDialog(
                localVibrationProtocol: localVibrationProtocol?[index],
                protocolName: protocolNameModel,
              );
            },
          );
        },
        icon: const Icon(Icons.edit, color: Colors.white), // Иконка
        label: const Text("Редактировать", style: TextStyle(color: Colors.white)), // Текст
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Цвет фона кнопки
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Отступы
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Закругленные углы
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String? value) {
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
            // Значение
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white, // Цвет фона для значения
                borderRadius: BorderRadius.circular(8), // Овальные углы
              ),
              child: Text(
                value ?? 'N/A',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal, // Жирный текст
                  fontSize: 18, // Увеличенный размер шрифта
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
