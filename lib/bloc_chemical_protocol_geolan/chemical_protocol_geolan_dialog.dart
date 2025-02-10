import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/chemical_protocol_geolan_model/chemical_protocol_geolan_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_chemical_protocol_geolan.dart';
import 'chemical_protocol_geolan_event.dart';

class AddChemicalProtocolGeolanDialog extends StatefulWidget {
  const AddChemicalProtocolGeolanDialog({super.key, this.chemicalProtocolGeolan, required this.protocolName});

  final ChemicalProtocolGeolanModel? chemicalProtocolGeolan;
  final ProtocolNameModel? protocolName;

  @override
  State<AddChemicalProtocolGeolanDialog> createState() => _AddChemicalProtocolGeolanDialogState();
}

class _AddChemicalProtocolGeolanDialogState extends State<AddChemicalProtocolGeolanDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final protocolIdController = TextEditingController();
  final familyNameController = TextEditingController();
  final parameterNameController = TextEditingController();
  final parameterValueController = TextEditingController();
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
    BlocProvider.of<ChemicalProtocolGeolanBloc>(context)
        .add(const ChemicalProtocolGeolanEvent.getTableProtocol());
    selectedId = widget.chemicalProtocolGeolan?.id;
    organizationNameController.text =
    (widget.chemicalProtocolGeolan?.organizationName ?? widget.protocolName?.organizationName)!;
    organizationIdController.text =
    (widget.chemicalProtocolGeolan?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text =
    (widget.chemicalProtocolGeolan?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
    (widget.chemicalProtocolGeolan?.workplaceId ?? widget.protocolName?.workplaceId)!;
    protocolIdController.text = (widget.chemicalProtocolGeolan?.protocolId ?? widget.protocolName?.protocolId)!;
    familyNameController.text = widget.chemicalProtocolGeolan?.familyName ?? '';
    parameterNameController.text =
    (widget.chemicalProtocolGeolan?.parameterName ?? widget.protocolName?.protocolName)!;
    parameterValueController.text = widget.chemicalProtocolGeolan?.parameterValue ?? '';
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
                    controller: parameterValueController,
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
                  MaterialButton(
                    onPressed: () {
                      final organizationName = organizationNameController.text;
                      final organizationId = organizationIdController.text;
                      final measurementDate = measurementDateController.text;
                      final workplace = workplaceController.text;
                      final workplaceId = workplaceIdController.text;
                      final familyName = familyNameController.text;
                      final parameterName = parameterNameController.text;
                      final parameterValue = parameterValueController.text;
                      final protocolId = protocolIdController.text;
                      if (organizationName.isNotEmpty) {
                        var chemicalProtocolGeolan = ChemicalProtocolGeolanModel(
                            id: selectedId,
                            organizationName: organizationName,
                            organizationId: organizationId,
                            measurementDate: measurementDate,
                            workplace: workplace,
                            workplaceId: workplaceId,
                            familyName: familyName,
                            parameterName: parameterName,
                            parameterValue: parameterValue,
                            protocolId: protocolId,);
                        BlocProvider.of<ChemicalProtocolGeolanBloc>(context).add(selectedId == null
                            ? ChemicalProtocolGeolanEvent.addTableProtocol(chemicalProtocolGeolan: chemicalProtocolGeolan)
                            : ChemicalProtocolGeolanEvent.update(chemicalProtocolGeolan: chemicalProtocolGeolan));
                        selectedId = null;
                        organizationNameController.clear();
                        organizationIdController.clear();
                        measurementDateController.clear();
                        workplaceController.clear();
                        familyNameController.clear();
                        parameterNameController.clear();
                        parameterValueController.clear();
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
