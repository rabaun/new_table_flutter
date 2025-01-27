import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_table_flutter/bloc_severity_work_process_protocol/severity_work_process_dialog.dart';
import 'package:new_table_flutter/bloc_severity_work_process_protocol/severity_work_process_event.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/severity_work_process_model/severity_work_process_model.dart';
import 'bloc_severity_work_process_protocol.dart';

class SeverityWorkProcessBody extends StatelessWidget {
  const SeverityWorkProcessBody(
      {super.key, required this.severityWorkProcessList, required this.protocolNameModel});

  final List<SeverityWorkProcessModel>? severityWorkProcessList;
  final ProtocolNameModel? protocolNameModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SeverityWorkProcessBloc>(context)
        .add(SeverityWorkProcessEvent.getProtocol(protocolName: protocolNameModel));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(child: Text("Первичный протокол по Тяжести трудового процесса")),
        centerTitle: true, // this is all you need
      actions: [
        _floatingButton(context),
      ],
    ),
    body:ListView.builder(
        itemCount: severityWorkProcessList?.length ?? 0,
        itemBuilder: (context, index) {
          return Column(
            children: [
              // _buildListItem('ИД', severityWorkProcessList?[index].id?.toString()),
              _buildListItem('Организация', severityWorkProcessList?[index].organizationName),
              // _buildListItem('ИД организации', severityWorkProcessList?[index].organizationId),
              _buildListItem('Дата измерения', severityWorkProcessList?[index].measurementDate),
              _buildListItem('Место работы', severityWorkProcessList?[index].workplace),
              // _buildListItem('ИД места работы', severityWorkProcessList?[index].workplaceId),
              _buildListItem('Параметр', severityWorkProcessList?[index].parameterName),
              _buildListItem('Масса до 1м (кг)', severityWorkProcessList?[index].massUpTo1mKg),
              _buildListItem('Расстояние до 1м (м)', severityWorkProcessList?[index].distanceUpTo1mM),
              _buildListItem('Кол. движений до 1м', severityWorkProcessList?[index].movementCountUpTo1m),
              _buildListItem('Масса от 1 до 5м (кг)', severityWorkProcessList?[index].mass1To5mKg),
              _buildListItem('Расстояние от 1 до 5м (м)', severityWorkProcessList?[index].distance1To5mM),
              _buildListItem('Кол. движений от 1 до 5м', severityWorkProcessList?[index].movementCount1To5m),
              _buildListItem('Масса более 5м (кг)', severityWorkProcessList?[index].massMoreThan5mKg),
              _buildListItem('Расстояние более 5м (м)', severityWorkProcessList?[index].distanceMoreThan5mM),
              _buildListItem('Кол. движений более 5м', severityWorkProcessList?[index].movementCountMoreThan5m),
              _buildListItem('Подъем переменной массы (кг)', severityWorkProcessList?[index].liftingIntermittentMassKg),
              _buildListItem('Кол. движений с переменной массой', severityWorkProcessList?[index].liftingIntermittentMovementCount),
              _buildListItem('Подъем постоянной массы (кг)', severityWorkProcessList?[index].liftingConstantMassKg),
              _buildListItem('Кол. движений с постоянной массой', severityWorkProcessList?[index].liftingConstantMovementCount),
              _buildListItem('Подъем массы с поверхности (кг)', severityWorkProcessList?[index].liftingFromSurfaceMassKg),
              _buildListItem('Кол. движений с подъемом с поверхности', severityWorkProcessList?[index].liftingFromSurfaceMovementCount),
              _buildListItem('Подъем массы с пола (кг)', severityWorkProcessList?[index].liftingFromFloorMassKg),
              _buildListItem('Кол. движений с подъемом с пола', severityWorkProcessList?[index].liftingFromFloorMovementCount),
              _buildListItem('Стер. лок. движение за операцию', severityWorkProcessList?[index].stereotypicalLocalMovementPerOperation),
              _buildListItem('Кол. стер. локальных операций', severityWorkProcessList?[index].stereotypicalLocalOperationCount),
              _buildListItem('Стер. рег. движение за операцию', severityWorkProcessList?[index].stereotypicalRegionalMovementPerOperation),
              _buildListItem('Кол. стер. региональных операций', severityWorkProcessList?[index].stereotypicalRegionalOperationCount),
              _buildListItem('Стат. нагрузка 1-ой рукой (кг)', severityWorkProcessList?[index].staticLoadOneHandMassKg),
              _buildListItem('Время уд. стат. нагр. 1-ой рукой (с)', severityWorkProcessList?[index].staticLoadOneHandHoldingTimeS),
              _buildListItem('Кол. опер. со стат. нагр. 1-ой рукой', severityWorkProcessList?[index].staticLoadOneHandOperationCount),// тут
              _buildListItem('Стат. нагрузка 2-мя руками (кг)', severityWorkProcessList?[index].staticLoadTwoHandsOperationCount),
              _buildListItem('Стат. нагрузка 2-мя руками (кг)', severityWorkProcessList?[index].staticLoadTwoHandsMassKg),
              _buildListItem('Время уд. стат. нагр. двумя руками (с)', severityWorkProcessList?[index].staticLoadTwoHandsHoldingTimeS),
              _buildListItem('Кол. опер. со стат. нагр. 2-мя руками', severityWorkProcessList?[index].staticLoadTwoHandsOperationCount),
              _buildListItem('Стат. нагрузка тела и ног (кг)', severityWorkProcessList?[index].staticLoadBodyAndLegsMassKg),
              _buildListItem('Время уд. стат. нагр. тела и ног (с)', severityWorkProcessList?[index].staticLoadBodyAndLegsHoldingTimeS),
              _buildListItem('Кол. опер. со стат. нагр. тела и ног', severityWorkProcessList?[index].staticLoadBodyAndLegsOperationCount),
              _buildListItem('Процент свободной позы', severityWorkProcessList?[index].freePosturePercentage),
              _buildListItem('Процент стоячей позы', severityWorkProcessList?[index].standingPosturePercentage),
              _buildListItem('Процент неудобной позы', severityWorkProcessList?[index].uncomfortablePosturePercentage),
              _buildListItem('Процент фиксированной позы', severityWorkProcessList?[index].fixedPosturePercentage),
              _buildListItem('Процент вынужденной позы', severityWorkProcessList?[index].forcedPosturePercentage),
              _buildListItem('Процент сидячей позы', severityWorkProcessList?[index].sittingPosturePercentage),
              _buildListItem('Наклоны за операцию', severityWorkProcessList?[index].tiltsPerOperation),
              _buildListItem('Кол. операций с наклонами', severityWorkProcessList?[index].tiltsOperationCount),
              _buildListItem('Гор. расстояние перемещения (км)', severityWorkProcessList?[index].horizontalMovementDistanceKm),
              _buildListItem('Гор. расстояние перемещения (км)', severityWorkProcessList?[index].horizontalMovementDistancePerMoveM),//Что за движение
              _buildListItem('Кол. горизонтальных перемещений', severityWorkProcessList?[index].horizontalMovementCount),
              _buildListItem('Верт. расстояние перемещения (км)', severityWorkProcessList?[index].verticalMovementDistanceKm),
              _buildListItem('Верт. расстояние перемещения (км)', severityWorkProcessList?[index].verticalMovementDistancePerMoveM), //Что за движение
              _buildListItem('Кол. вертикальных перемещений', severityWorkProcessList?[index].verticalMovementCount),

            ],
          );
        }),
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
                return AddSeverityWorkProcessDialog(
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
