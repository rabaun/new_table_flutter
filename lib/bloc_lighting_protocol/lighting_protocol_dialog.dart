import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/lighting_protocol_model/lighting_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_lighting_protocol.dart';
import 'lighting_protocol_event.dart';

class AddLightingProtocolDialog extends StatefulWidget {
  const AddLightingProtocolDialog({super.key, this.lightingProtocol, required this.protocolName});

  final LightingProtocolModel? lightingProtocol;
  final ProtocolNameModel? protocolName;

  @override
  State<AddLightingProtocolDialog> createState() => _AddLightingProtocolDialogState();
}

class _AddLightingProtocolDialogState extends State<AddLightingProtocolDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final protocolIdController = TextEditingController();
  final familyNameController = TextEditingController();
  final parameterNameController = TextEditingController();
  final parameterValue1Controller = TextEditingController();
  final parameterValue2Controller = TextEditingController();
  final parameterValue3Controller = TextEditingController();
  final averageConcentrationController = TextEditingController();
  int? selectedId;
  Color _color = Colors.white; // Исходный цвет

  @override
  void initState() {
    super.initState();

    // Инициализация значений из виджета
    parameterValue1Controller.text = widget.lightingProtocol?.parameterValue1 ?? '';
    parameterValue2Controller.text = widget.lightingProtocol?.parameterValue2 ?? '';
    parameterValue3Controller.text = widget.lightingProtocol?.parameterValue3 ?? '';

    // Слушатели для контроллеров параметров
    parameterValue1Controller.addListener(_updateAverageParameterValue);
    parameterValue2Controller.addListener(_updateAverageParameterValue);
    parameterValue3Controller.addListener(_updateAverageParameterValue);
  }

  void _updateAverageParameterValue() {
    double p1 = double.tryParse(parameterValue1Controller.text) ?? 0;
    double p2 = double.tryParse(parameterValue2Controller.text) ?? 0;
    double p3 = double.tryParse(parameterValue3Controller.text) ?? 0;

    double averageP = (p1 + p2 + p3) / 3;
    averageConcentrationController.text = averageP.toStringAsFixed(2);
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
    BlocProvider.of<LightingProtocolBloc>(context)
        .add(const LightingProtocolEvent.getTableProtocol());
    selectedId = widget.lightingProtocol?.id;
    organizationNameController.text =
    (widget.lightingProtocol?.organizationName ?? widget.protocolName?.organizationName)!;
    organizationIdController.text =
    (widget.lightingProtocol?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text =
    (widget.lightingProtocol?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
    (widget.lightingProtocol?.workplaceId ?? widget.protocolName?.workplaceId)!;
    protocolIdController.text = (widget.lightingProtocol?.protocolId ?? widget.protocolName?.protocolId)!;
    familyNameController.text = widget.lightingProtocol?.familyName ?? '';

    parameterNameController.text =
    (widget.lightingProtocol?.parameterName ?? widget.protocolName?.protocolName)!;
    parameterValue1Controller.text = widget.lightingProtocol?.parameterValue1 ?? '';
    parameterValue2Controller.text = widget.lightingProtocol?.parameterValue2 ?? '';
    parameterValue3Controller.text = widget.lightingProtocol?.parameterValue3 ?? '';
    averageConcentrationController.text = widget.lightingProtocol?.averageConcentration ?? '';
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
            child: SingleChildScrollView(
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
                  TextField(
                    controller: parameterValue1Controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Значение фактора',
                      hintText: 'Введите значение фактора',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: parameterValue2Controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Значение фактора',
                      hintText: 'Введите значение фактора',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: parameterValue3Controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Значение фактора',
                      hintText: 'Введите значение фактора',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: averageConcentrationController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      filled: true,
                      //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Среднее значение',
                      hintText: 'Среднее значение',
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
                      final workplace = workplaceController.text;
                      final workplaceId = workplaceIdController.text;
                      final protocolId = protocolIdController.text;
                      final familyName = familyNameController.text;

                      final parameterName = parameterNameController.text;
                      final parameterValue1 = parameterValue1Controller.text;
                      final parameterValue2 = parameterValue2Controller.text;
                      final parameterValue3 = parameterValue3Controller.text;
                      final averageConcentration = averageConcentrationController.text;
                      if (organizationName.isNotEmpty) {
                        var lightingProtocol = LightingProtocolModel(
                          id: selectedId,
                          organizationName: organizationName,
                          organizationId: organizationId,
                          measurementDate: measurementDate,
                          workplace: workplace,
                          workplaceId: workplaceId,
                          protocolId: protocolId,
                          familyName: familyName,
                          parameterName: parameterName,
                          parameterValue1: parameterValue1,
                          parameterValue2: parameterValue2,
                          parameterValue3: parameterValue3,
                          averageConcentration: averageConcentration,
                        );
                        BlocProvider.of<LightingProtocolBloc>(context).add(selectedId == null
                            ? LightingProtocolEvent.addTableProtocol(lightingProtocol: lightingProtocol)
                            : LightingProtocolEvent.update(lightingProtocol: lightingProtocol));
                        selectedId = null;
                        organizationNameController.clear();
                        organizationIdController.clear();
                        measurementDateController.clear();
                        workplaceController.clear();
                        familyNameController.clear();
                        parameterNameController.clear();
                        parameterValue1Controller.clear();
                        parameterValue2Controller.clear();
                        parameterValue3Controller.clear();
                        averageConcentrationController.clear();
                        protocolIdController.clear();
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

