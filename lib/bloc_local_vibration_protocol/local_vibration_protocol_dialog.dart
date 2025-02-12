import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/local_vibration_protocol_model/local_vibration_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_local_vibration_protocol.dart';
import 'local_vibration_protocol_event.dart';

class AddLocalVibrationProtocolDialog extends StatefulWidget {
  const AddLocalVibrationProtocolDialog(
      {super.key, this.localVibrationProtocol, required this.protocolName});

  final LocalVibrationProtocolModel? localVibrationProtocol;
  final ProtocolNameModel? protocolName;

  @override
  State<AddLocalVibrationProtocolDialog> createState() => _AddLocalVibrationProtocolDialogState();
}

class _AddLocalVibrationProtocolDialogState extends State<AddLocalVibrationProtocolDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final parameterNameController = TextEditingController();
  final protocolIdController = TextEditingController();
  final familyNameController = TextEditingController();

  final correctedLevelX1Controller = TextEditingController();
  final correctedLevelX2Controller = TextEditingController();
  final correctedLevelX3Controller = TextEditingController();
  final averageCorrectedLevelXController = TextEditingController();

  final correctedLevelY1Controller = TextEditingController();
  final correctedLevelY2Controller = TextEditingController();
  final correctedLevelY3Controller = TextEditingController();
  final averageCorrectedLevelYController = TextEditingController();

  final correctedLevelZ1Controller = TextEditingController();
  final correctedLevelZ2Controller = TextEditingController();
  final correctedLevelZ3Controller = TextEditingController();
  final averageCorrectedLevelZController = TextEditingController();

  int? selectedId;
  Color _color = Colors.white; // Исходный цвет

  @override
  void initState() {
    super.initState();

    // Добавляем слушателей для контроллеров
    correctedLevelX1Controller.addListener(_updateAverageX);
    correctedLevelX2Controller.addListener(_updateAverageX);
    correctedLevelX3Controller.addListener(_updateAverageX);

    correctedLevelY1Controller.addListener(_updateAverageY);
    correctedLevelY2Controller.addListener(_updateAverageY);
    correctedLevelY3Controller.addListener(_updateAverageY);

    correctedLevelZ1Controller.addListener(_updateAverageZ);
    correctedLevelZ2Controller.addListener(_updateAverageZ);
    correctedLevelZ3Controller.addListener(_updateAverageZ);
  }

  void _updateAverageX() {
    double x1 = double.tryParse(correctedLevelX1Controller.text) ?? 0;
    double x2 = double.tryParse(correctedLevelX2Controller.text) ?? 0;
    double x3 = double.tryParse(correctedLevelX3Controller.text) ?? 0;

    double averageX = (x1 + x2 + x3) / 3;
    averageCorrectedLevelXController.text = averageX.toStringAsFixed(2); // Ограничиваем до двух знаков после запятой
  }

  void _updateAverageY() {
    double y1 = double.tryParse(correctedLevelY1Controller.text) ?? 0;
    double y2 = double.tryParse(correctedLevelY2Controller.text) ?? 0;
    double y3 = double.tryParse(correctedLevelY3Controller.text) ?? 0;

    double averageY = (y1 + y2 + y3) / 3;
    averageCorrectedLevelYController.text = averageY.toStringAsFixed(2);
  }

  void _updateAverageZ() {
    double z1 = double.tryParse(correctedLevelZ1Controller.text) ?? 0;
    double z2 = double.tryParse(correctedLevelZ2Controller.text) ?? 0;
    double z3 = double.tryParse(correctedLevelZ3Controller.text) ?? 0;

    double averageZ = (z1 + z2 + z3) / 3;
    averageCorrectedLevelZController.text = averageZ.toStringAsFixed(2);
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
    BlocProvider.of<LocalVibrationProtocolBloc>(context)
        .add(LocalVibrationProtocolEvent.getOrganization(protocolName: widget.protocolName));
    selectedId = widget.localVibrationProtocol?.id;
    organizationNameController.text =
        (widget.localVibrationProtocol?.organizationName ?? widget.protocolName?.organizationName)!;
    organizationIdController.text =
        (widget.localVibrationProtocol?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text =
        (widget.localVibrationProtocol?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
        (widget.localVibrationProtocol?.workplaceId ?? widget.protocolName?.workplaceId)!;
    parameterNameController.text =
        (widget.localVibrationProtocol?.parameterName ?? widget.protocolName?.protocolName)!;
    protocolIdController.text = (widget.localVibrationProtocol?.protocolId ?? widget.protocolName?.protocolId)!;
    familyNameController.text = widget.localVibrationProtocol?.familyName ?? '';

    correctedLevelX1Controller.text = widget.localVibrationProtocol?.correctedLevelX1 ?? '';
    correctedLevelX2Controller.text = widget.localVibrationProtocol?.correctedLevelX2 ?? '';
    correctedLevelX3Controller.text = widget.localVibrationProtocol?.correctedLevelX3 ?? '';
    averageCorrectedLevelXController.text = widget.localVibrationProtocol?.averageCorrectedLevelX ?? '';

    correctedLevelY1Controller.text = widget.localVibrationProtocol?.correctedLevelY1 ?? '';
    correctedLevelY2Controller.text = widget.localVibrationProtocol?.correctedLevelY2 ?? '';
    correctedLevelY3Controller.text = widget.localVibrationProtocol?.correctedLevelY3 ?? '';
    averageCorrectedLevelYController.text = widget.localVibrationProtocol?.averageCorrectedLevelY ?? '';

    correctedLevelZ1Controller.text = widget.localVibrationProtocol?.correctedLevelZ1 ?? '';
    correctedLevelZ2Controller.text = widget.localVibrationProtocol?.correctedLevelZ2 ?? '';
    correctedLevelZ3Controller.text = widget.localVibrationProtocol?.correctedLevelZ3 ?? '';
    averageCorrectedLevelZController.text = widget.localVibrationProtocol?.averageCorrectedLevelZ ?? '';

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
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
                  controller: correctedLevelX1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по X',
                    hintText: 'Введите значение вибрация по X',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelX2Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по X',
                    hintText: 'Введите значение вибрация по X',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelX3Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по X',
                    hintText: 'Введите значение вибрация по X',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageCorrectedLevelXController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее значение вибрация по X',
                    hintText: 'Введите среднее значение вибрация по X',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelY1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по Y',
                    hintText: 'Введите значение вибрация по Y',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelY2Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по Y',
                    hintText: 'Введите значение вибрация по Y',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelY3Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по Y',
                    hintText: 'Введите значение вибрация по Y',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageCorrectedLevelYController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее значение вибрация по Y',
                    hintText: 'Введите среднее значение вибрация по Y',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelZ1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по Z',
                    hintText: 'Введите значение вибрация по Z',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelZ2Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по Z',
                    hintText: 'Введите значение вибрация по Z',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: correctedLevelZ3Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Вибрация по Z',
                    hintText: 'Введите значение вибрация по Z',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageCorrectedLevelZController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее значение вибрация по Z',
                    hintText: 'Введите среднее значение вибрация  по Z',
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

                    final correctedLevelX1 = correctedLevelX1Controller.text;
                    final correctedLevelX2 = correctedLevelX2Controller.text;
                    final correctedLevelX3 = correctedLevelX3Controller.text;
                    final averageCorrectedLevelX = averageCorrectedLevelXController.text;

                    final correctedLevelY1 = correctedLevelY1Controller.text;
                    final correctedLevelY2 = correctedLevelY2Controller.text;
                    final correctedLevelY3 = correctedLevelY3Controller.text;
                    final averageCorrectedLevelY = averageCorrectedLevelYController.text;

                    final correctedLevelZ1 = correctedLevelZ1Controller.text;
                    final correctedLevelZ2 = correctedLevelZ2Controller.text;
                    final correctedLevelZ3 = correctedLevelZ3Controller.text;
                    final averageCorrectedLevelZ = averageCorrectedLevelZController.text;

                    if (organizationName.isNotEmpty) {
                      var localVibrationProtocol = LocalVibrationProtocolModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        measurementDate: measurementDate,
                        workplace: workplaceName,
                        workplaceId: workplaceId,
                        parameterName: parameterName,
                        protocolId: protocolId,
                        familyName: familyName,

                        correctedLevelX1: correctedLevelX1,
                        correctedLevelX2: correctedLevelX2,
                        correctedLevelX3: correctedLevelX3,
                        averageCorrectedLevelX: averageCorrectedLevelX,

                        correctedLevelY1: correctedLevelY1,
                        correctedLevelY2: correctedLevelY2,
                        correctedLevelY3: correctedLevelY3,
                        averageCorrectedLevelY: averageCorrectedLevelY,

                        correctedLevelZ1: correctedLevelZ1,
                        correctedLevelZ2: correctedLevelZ2,
                        correctedLevelZ3: correctedLevelZ3,
                        averageCorrectedLevelZ: averageCorrectedLevelZ,
                      );
                      BlocProvider.of<LocalVibrationProtocolBloc>(context).add(selectedId == null
                          ? LocalVibrationProtocolEvent.addLocalVibrationProtocol(
                              localVibrationProtocol: localVibrationProtocol)
                          : LocalVibrationProtocolEvent.update(
                              localVibrationProtocol: localVibrationProtocol));
                      selectedId = null;
                      organizationNameController.clear();
                      organizationIdController.clear();
                      workplaceController.clear();
                      parameterNameController.clear();

                      correctedLevelX1Controller.clear();
                      correctedLevelX2Controller.clear();
                      correctedLevelX3Controller.clear();
                      averageCorrectedLevelXController.clear();

                      correctedLevelY1Controller.clear();
                      correctedLevelY2Controller.clear();
                      correctedLevelY3Controller.clear();
                      averageCorrectedLevelYController.clear();

                      correctedLevelZ1Controller.clear();
                      correctedLevelZ2Controller.clear();
                      correctedLevelZ3Controller.clear();
                      averageCorrectedLevelZController.clear();

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
    );
  }
}
