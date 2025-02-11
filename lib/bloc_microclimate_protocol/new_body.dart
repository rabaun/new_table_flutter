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
          if (microclimate != null && microclimate!.isEmpty) _floatingButton(context),
        ],
      ),
      body: ListView.builder(
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

                // Измерения на высоте 0,1м
                _buildListItem('Температура на высоте 0,1м (1)', microclimate?[index].airTemperature01m1),
                _buildListItem('Температура на высоте 0,1м (2)', microclimate?[index].airTemperature01m2),
                _buildListItem('Температура на высоте 0,1м (3)', microclimate?[index].airTemperature01m3),
                _buildListItem('Средняя температура на высоте 0,1м', microclimate?[index].averageAirTemperature01m),

                // Измерения на высоте 1,5м
                _buildListItem('Температура на высоте 1,5м (1)', microclimate?[index].airTemperature15m1),
                _buildListItem('Температура на высоте 1,5м (2)', microclimate?[index].airTemperature15m2),
                _buildListItem('Температура на высоте 1,5м (3)', microclimate?[index].airTemperature15m3),
                _buildListItem('Средняя температура на высоте 1,5м', microclimate?[index].averageAirTemperature15m),

                // Значения ТНС на высоте 0,1м
                _buildListItem('Значение ТНС на высоте 0,1м (1)', microclimate?[index].tncIndex01m1),
                _buildListItem('Значение ТНС на высоте 0,1м (2)', microclimate?[index].tncIndex01m2),
                _buildListItem('Значение ТНС на высоте 0,1м (3)', microclimate?[index].tncIndex01m3),
                _buildListItem('Среднее значение ТНС на высоте 0,1м', microclimate?[index].averageTncIndex01m),

                // Значения ТНС на высоте 1,5м
                _buildListItem('Значение ТНС на высоте 1,5м (1)', microclimate?[index].tncIndex15m1),
                _buildListItem('Значение ТНС на высоте 1,5м (2)', microclimate?[index].tncIndex15m2),
                _buildListItem('Значение ТНС на высоте 1,5м (3)', microclimate?[index].tncIndex15m3),
                _buildListItem('Среднее значение ТНС на высоте 1,5м', microclimate?[index].averageTncIndex15m),

                // Значения W потока на высоте 0,1м
                _buildListItem('Значение W потока на высоте 0,1м (1)', microclimate?[index].airVelocity01m1),
                _buildListItem('Значение W потока на высоте 0,1м (2)', microclimate?[index].airVelocity01m2),
                _buildListItem('Значение W потока на высоте 0,1м (3)', microclimate?[index].airVelocity01m3),
                _buildListItem('Среднее значение W потока на высоте 0,1м', microclimate?[index].averageAirVelocity01m),

                // Значения W потока на высоте 1,5м
                _buildListItem('Значение W потока на высоте 1,5м (1)', microclimate?[index].airVelocity15m1),
                _buildListItem('Значение W потока на высоте 1,5м (2)', microclimate?[index].airVelocity15m2),
                _buildListItem('Значение W потока на высоте 1,5м (3)', microclimate?[index].airVelocity15m3),
                _buildListItem('Среднее значение W потока на высоте 1,5м', microclimate?[index].averageAirVelocity15m),

                // Значения влажности
                _buildListItem('Влажность воздуха (1)', microclimate?[index].relativeHumidity1),
                _buildListItem('Влажность воздуха (2)', microclimate?[index].relativeHumidity2),
                _buildListItem('Влажность воздуха (3)', microclimate?[index].relativeHumidity3),
                _buildListItem('Средняя влажность воздуха', microclimate?[index].averageRelativeHumidity),

                _buildListItem('Интенсивность теплового излучения (h-0,5 м), Вт/м2 №1', microclimate?[index].thermalRadiationIntensity05m1),
                _buildListItem('Интенсивность теплового излучения (h-0,5 м), Вт/м2 №2', microclimate?[index].thermalRadiationIntensity05m2),
                _buildListItem('Интенсивность теплового излучения (h-0,5 м), Вт/м2 №3', microclimate?[index].thermalRadiationIntensity05m3),
                _buildListItem('Среднее значение интенсивность теплового излучения (h-0,5 м)', microclimate?[index].averageThermalRadiationIntensity05m),

                _buildListItem('Интенсивность теплового излучения (h-1,0 м), Вт/м2 №1', microclimate?[index].thermalRadiationIntensity1m1),
                _buildListItem('Интенсивность теплового излучения (h-1,0 м), Вт/м2 №2', microclimate?[index].thermalRadiationIntensity1m2),
                _buildListItem('Интенсивность теплового излучения (h-1,0 м), Вт/м2 №3', microclimate?[index].thermalRadiationIntensity1m3),
                _buildListItem('Среднее значение интенсивность теплового излучения (h-1,0 м)', microclimate?[index].averageThermalRadiationIntensity05m),

                _buildListItem('Интенсивность теплового излучения (h-1,5 м), Вт/м2 №1', microclimate?[index].thermalRadiationIntensity15m1),
                _buildListItem('Интенсивность теплового излучения (h-1,5 м), Вт/м2 №2', microclimate?[index].thermalRadiationIntensity15m2),
                _buildListItem('Интенсивность теплового излучения (h-1,5 м), Вт/м2 №3', microclimate?[index].thermalRadiationIntensity15m3),
                _buildListItem('Среднее значение интенсивность теплового излучения (h-1,5 м)', microclimate?[index].averageThermalRadiationIntensity15m),

                _buildListItem('Экспозиционная доза теплового излучения, Вт·ч №1', microclimate?[index].thermalRadiationExposureDose1),
                _buildListItem('Экспозиционная доза теплового излучения, Вт·ч №2', microclimate?[index].thermalRadiationExposureDose2),
                _buildListItem('Экспозиционная доза теплового излучения, Вт·ч №3', microclimate?[index].thermalRadiationExposureDose3),
                _buildListItem('Среднее значение экспозиционной дозы теплового излучения, Вт·ч', microclimate?[index].averageThermalRadiationExposureDose),

                updateButton(context, index)
              ],
            );
          }
      ),
      // floatingActionButton: _floatingButton(context),
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
                return AddMicroclimateDialog(
                  protocolName: protocolNameModel,
                );
              },
            );
          },
          icon: const Icon(Icons.add, color: Colors.black),
        )
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