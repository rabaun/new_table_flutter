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
          _floatingButton(context),
        ],
      ),
      body: intensityWorkProcess != null
          ? ListView.builder(
              itemCount: intensityWorkProcess?.length ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // _buildListItem('ИД', intensityWorkProcess?[index].id?.toString()),
                    _buildListItem('Организация',
                        intensityWorkProcess?[index].organizationName ?? ''),
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
                  ],
                );
              })
          : Container(),
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
                return AddIntensityWorkProcessDialog(
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
