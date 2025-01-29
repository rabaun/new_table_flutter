import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/microclimate_protocol_model/microclimate_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_microclimate_protocol.dart';
import 'microclimate_protocol_dialog.dart';
import 'microclimate_protocol_event.dart';

class NewMicroclimateProtocolBody extends StatelessWidget {
  const NewMicroclimateProtocolBody(
      {super.key, required this.microclimate, required this.protocolNameModel});

  final List<MicroclimateProtocolModel>? microclimate;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MicroclimateProtocolBloc>(context)
        .add(MicroclimateEvent.getOrganization(protocolName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по микроклимату")),
        centerTitle: true, // this is all you need
        actions: [

        ],
      ),
      body:ListView.builder(
          itemCount: microclimate?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // _buildListItem('ИД', microclimate?[index].id?.toString()),
                _buildListItem('Организация', microclimate?[index].organizationName),
                // _buildListItem('ИД организации', microclimate?[index].organizationId),
                _buildListItem('Дата измерения', microclimate?[index].measurementDate),
                _buildListItem('Рабочее место', microclimate?[index].workplace),
                // _buildListItem('ИД места работы', microclimate?[index].workplaceId),
                _buildListItem('Название параметра', microclimate?[index].parameterName),
                _buildListItem('Температура на высоте 0,1м', microclimate?[index].airTemperature01m),
                _buildListItem('Температура на высоте 1,5м', microclimate?[index].airTemperature15m),
                _buildListItem('Значение ТНС на высоте 0,1м', microclimate?[index].tncIndex01m),
                _buildListItem('Значение ТНС на высоте 1,5м', microclimate?[index].tncIndex15m),
                _buildListItem('Значение W потока на высоте 0,1м', microclimate?[index].airVelocity01m),
                _buildListItem('Значение W потока на высоте 1,5м', microclimate?[index].airVelocity15m),
                _buildListItem('Значение влажности воздуха', microclimate?[index].relativeHumidity),
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
              return AddMicroclimateDialog(
                microclimate: microclimate?[index],
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