import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_table_flutter/bloc_severity_work_process_protocol/severity_work_process_event.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/severity_work_process_model/severity_work_process_model.dart';
import 'bloc_severity_work_process_protocol.dart';

class AddSeverityWorkProcessDialog extends StatefulWidget {
  const AddSeverityWorkProcessDialog(
      {super.key, this.severityWorkProcess, required this.protocolName});

  final SeverityWorkProcessModel? severityWorkProcess;
  final ProtocolNameModel? protocolName;

  @override
  State<AddSeverityWorkProcessDialog> createState() => _AddSeverityWorkProcessDialogState();
}

class _AddSeverityWorkProcessDialogState extends State<AddSeverityWorkProcessDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final parameterNameController = TextEditingController();
  final protocolIdController = TextEditingController();
  final familyNameController = TextEditingController();

  // Контроллеры для перемещения груза на расстояние до 1 м
  late TextEditingController massUpTo1mKgController;
  late TextEditingController distanceUpTo1mMController;
  late TextEditingController movementCountUpTo1mController;

  // Контроллеры для перемещения груза на расстояние от 1 до 5 м
  late TextEditingController mass1To5mKgController;
  late TextEditingController distance1To5mMController;
  late TextEditingController movementCount1To5mController;

  // Контроллеры для перемещения груза на расстояние более 5 м
  late TextEditingController massMoreThan5mKgController;
  late TextEditingController distanceMoreThan5mMController;
  late TextEditingController movementCountMoreThan5mController;

  // Контроллеры для подъема и перемещения (разовое)
  late TextEditingController liftingIntermittentMassKgController;
  late TextEditingController liftingIntermittentMovementCountController;

  // Контроллеры для подъема и перемещения тяжести постоянно
  late TextEditingController liftingConstantMassKgController;
  late TextEditingController liftingConstantMovementCountController;

  // Контроллеры для подъема с рабочей поверхности
  late TextEditingController liftingFromSurfaceMassKgController;
  late TextEditingController liftingFromSurfaceMovementCountController;

  // Контроллеры для подъема с пола
  late TextEditingController liftingFromFloorMassKgController;
  late TextEditingController liftingFromFloorMovementCountController;

  // Контроллеры для стереотипных рабочих движений при локальной нагрузке
  late TextEditingController stereotypicalLocalMovementPerOperationController;
  late TextEditingController stereotypicalLocalOperationCountController;

  // Контроллеры для стереотипных рабочих движений при региональной нагрузке
  late TextEditingController stereotypicalRegionalMovementPerOperationController;
  late TextEditingController stereotypicalRegionalOperationCountController;

  // Контроллеры для статической нагрузки (одной рукой)
  late TextEditingController staticLoadOneHandMassKgController;
  late TextEditingController staticLoadOneHandHoldingTimeSController;
  late TextEditingController staticLoadOneHandOperationCountController;

  // Контроллеры для статической нагрузки (двумя руками)
  late TextEditingController staticLoadTwoHandsMassKgController;
  late TextEditingController staticLoadTwoHandsHoldingTimeSController;
  late TextEditingController staticLoadTwoHandsOperationCountController;

  // Контроллеры для статической нагрузки (с участием мышц корпуса и ног)
  late TextEditingController staticLoadBodyAndLegsMassKgController;
  late TextEditingController staticLoadBodyAndLegsHoldingTimeSController;
  late TextEditingController staticLoadBodyAndLegsOperationCountController;

  // Контроллеры для рабочей позы
  late TextEditingController freePosturePercentageController;
  late TextEditingController standingPosturePercentageController;
  late TextEditingController uncomfortablePosturePercentageController;
  late TextEditingController fixedPosturePercentageController;
  late TextEditingController forcedPosturePercentageController;
  late TextEditingController sittingPosturePercentageController;

  late TextEditingController tiltsPerOperationController;
  late TextEditingController tiltsOperationCountController;

  // Контроллеры для перемещения в пространстве (по горизонтали)
  late TextEditingController horizontalMovementDistanceKmController;
  late TextEditingController horizontalMovementDistancePerMoveMController;
  late TextEditingController horizontalMovementCountController;

  // Контроллеры для перемещения в пространстве (по вертикали)
  late TextEditingController verticalMovementDistanceKmController;
  late TextEditingController verticalMovementDistancePerMoveMController;
  late TextEditingController verticalMovementCountController;

  int? selectedId;
  Color _color = Colors.white; // Исходный цвет

  @override
  void initState() {
    super.initState();
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SeverityWorkProcessBloc>(context)
        .add(SeverityWorkProcessEvent.getProtocol(protocolName: widget.protocolName));
    selectedId = widget.severityWorkProcess?.id;
    organizationNameController.text =
        (widget.severityWorkProcess?.organizationName ?? widget.protocolName?.organizationName)!;
    organizationIdController.text =
        (widget.severityWorkProcess?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text =
        (widget.severityWorkProcess?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
        (widget.severityWorkProcess?.workplaceId ?? widget.protocolName?.workplaceId)!;
    parameterNameController.text =
        (widget.severityWorkProcess?.parameterName ?? widget.protocolName?.protocolName)!;
    // Инициализация контроллеров для перемещения груза на расстояние до 1 м
    massUpTo1mKgController =
        TextEditingController(text: widget.severityWorkProcess?.massUpTo1mKg ?? '');
    distanceUpTo1mMController =
        TextEditingController(text: widget.severityWorkProcess?.distanceUpTo1mM ?? '');
    movementCountUpTo1mController =
        TextEditingController(text: widget.severityWorkProcess?.movementCountUpTo1m ?? '');
    protocolIdController.text = (widget.severityWorkProcess?.protocolId ?? widget.protocolName?.protocolId)!;
    familyNameController.text = widget.severityWorkProcess?.familyName ?? '';

    // Инициализация контроллеров для перемещения груза на расстояние от 1 до 5 м
    mass1To5mKgController =
        TextEditingController(text: widget.severityWorkProcess?.mass1To5mKg ?? '');
    distance1To5mMController =
        TextEditingController(text: widget.severityWorkProcess?.distance1To5mM ?? '');
    movementCount1To5mController =
        TextEditingController(text: widget.severityWorkProcess?.movementCount1To5m ?? '');

    // Инициализация контроллеров для перемещения груза на расстояние более 5 м
    massMoreThan5mKgController =
        TextEditingController(text: widget.severityWorkProcess?.massMoreThan5mKg ?? '');
    distanceMoreThan5mMController =
        TextEditingController(text: widget.severityWorkProcess?.distanceMoreThan5mM ?? '');
    movementCountMoreThan5mController =
        TextEditingController(text: widget.severityWorkProcess?.movementCountMoreThan5m ?? '');

    // Инициализация контроллеров для подъема и перемещения (разовое)
    liftingIntermittentMassKgController =
        TextEditingController(text: widget.severityWorkProcess?.liftingIntermittentMassKg ?? '');
    liftingIntermittentMovementCountController = TextEditingController(
        text: widget.severityWorkProcess?.liftingIntermittentMovementCount ?? '');

    // Инициализация контроллеров для подъема и перемещения тяжести постоянно
    liftingConstantMassKgController =
        TextEditingController(text: widget.severityWorkProcess?.liftingConstantMassKg ?? '');
    liftingConstantMovementCountController =
        TextEditingController(text: widget.severityWorkProcess?.liftingConstantMovementCount ?? '');

    // Инициализация контроллеров для подъема с рабочей поверхности
    liftingFromSurfaceMassKgController =
        TextEditingController(text: widget.severityWorkProcess?.liftingFromSurfaceMassKg ?? '');
    liftingFromSurfaceMovementCountController = TextEditingController(
        text: widget.severityWorkProcess?.liftingFromSurfaceMovementCount ?? '');

    // Инициализация контроллеров для подъема с пола
    liftingFromFloorMassKgController =
        TextEditingController(text: widget.severityWorkProcess?.liftingFromFloorMassKg ?? '');
    liftingFromFloorMovementCountController = TextEditingController(
        text: widget.severityWorkProcess?.liftingFromFloorMovementCount ?? '');

    // Инициализация контроллеров для стереотипных рабочих движений при локальной нагрузке
    stereotypicalLocalMovementPerOperationController = TextEditingController(
        text: widget.severityWorkProcess?.stereotypicalLocalMovementPerOperation ?? '');
    stereotypicalLocalOperationCountController = TextEditingController(
        text: widget.severityWorkProcess?.stereotypicalLocalOperationCount ?? '');

    // Инициализация контроллеров для стереотипных рабочих движений при региональной нагрузке
    stereotypicalRegionalMovementPerOperationController = TextEditingController(
        text: widget.severityWorkProcess?.stereotypicalRegionalMovementPerOperation ?? '');
    stereotypicalRegionalOperationCountController = TextEditingController(
        text: widget.severityWorkProcess?.stereotypicalRegionalOperationCount ?? '');

    // Инициализация контроллеров для статической нагрузки (одной рукой)
    staticLoadOneHandMassKgController =
        TextEditingController(text: widget.severityWorkProcess?.staticLoadOneHandMassKg ?? '');
    staticLoadOneHandHoldingTimeSController = TextEditingController(
        text: widget.severityWorkProcess?.staticLoadOneHandHoldingTimeS ?? '');
    staticLoadOneHandOperationCountController = TextEditingController(
        text: widget.severityWorkProcess?.staticLoadOneHandOperationCount ?? '');

    // Инициализация контроллеров для статической нагрузки (двумя руками)
    staticLoadTwoHandsMassKgController =
        TextEditingController(text: widget.severityWorkProcess?.staticLoadTwoHandsMassKg ?? '');
    staticLoadTwoHandsHoldingTimeSController = TextEditingController(
        text: widget.severityWorkProcess?.staticLoadTwoHandsHoldingTimeS ?? '');
    staticLoadTwoHandsOperationCountController = TextEditingController(
        text: widget.severityWorkProcess?.staticLoadTwoHandsOperationCount ?? '');

    // Инициализация контроллеров для статической нагрузки (с участием мышц корпуса и ног)
    staticLoadBodyAndLegsMassKgController =
        TextEditingController(text: widget.severityWorkProcess?.staticLoadBodyAndLegsMassKg ?? '');
    staticLoadBodyAndLegsHoldingTimeSController = TextEditingController(
        text: widget.severityWorkProcess?.staticLoadBodyAndLegsHoldingTimeS ?? '');
    staticLoadBodyAndLegsOperationCountController = TextEditingController(
        text: widget.severityWorkProcess?.staticLoadBodyAndLegsOperationCount ?? '');

    // Инициализация контроллеров для рабочей позы
    freePosturePercentageController =
        TextEditingController(text: widget.severityWorkProcess?.freePosturePercentage ?? '');
    standingPosturePercentageController =
        TextEditingController(text: widget.severityWorkProcess?.standingPosturePercentage ?? '');
    uncomfortablePosturePercentageController = TextEditingController(
        text: widget.severityWorkProcess?.uncomfortablePosturePercentage ?? '');
    fixedPosturePercentageController =
        TextEditingController(text: widget.severityWorkProcess?.fixedPosturePercentage ?? '');
    forcedPosturePercentageController =
        TextEditingController(text: widget.severityWorkProcess?.forcedPosturePercentage ?? '');
    sittingPosturePercentageController =
        TextEditingController(text: widget.severityWorkProcess?.sittingPosturePercentage ?? '');

    // Инициализация контроллеров для наклонов корпуса
    tiltsPerOperationController =
        TextEditingController(text: widget.severityWorkProcess?.tiltsPerOperation ?? '');
    tiltsOperationCountController =
        TextEditingController(text: widget.severityWorkProcess?.tiltsOperationCount ?? '');

    // Инициализация контроллеров для перемещения в пространстве (по горизонтали)
    horizontalMovementDistanceKmController =
        TextEditingController(text: widget.severityWorkProcess?.horizontalMovementDistanceKm ?? '');
    horizontalMovementDistancePerMoveMController = TextEditingController(
        text: widget.severityWorkProcess?.horizontalMovementDistancePerMoveM ?? '');
    horizontalMovementCountController =
        TextEditingController(text: widget.severityWorkProcess?.horizontalMovementCount ?? '');

    // Инициализация контроллеров для перемещения в пространстве (по вертикали)
    verticalMovementDistanceKmController =
        TextEditingController(text: widget.severityWorkProcess?.verticalMovementDistanceKm ?? '');
    verticalMovementDistancePerMoveMController = TextEditingController(
        text: widget.severityWorkProcess?.verticalMovementDistancePerMoveM ?? '');
    verticalMovementCountController =
        TextEditingController(text: widget.severityWorkProcess?.verticalMovementCount ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Введите данные по протоколу',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: organizationNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Наименование организации',
                      hintText: 'Введите наименование организации',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _color = const Color(0xfff5f5f5); // Генерируем случайный цвет
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _color = Colors.white; // Исходный цвет
                        });
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Выберите дату',
                          hintStyle: TextStyle(color: Colors.transparent),
                        ),
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                            color: _color,
                            // Применяем цвет фона
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                            // Паддинг для лучшего вида
                            child: Text(
                              selectedDate == null
                                  ? 'Выберите дату замеров'
                                  : DateFormat('dd.MM.yyyy').format(selectedDate!),
                              style: const TextStyle(
                                  color: Colors.black87, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: workplaceController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Наименование рабочего места',
                      hintText: 'Введите наименование рабочего места',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: familyNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Фамилия работника',
                      hintText: 'Введите фамилию работника',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: parameterNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Наименование фактора',
                      hintText: 'Введите наименование фактора',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для перемещения груза на расстояние до 1 м
                  TextField(
                    controller: massUpTo1mKgController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Масса (кг) до 1 м',
                      hintText: 'Введите значение перемещаемой массы (кг) до 1 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: distanceUpTo1mMController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Расстояние (м) до 1 м',
                      hintText: 'Введите значение расстояние (м) до 1 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: movementCountUpTo1mController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество перемещений до 1 м',
                      hintText: 'Введите количество перемещений до 1 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для перемещения груза на расстояние от 1 до 5 м
                  TextField(
                    controller: mass1To5mKgController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Масса (кг) от 1 до 5 м',
                      hintText: 'Введите значение перемещаемой массы (кг) от 1 до 5 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: distance1To5mMController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Расстояние (м) от 1 до 5 м',
                      hintText: 'Введите значение расстояние (м) от 1 до 5 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: movementCount1To5mController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество перемещений от 1 до 5 м',
                      hintText: 'Введите количество перемещений от 1 до 5 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для перемещения груза на расстояние более 5 м
                  TextField(
                    controller: massMoreThan5mKgController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Масса (кг) более 5 м',
                      hintText: 'Введите значение перемещаемой массы (кг) более 5 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: distanceMoreThan5mMController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Расстояние (м) более 5 м',
                      hintText: 'Введите значение расстояние (м) более 5 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: movementCountMoreThan5mController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество перемещений более 5 м',
                      hintText: 'Введите количество перемещений более 5 м',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для подъема и перемещения (разовое)
                  TextField(
                    controller: liftingIntermittentMassKgController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Масса (кг) при разовом подъеме',
                      hintText: 'Введите значение массы (кг) при разовом подъеме',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: liftingIntermittentMovementCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество раз при разовом подъеме',
                      hintText: 'Введите количество раз при разовом подъеме',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для подъема и перемещения тяжести постоянно
                  TextField(
                    controller: liftingConstantMassKgController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Масса (кг) при постоянном подъеме',
                      hintText: 'Введите значение массы (кг) при постоянном подъеме',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: liftingConstantMovementCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество раз при постоянном подъеме',
                      hintText: 'Введите количество раз при постоянном подъеме',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для подъема с рабочей поверхности
                  TextField(
                    controller: liftingFromSurfaceMassKgController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Масса (кг) при подъеме с поверхности',
                      hintText: 'Введите значение массы (кг) при подъеме с поверхности',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: liftingFromSurfaceMovementCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество раз при подъеме с поверхности',
                      hintText: 'Введите количество раз при подъеме с поверхности',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для подъема с пола
                  TextField(
                    controller: liftingFromFloorMassKgController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Масса (кг) при подъеме с пола',
                      hintText: 'Введите значение массы (кг) при подъеме с пола',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: liftingFromFloorMovementCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество раз при подъеме с пола',
                      hintText: 'Введите количество раз при подъеме с пола',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для стереотипных рабочих движений при локальной нагрузке
                  TextField(
                    controller: stereotypicalLocalMovementPerOperationController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Локальное движение за операцию (раз)',
                      hintText: 'Введите количество локальных движений за операцию (раз)',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: stereotypicalLocalOperationCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество локальных операций',
                      hintText: 'Введите количество локальных операций',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для стереотипных рабочих движений при региональной нагрузке
                  TextField(
                    controller: stereotypicalRegionalMovementPerOperationController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Региональное движение за операцию (раз)',
                      hintText: 'Введите количество региональных движение за операцию (раз)',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: stereotypicalRegionalOperationCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество региональных операций',
                      hintText: 'Введите количество региональных операций',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для статической нагрузки (одной рукой)
                  TextField(
                      controller: staticLoadOneHandMassKgController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Статическая нагрузка одной рукой (кг)',
                        hintText: 'Введите значение статической нагрузки одной рукой (кг)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: staticLoadOneHandHoldingTimeSController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Время удержания одной рукой (с)',
                        hintText: 'Введите значение времени удержания одной рукой (с)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: staticLoadOneHandOperationCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество операций одной рукой',
                      hintText: 'Введите количество операций одной рукой',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для статической нагрузки (двумя руками)
                  TextField(
                      controller: staticLoadTwoHandsMassKgController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Статическая нагрузка двумя руками (кг)',
                        hintText: 'Введите значение времени удержания двумя руками (кг)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: staticLoadTwoHandsHoldingTimeSController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Время удержания двумя руками (с)',
                        hintText: 'Введите значение статической нагрузки двумя руками (кг)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: staticLoadTwoHandsOperationCountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Количество операций двумя руками',
                        hintText: 'Введите количество операций двумя руками',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для статической нагрузки (с участием мышц корпуса и ног)
                  TextField(
                      controller: staticLoadBodyAndLegsMassKgController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Статическая нагрузка с участием корпуса и ног (кг)',
                        hintText:
                            'Введите значение статической нагрузки с участием корпуса и ног (кг)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: staticLoadBodyAndLegsHoldingTimeSController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Время удержания с участием корпуса и ног (с)',
                        hintText: 'Введите значение времени удержания с участием корпуса и ног (с)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: staticLoadBodyAndLegsOperationCountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Количество операций с участием корпуса и ног',
                        hintText: 'Введите количество операций с участием корпуса и ног',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  // Контроллеры для рабочей позы
                  TextField(
                      controller: freePosturePercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Процент свободной позы (%)',
                        hintText: 'Введите значение процента свободной позы (%)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: standingPosturePercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Процент стоячей позы (%)',
                        hintText: 'Введите значение процента стоячей позы (%)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: uncomfortablePosturePercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Процент неудобной позы (%)',
                        hintText: 'Введите значение процента неудобной позы (%)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: fixedPosturePercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          //<-- SEE HERE
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Процент фиксированной позы (%)')),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: forcedPosturePercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Процент вынужденной позы (%)',
                        hintText: 'Введите значение процента вынужденной позы (%)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: sittingPosturePercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Процент сидячей позы позы (%)',
                        hintText: 'Введите значение процента сидячей позы (%)',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: tiltsPerOperationController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество наклонов за операцию',
                      hintText: 'Введите количество наклонов за операцию',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: tiltsOperationCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество операций с наклонами',
                      hintText: 'Введите количество операций с наклонами',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: horizontalMovementDistanceKmController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Горизонтальное перемещение (км)',
                      hintText: 'Введите значение горизонтального перемещения (км)',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: horizontalMovementDistancePerMoveMController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Расстояние горизонтального перемещения за раз (м)',
                      hintText: 'Введите расстояние горизонтального перемещения за раз (м)',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: horizontalMovementCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество горизонтальных перемещений',
                      hintText: 'Введите количество горизонтальных перемещений',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: verticalMovementDistanceKmController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Вертикальное перемещение (км)',
                      hintText: 'Введите значение вертикального перемещения (км)',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: verticalMovementDistancePerMoveMController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Расстояние вертикального перемещения за раз (м)',
                      hintText: 'Введите расстояние вертикального перемещения за раз (м)',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: verticalMovementCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Количество вертикальных перемещений',
                      hintText: 'Введите количество вертикальных перемещений',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      final organizationName = organizationNameController.text;
                      final organizationId = organizationIdController.text;
                      final measurementDate = measurementDateController.text;
                      final workplaceName = workplaceController.text;
                      final workplaceId = workplaceIdController.text;
                      final parameterName = parameterNameController.text;
                      final protocolId = protocolIdController.text;
                      final familyName = familyNameController.text;

                      final massUpTo1mKg = massUpTo1mKgController.text;
                      final distanceUpTo1mM = distanceUpTo1mMController.text;
                      final movementCountUpTo1m = movementCountUpTo1mController.text;

                      final mass1To5mKg = mass1To5mKgController.text;
                      final distance1To5mM = distance1To5mMController.text;
                      final movementCount1To5m = movementCount1To5mController.text;

                      final massMoreThan5mKg = massMoreThan5mKgController.text;
                      final distanceMoreThan5mM = distanceMoreThan5mMController.text;
                      final movementCountMoreThan5m = movementCountMoreThan5mController.text;

                      final liftingIntermittentMassKg = liftingIntermittentMassKgController.text;
                      final liftingIntermittentMovementCount =
                          liftingIntermittentMovementCountController.text;

                      final liftingConstantMassKg = liftingConstantMassKgController.text;
                      final liftingConstantMovementCount =
                          liftingConstantMovementCountController.text;

                      final liftingFromSurfaceMassKg = liftingFromSurfaceMassKgController.text;
                      final liftingFromSurfaceMovementCount =
                          liftingFromSurfaceMovementCountController.text;

                      final liftingFromFloorMassKg = liftingFromFloorMassKgController.text;
                      final liftingFromFloorMovementCount =
                          liftingFromFloorMovementCountController.text;

                      final stereotypicalLocalMovementPerOperation =
                          stereotypicalLocalMovementPerOperationController.text;
                      final stereotypicalLocalOperationCount =
                          stereotypicalLocalOperationCountController.text;

                      final stereotypicalRegionalMovementPerOperation =
                          stereotypicalRegionalMovementPerOperationController.text;
                      final stereotypicalRegionalOperationCount =
                          stereotypicalRegionalOperationCountController.text;

                      final staticLoadOneHandMassKg = staticLoadOneHandMassKgController.text;
                      final staticLoadOneHandHoldingTimeS =
                          staticLoadOneHandHoldingTimeSController.text;
                      final staticLoadOneHandOperationCount =
                          staticLoadOneHandOperationCountController.text;

                      final staticLoadTwoHandsMassKg = staticLoadTwoHandsMassKgController.text;
                      final staticLoadTwoHandsHoldingTimeS =
                          staticLoadTwoHandsHoldingTimeSController.text;
                      final staticLoadTwoHandsOperationCount =
                          staticLoadTwoHandsOperationCountController.text;

                      final staticLoadBodyAndLegsMassKg = staticLoadBodyAndLegsMassKgController.text;
                      final staticLoadBodyAndLegsHoldingTimeS =
                          staticLoadBodyAndLegsHoldingTimeSController.text;
                      final staticLoadBodyAndLegsOperationCount =
                          staticLoadBodyAndLegsOperationCountController.text;

                      final freePosturePercentage = freePosturePercentageController.text;
                      final standingPosturePercentage = standingPosturePercentageController.text;
                      final uncomfortablePosturePercentage =
                          uncomfortablePosturePercentageController.text;
                      final fixedPosturePercentage = fixedPosturePercentageController.text;
                      final forcedPosturePercentage = forcedPosturePercentageController.text;
                      final sittingPosturePercentage = sittingPosturePercentageController.text;

                      final tiltsPerOperation = tiltsPerOperationController.text;
                      final tiltsOperationCount = tiltsOperationCountController.text;

                      final horizontalMovementDistanceKm =
                          horizontalMovementDistanceKmController.text;
                      final horizontalMovementDistancePerMoveM =
                          horizontalMovementDistancePerMoveMController.text;
                      final horizontalMovementCount = horizontalMovementCountController.text;

                      final verticalMovementDistanceKm = verticalMovementDistanceKmController.text;
                      final verticalMovementDistancePerMoveM =
                          verticalMovementDistancePerMoveMController.text;
                      final verticalMovementCount = verticalMovementCountController.text;

                      if (organizationName.isNotEmpty) {
                        var severityWorkProcess = SeverityWorkProcessModel(
                          id: selectedId,
                          organizationName: organizationName,
                          organizationId: organizationId,
                          measurementDate: measurementDate,
                          workplace: workplaceName,
                          workplaceId: workplaceId,
                          parameterName: parameterName,
                          protocolId: protocolId,
                          familyName: familyName,

                          massUpTo1mKg: massUpTo1mKg,
                          distanceUpTo1mM: distanceUpTo1mM,
                          movementCountUpTo1m: movementCountUpTo1m,
                          mass1To5mKg: mass1To5mKg,
                          distance1To5mM: distance1To5mM,
                          movementCount1To5m: movementCount1To5m,
                          movementCountMoreThan5m: movementCountMoreThan5m,
                          massMoreThan5mKg: massMoreThan5mKg,
                          distanceMoreThan5mM: distanceMoreThan5mM,
                          liftingIntermittentMassKg: liftingIntermittentMassKg,
                          liftingIntermittentMovementCount: liftingIntermittentMovementCount,
                          liftingConstantMassKg: liftingConstantMassKg,
                          liftingConstantMovementCount: liftingConstantMovementCount,
                          liftingFromSurfaceMassKg: liftingFromSurfaceMassKg,
                          liftingFromSurfaceMovementCount: liftingFromSurfaceMovementCount,
                          liftingFromFloorMassKg: liftingFromFloorMassKg,
                          liftingFromFloorMovementCount: liftingFromFloorMovementCount,
                          stereotypicalLocalMovementPerOperation:
                              stereotypicalLocalMovementPerOperation,
                          stereotypicalLocalOperationCount: stereotypicalLocalOperationCount,
                          stereotypicalRegionalMovementPerOperation:
                              stereotypicalRegionalMovementPerOperation,
                          stereotypicalRegionalOperationCount: stereotypicalRegionalOperationCount,
                          staticLoadOneHandMassKg: staticLoadOneHandMassKg,
                          staticLoadOneHandHoldingTimeS: staticLoadOneHandHoldingTimeS,
                          staticLoadOneHandOperationCount: staticLoadOneHandOperationCount,
                          staticLoadTwoHandsMassKg: staticLoadTwoHandsMassKg,
                          staticLoadTwoHandsHoldingTimeS: staticLoadTwoHandsHoldingTimeS,
                          staticLoadTwoHandsOperationCount: staticLoadTwoHandsOperationCount,
                          staticLoadBodyAndLegsMassKg: staticLoadBodyAndLegsMassKg,
                          staticLoadBodyAndLegsHoldingTimeS: staticLoadBodyAndLegsHoldingTimeS,
                          staticLoadBodyAndLegsOperationCount: staticLoadBodyAndLegsOperationCount,
                          freePosturePercentage: freePosturePercentage,
                          standingPosturePercentage: standingPosturePercentage,
                          uncomfortablePosturePercentage: uncomfortablePosturePercentage,
                          fixedPosturePercentage: fixedPosturePercentage,
                          forcedPosturePercentage: forcedPosturePercentage,
                          sittingPosturePercentage: sittingPosturePercentage,
                          tiltsPerOperation: tiltsPerOperation,
                          tiltsOperationCount: tiltsOperationCount,
                          horizontalMovementDistanceKm: horizontalMovementDistanceKm,
                          horizontalMovementDistancePerMoveM: horizontalMovementDistancePerMoveM,
                          horizontalMovementCount: horizontalMovementCount,
                          verticalMovementDistanceKm: verticalMovementDistanceKm,
                          verticalMovementDistancePerMoveM: verticalMovementDistancePerMoveM,
                          verticalMovementCount: verticalMovementCount,
                        );
                        BlocProvider.of<SeverityWorkProcessBloc>(context).add(selectedId == null
                            ? SeverityWorkProcessEvent.addSeverityWorkProcess(
                                severityWorkProcess: severityWorkProcess)
                            : SeverityWorkProcessEvent.update(
                                severityWorkProcess: severityWorkProcess));
                        selectedId = null;
                        organizationNameController.clear();
                        organizationIdController.clear();
                        measurementDateController.clear();
                        workplaceIdController.clear();
                        workplaceController.clear();
                        parameterNameController.clear();
                        familyNameController.clear();

                        massUpTo1mKgController.clear();
                        distanceUpTo1mMController.clear();
                        movementCountUpTo1mController.clear();

                        mass1To5mKgController.clear();
                        distance1To5mMController.clear();
                        movementCount1To5mController.clear();

                        massMoreThan5mKgController.clear();
                        distanceMoreThan5mMController.clear();
                        movementCountMoreThan5mController.clear();

                        liftingIntermittentMassKgController.clear();
                        liftingIntermittentMovementCountController.clear();

                        liftingConstantMassKgController.clear();
                        liftingConstantMovementCountController.clear();

                        liftingFromSurfaceMassKgController.clear();
                        liftingFromSurfaceMovementCountController.clear();

                        liftingFromFloorMassKgController.clear();
                        liftingFromFloorMovementCountController.clear();

                        stereotypicalLocalMovementPerOperationController.clear();
                        stereotypicalLocalOperationCountController.clear();

                        stereotypicalRegionalMovementPerOperationController.clear();
                        stereotypicalRegionalOperationCountController.clear();

                        staticLoadOneHandMassKgController.clear();
                        staticLoadOneHandHoldingTimeSController.clear();
                        staticLoadOneHandOperationCountController.clear();

                        staticLoadTwoHandsMassKgController.clear();
                        staticLoadTwoHandsHoldingTimeSController.clear();
                        staticLoadTwoHandsOperationCountController.clear();

                        staticLoadBodyAndLegsMassKgController.clear();
                        staticLoadBodyAndLegsHoldingTimeSController.clear();
                        staticLoadBodyAndLegsOperationCountController.clear();

                        freePosturePercentageController.clear();
                        standingPosturePercentageController.clear();
                        uncomfortablePosturePercentageController.clear();

                        fixedPosturePercentageController.clear();
                        forcedPosturePercentageController.clear();
                        sittingPosturePercentageController.clear();

                        tiltsPerOperationController.clear();
                        tiltsOperationCountController.clear();

                        horizontalMovementDistanceKmController.clear();
                        horizontalMovementDistancePerMoveMController.clear();
                        horizontalMovementCountController.clear();

                        verticalMovementDistanceKmController.clear();
                        verticalMovementDistancePerMoveMController.clear();
                        verticalMovementCountController.clear();
                        Navigator.pop(context);
                      } else {
                        // Показать сообщение об ошибке или подсветить пустые поля
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Пожалуйста, заполните все поля.'),
                          ),
                        );
                      }
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    minWidth: 300,
                    height: 40,
                    child: const Text('Добавить'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
