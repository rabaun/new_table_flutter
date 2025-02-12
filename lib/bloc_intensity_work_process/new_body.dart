import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/intensity_work_process_model/intensity_work_process_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_intensity_work_process.dart';
import 'intensity_work_process_dialog.dart';
import 'intensity_work_process_event.dart';

class IntensityWorkProcessBody extends StatelessWidget {
  const IntensityWorkProcessBody(
      {super.key, required this.intensityWorkProcess, required this.protocolNameModel});

  final List<IntensityWorkProcessModel>? intensityWorkProcess;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<IntensityWorkProcessBloc>(context)
        .add(IntensityWorkProcessEvent.getOrganization(protocolName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по напряженности трудового процесса")),
        centerTitle: true, // this is all you need
        actions: [
          intensityWorkProcess != null && intensityWorkProcess!.isEmpty
              ? _floatingButton(context)
              : Container(),
        ],
      ),
      body: intensityWorkProcess != null
          ? ListView.builder(
              itemCount: intensityWorkProcess?.length ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // _buildListItem('ИД', intensityWorkProcess?[index].id?.toString()),
                    _buildListItem(
                        'Организация', intensityWorkProcess?[index].organizationName ?? ''),
                    // _buildListItem('ИД организации', intensityWorkProcess?[index].organizationId),
                    _buildListItem(
                        'Дата измерения', intensityWorkProcess?[index].measurementDate ?? ''),
                    _buildListItem('Место работы', intensityWorkProcess?[index].workplace ?? ''),
                    // _buildListItem('ИД места работы', intensityWorkProcess?[index].workplaceId),
                    _buildListItem('П.', intensityWorkProcess?[index].parameterName ?? ''),
                    _buildListItem('Плотность сигналов и сообщений',
                        intensityWorkProcess?[index].signalDensity ?? ''),
                    _buildListItem('Число пр. об., наблюдаемых одновр.',
                        intensityWorkProcess?[index].simultaneousObjectsCount ?? ''),
                    _buildListItem('% вр. использ. опт. приборов',
                        intensityWorkProcess?[index].opticalDeviceUsage ?? ''),
                    _buildListItem('Нагр. на голос. аппарат (сумм. ч. в нед.)',
                        intensityWorkProcess?[index].voiceApparatusLoadHours ?? ''),
                    _buildListItem('Нагр. на слуховой анализатор',
                        intensityWorkProcess?[index].auditoryAnalyzerLoad ?? ''),
                    _buildListItem('Длит. сосред. наблюд. (в % от вр. смены)',
                        intensityWorkProcess?[index].focusedObservationDuration ?? ''),
                    _buildListItem('Уровень монотонности нагрузок',
                        intensityWorkProcess?[index].monotonyLoads ?? ''),
                    _buildListItem('Число эл., необ. для выпол. задания',
                        intensityWorkProcess?[index].elementsCount ?? ''),
                    _buildListItem('Уровень монот. пр. обстановки',
                        intensityWorkProcess?[index].monotonyEnvironment ?? ''),
                    _buildListItem('Время акт. наблюд. за ход. пр. процесса ',
                        intensityWorkProcess?[index].activeObservationTime ?? ''),
                    updateButton(context, index)
                  ],
                );
              })
          : Container(),
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
              return AddIntensityWorkProcessDialog(
                intensityWorkProcess: intensityWorkProcess?[index],
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
                    return AddIntensityWorkProcessDialog(
                      protocolName: protocolNameModel,
                    );
                  },
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              iconSize: 20.0, // Размер иконк
            )));
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
