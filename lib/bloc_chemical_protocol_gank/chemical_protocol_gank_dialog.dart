import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/chemical_protocol_gank_model/chemical_protocol_gank_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_chemical_protocol_gank.dart';
import 'chemical_protocol_gank_event.dart';

class AddChemicalProtocolGankDialog extends StatefulWidget {
  const AddChemicalProtocolGankDialog(
      {super.key, this.chemicalProtocolGankList, required this.protocolName});

  final ChemicalProtocolGankModel? chemicalProtocolGankList;
  final ProtocolNameModel? protocolName;

  @override
  State<AddChemicalProtocolGankDialog> createState() => _AddChemicalProtocolGankDialogState();
}

class _AddChemicalProtocolGankDialogState extends State<AddChemicalProtocolGankDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final protocolIdController = TextEditingController();
  final parameterNameController = TextEditingController();
  final familyNameController = TextEditingController();
  final concentration1_1Controller = TextEditingController();
  final concentration2_1Controller = TextEditingController();
  final averageConcentrationController = TextEditingController();

  int? selectedId;
  Color _color = Colors.white; // Исходный цвет

  @override
  void initState() {
    super.initState();

    // Инициализация значений из виджета
    concentration1_1Controller.text = widget.chemicalProtocolGankList?.concentration1_1 ?? '';
    concentration2_1Controller.text = widget.chemicalProtocolGankList?.concentration2_1 ?? '';
    averageConcentrationController.text = widget.chemicalProtocolGankList?.averageConcentration ?? '';

    // Слушатели для контроллеров концентраций
    concentration1_1Controller.addListener(_updateAverageConcentration);
    concentration2_1Controller.addListener(_updateAverageConcentration);
  }

  void _updateAverageConcentration() {
    double c1 = double.tryParse(concentration1_1Controller.text) ?? 0;
    double c2 = double.tryParse(concentration2_1Controller.text) ?? 0;

    double averageC = (c1 + c2) / 2;
    averageConcentrationController.text = averageC.toStringAsFixed(2);
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
    BlocProvider.of<ChemicalProtocolGankBloc>(context)
        .add(ChemicalProtocolGankEvent.getProtocol(protocolName: widget.protocolName));
    selectedId = widget.chemicalProtocolGankList?.id;
    organizationNameController.text = (widget.chemicalProtocolGankList?.organizationName ??
        widget.protocolName?.organizationName)!;
    organizationIdController.text =
        (widget.chemicalProtocolGankList?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text =
        (widget.chemicalProtocolGankList?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
        (widget.chemicalProtocolGankList?.workplaceId ?? widget.protocolName?.workplaceId)!;
    parameterNameController.text =
        (widget.chemicalProtocolGankList?.parameterName ?? widget.protocolName?.protocolName)!;
    protocolIdController.text =
        (widget.chemicalProtocolGankList?.protocolId ?? widget.protocolName?.protocolId)!;
    familyNameController.text = widget.chemicalProtocolGankList?.familyName ?? '';
    concentration1_1Controller.text = widget.chemicalProtocolGankList?.concentration1_1 ?? '';
    concentration2_1Controller.text = widget.chemicalProtocolGankList?.concentration2_1 ?? '';
    averageConcentrationController.text =
        widget.chemicalProtocolGankList?.averageConcentration ?? '';

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
                  controller: concentration1_1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Замер первой серии',
                    hintText: 'Введите  замер первой серии',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: concentration2_1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Замер второй серии',
                    hintText: 'Введите замер второй серии',
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
                    final workplaceName = workplaceController.text;
                    final workplaceId = workplaceIdController.text;
                    final protocolId = protocolIdController.text;
                    final parameterName = parameterNameController.text;
                    final familyName = familyNameController.text;
                    final concentration1_1 = concentration1_1Controller.text;
                    final concentration2_1 = concentration2_1Controller.text;
                    final averageConcentration = averageConcentrationController.text;

                    if (organizationName.isNotEmpty) {
                      var chemicalProtocolGank = ChemicalProtocolGankModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        measurementDate: measurementDate,
                        workplace: workplaceName,
                        workplaceId: workplaceId,
                        protocolId: protocolId,
                        parameterName: parameterName,
                        familyName: familyName,
                        concentration1_1: concentration1_1,
                        concentration2_1: concentration2_1,
                        averageConcentration: averageConcentration,
                      );
                      BlocProvider.of<ChemicalProtocolGankBloc>(context).add(selectedId == null
                          ? ChemicalProtocolGankEvent.addChemicalProtocolGank(
                              chemicalProtocolGank: chemicalProtocolGank)
                          : ChemicalProtocolGankEvent.update(
                              chemicalProtocolGank: chemicalProtocolGank));
                      selectedId = null;
                      organizationNameController.clear();
                      organizationIdController.clear();
                      workplaceController.clear();
                      parameterNameController.clear();
                      protocolIdController.clear();
                      familyNameController.clear();
                      concentration1_1Controller.clear();
                      concentration2_1Controller.clear();
                      averageConcentrationController.clear();
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
