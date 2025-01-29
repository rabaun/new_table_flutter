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
  final correctedLevelXController = TextEditingController();
  final correctedLevelYController = TextEditingController();
  final correctedLevelZController = TextEditingController();
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
    correctedLevelXController.text = widget.localVibrationProtocol?.correctedLevelX ?? '';
    correctedLevelYController.text = widget.localVibrationProtocol?.correctedLevelY ?? '';
    correctedLevelZController.text = widget.localVibrationProtocol?.correctedLevelZ ?? '';

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
                  controller: correctedLevelXController,
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
                  controller: correctedLevelYController,
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
                  controller: correctedLevelZController,
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
                MaterialButton(
                  onPressed: () {
                    final organizationName = organizationNameController.text;
                    final organizationId = organizationIdController.text;
                    final measurementDate = measurementDateController.text;
                    final workplaceName = workplaceController.text;
                    final workplaceId = workplaceIdController.text;
                    final parameterName = parameterNameController.text;
                    final correctedLevelX = correctedLevelXController.text;
                    final correctedLevelY = correctedLevelYController.text;
                    final correctedLevelZ = correctedLevelZController.text;

                    if (organizationName.isNotEmpty) {
                      var localVibrationProtocol = LocalVibrationProtocolModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        measurementDate: measurementDate,
                        workplace: workplaceName,
                        workplaceId: workplaceId,
                        parameterName: parameterName,
                        correctedLevelX: correctedLevelX,
                        correctedLevelY: correctedLevelY,
                        correctedLevelZ: correctedLevelZ,
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
                      correctedLevelXController.clear();
                      correctedLevelYController.clear();
                      correctedLevelZController.clear();
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
