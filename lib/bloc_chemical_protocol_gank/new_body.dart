import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/chemical_protocol_gank_model/chemical_protocol_gank_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_chemical_protocol_gank.dart';
import 'chemical_protocol_gank_dialog.dart';
import 'chemical_protocol_gank_event.dart';

class NewChemicalProtocolGankBody extends StatelessWidget {
  const NewChemicalProtocolGankBody(
      {super.key, required this.chemicalProtocolGankList, required this.protocolNameModel});

  final List<ChemicalProtocolGankModel>? chemicalProtocolGankList;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChemicalProtocolGankBloc>(context)
        .add(ChemicalProtocolGankEvent.getProtocol(protocolName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по общей вибрации")),
        centerTitle: true, // this is all you need
        actions: [
          chemicalProtocolGankList != null && chemicalProtocolGankList!.isEmpty
              ? _floatingButton(context)
              : Container(),          ],
      ),
      body:ListView.builder(
          itemCount: chemicalProtocolGankList?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // _buildListItem('ИД', chemicalProtocolGankList?[index].id?.toString()),
                _buildListItem('Организация', chemicalProtocolGankList?[index].organizationName),
                // _buildListItem('ИД организации', chemicalProtocolGankList?[index].organizationId),
                _buildListItem('Дата измерения', chemicalProtocolGankList?[index].measurementDate),
                _buildListItem('Место работы', chemicalProtocolGankList?[index].workplace),
                // _buildListItem('ИД места работы', chemicalProtocolGankList?[index].workplaceId),
                _buildListItem('Название параметра', chemicalProtocolGankList?[index].parameterName),
                _buildListItem('Фамилия работника', chemicalProtocolGankList?[index].familyName),
                _buildListItem('Значение первой серии', chemicalProtocolGankList?[index].concentration1_1),
                _buildListItem('Значение второй серии', chemicalProtocolGankList?[index].concentration2_1),
                _buildListItem('Среднее значение', chemicalProtocolGankList?[index].averageConcentration),
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
              return AddChemicalProtocolGankDialog(
                chemicalProtocolGankList: chemicalProtocolGankList?[index],
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
                return AddChemicalProtocolGankDialog(
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