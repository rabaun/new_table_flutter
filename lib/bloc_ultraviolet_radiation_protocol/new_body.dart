import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_table_flutter/bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_dialog.dart';
import 'package:new_table_flutter/bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_event.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';
import 'bloc_ultraviolet_radiation_protocol.dart';

class NewUltravioletRadiationProtocolBody extends StatelessWidget {
  const NewUltravioletRadiationProtocolBody(
      {super.key, required this.ultravioletRadiation, required this.protocolNameModel});

  final List<UltravioletRadiationProtocolModel>? ultravioletRadiation;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UltravioletRadiationProtocolBloc>(context)
        .add(UltravioletRadiationProtocolEvent.getOrganization(protocolName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по УФ-излучению")),
        centerTitle: true, // this is all you need
        actions: [
          ultravioletRadiation != null && ultravioletRadiation!.isEmpty
              ? _floatingButton(context)
              : Container(),
        ],
      ),
      body:ListView.builder(
          itemCount: ultravioletRadiation?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // _buildListItem('ИД', ultravioletRadiation?[index].id?.toString()),
                _buildListItem('Организация', ultravioletRadiation?[index].organizationName),
                // _buildListItem('ИД организации', ultravioletRadiation?[index].organizationId),
                _buildListItem('Дата измерения', ultravioletRadiation?[index].measurementDate),
                _buildListItem('Место работы', ultravioletRadiation?[index].workplace),
                // _buildListItem('ИД места работы', ultravioletRadiation?[index].workplaceId),
                _buildListItem('Название параметра', ultravioletRadiation?[index].parameterName),
                _buildListItem('Фамилия работника', ultravioletRadiation?[index].familyName),

                _buildListItem('Ф-А излучение на высоте 0.5 - 1.0м №1', ultravioletRadiation?[index].uvAIntensityH05_101),
                _buildListItem('Ф-А излучение на высоте 0.5 - 1.0м №2', ultravioletRadiation?[index].uvAIntensityH05_102),
                _buildListItem('Ф-А излучение на высоте 0.5 - 1.0м №3', ultravioletRadiation?[index].uvAIntensityH05_103),
                _buildListItem('Среденее значение УФ-А излучение на высоте 0.5 - 1.0м', ultravioletRadiation?[index].averageUvAIntensityH05_10),

                _buildListItem('УФ-А излучение на высоте 1.5м №1', ultravioletRadiation?[index].uvAIntensityH151),
                _buildListItem('УФ-А излучение на высоте 1.5м №2', ultravioletRadiation?[index].uvAIntensityH152),
                _buildListItem('УФ-А излучение на высоте 1.5м №3', ultravioletRadiation?[index].uvAIntensityH153),
                _buildListItem('Среднее значение УФ-А излучение на высоте 1.5м', ultravioletRadiation?[index].averageUvAIntensityH15),

                _buildListItem('УФ-В излучение на высоте 0.5 - 1.0м №1', ultravioletRadiation?[index].uvBIntensityH05_101),
                _buildListItem('УФ-В излучение на высоте 0.5 - 1.0м №2', ultravioletRadiation?[index].uvBIntensityH05_102),
                _buildListItem('УФ-В излучение на высоте 0.5 - 1.0м №3', ultravioletRadiation?[index].uvBIntensityH05_103),
                _buildListItem('Среднее значение УФ-В излучение на высоте 0.5 - 1.0м', ultravioletRadiation?[index].averageUvBIntensityH05_10),

                _buildListItem('УФ-В излучение на высоте 1.5м №1', ultravioletRadiation?[index].uvBIntensityH151),
                _buildListItem('УФ-В излучение на высоте 1.5м №2', ultravioletRadiation?[index].uvBIntensityH152),
                _buildListItem('УФ-В излучение на высоте 1.5м №3', ultravioletRadiation?[index].uvBIntensityH153),
                _buildListItem('Среднее значение УФ-В излучение на высоте 1.5м', ultravioletRadiation?[index].averageUvBIntensityH15),

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
              return AddUltravioletRadiationProtocolDialog(
                ultravioletRadiation: ultravioletRadiation?[index],
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
                return AddUltravioletRadiationProtocolDialog(
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