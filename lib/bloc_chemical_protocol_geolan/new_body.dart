import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/chemical_protocol_geolan_model/chemical_protocol_geolan_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_chemical_protocol_geolan.dart';
import 'chemical_protocol_geolan_dialog.dart';
import 'chemical_protocol_geolan_event.dart';

class NewChemicalProtocolGeolanBody extends StatelessWidget {
  const NewChemicalProtocolGeolanBody(
      {super.key, required this.chemicalProtocolGeolan, required this.protocolNameModel});

  final List<ChemicalProtocolGeolanModel>? chemicalProtocolGeolan;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChemicalProtocolGeolanBloc>(context).add(ChemicalProtocolGeolanEvent.getProtocol(
        protocolName: protocolNameModel, workplaceName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по шуму")),
        centerTitle: true, // this is all you need
        actions: [
          chemicalProtocolGeolan != null && chemicalProtocolGeolan!.isEmpty
              ? _floatingButton(context)
              : Container(),
        ],
      ),
      body: ListView.builder(
          itemCount: chemicalProtocolGeolan?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // _buildListItem('ИД', chemicalProtocolGeolan?[index].id?.toString()),
                _buildListItem('Организация', chemicalProtocolGeolan?[index].organizationName),
                // _buildListItem('ИД организации', chemicalProtocolGeolan?[index].organizationId),
                _buildListItem('Дата измерения', chemicalProtocolGeolan?[index].measurementDate),
                _buildListItem('Рабочее место', chemicalProtocolGeolan?[index].workplace),
                // _buildListItem('ИД места работы', chemicalProtocolGeolan?[index].workplaceId),
                _buildListItem('Фамилия работника', chemicalProtocolGeolan?[index].familyName),
                _buildListItem('Название параметра', chemicalProtocolGeolan?[index].parameterName),
                _buildListItem('Значение концентрации №1', chemicalProtocolGeolan?[index].parameterValue),
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
              return AddChemicalProtocolGeolanDialog(
                chemicalProtocolGeolan: chemicalProtocolGeolan?[index],
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
                return AddChemicalProtocolGeolanDialog(
                  protocolName: protocolNameModel,
                );
              },
            );
          },
          icon: const Icon(Icons.add, color: Colors.black),
        ));
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
