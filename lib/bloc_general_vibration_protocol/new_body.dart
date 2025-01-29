import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/general_vibration_protocol_model/general_vibration_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_general_vibration_protocol.dart';
import 'general_vibration_protocol_dialog.dart';
import 'general_vibration_protocol_event.dart';

class NewGeneralVibrationProtocolBody extends StatelessWidget {
  const NewGeneralVibrationProtocolBody(
      {super.key, required this.generalVibrationProtocol, required this.protocolNameModel});

  final List<GeneralVibrationProtocolModel>? generalVibrationProtocol;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GeneralVibrationProtocolBloc>(context)
        .add(GeneralVibrationProtocolEvent.getOrganization(protocolName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по общей вибрации")),
        centerTitle: true, // this is all you need
        actions: [
          generalVibrationProtocol != null && generalVibrationProtocol!.isEmpty
              ? _floatingButton(context)
              : Container(),          ],
      ),
      body:ListView.builder(
          itemCount: generalVibrationProtocol?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // _buildListItem('ИД', generalVibrationProtocol?[index].id?.toString()),
                _buildListItem('Организация', generalVibrationProtocol?[index].organizationName),
                // _buildListItem('ИД организации', generalVibrationProtocol?[index].organizationId),
                _buildListItem('Дата измерения', generalVibrationProtocol?[index].measurementDate),
                _buildListItem('Место работы', generalVibrationProtocol?[index].workplace),
                // _buildListItem('ИД места работы', generalVibrationProtocol?[index].workplaceId),
                _buildListItem('Название параметра', generalVibrationProtocol?[index].parameterName),
                _buildListItem('Вибрация по X', generalVibrationProtocol?[index].correctedLevelX),
                _buildListItem('Вибрация по Y', generalVibrationProtocol?[index].correctedLevelY),
                _buildListItem('Вибрация по Z', generalVibrationProtocol?[index].correctedLevelZ),
                updateButton(context, index)
              ],
            );
          }),
      // floatingActionButton: _floatingButton(context),
    );
  }

  Widget updateButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddGeneralVibrationProtocolDialog(
                generalVibrationProtocol: generalVibrationProtocol?[index],
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

  Widget _floatingButton(context) {
    return Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddGeneralVibrationProtocolDialog(
                  protocolName: protocolNameModel,
                );
              },
            );
          },
          icon: const Icon(Icons.add, color: Colors.black),
        )
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