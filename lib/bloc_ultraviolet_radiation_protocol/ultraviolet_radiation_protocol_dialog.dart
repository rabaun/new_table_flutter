import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_table_flutter/bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_event.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';
import 'bloc_ultraviolet_radiation_protocol.dart';

class AddUltravioletRadiationProtocolDialog extends StatefulWidget {
  const AddUltravioletRadiationProtocolDialog(
      {super.key, this.ultravioletRadiation, required this.protocolName});

  final UltravioletRadiationProtocolModel? ultravioletRadiation;
  final ProtocolNameModel? protocolName;

  @override
  State<AddUltravioletRadiationProtocolDialog> createState() =>
      _AddUltravioletRadiationProtocolDialogState();
}

class _AddUltravioletRadiationProtocolDialogState
    extends State<AddUltravioletRadiationProtocolDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final parameterNameController = TextEditingController();
  final uvAIntensityH05_10Controller = TextEditingController();
  final uvAIntensityH15Controller = TextEditingController();
  final uvBIntensityH05_10Controller = TextEditingController();
  final uvBIntensityH15Controller = TextEditingController();

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
    BlocProvider.of<UltravioletRadiationProtocolBloc>(context)
        .add(UltravioletRadiationProtocolEvent.getOrganization(protocolName: widget.protocolName));
    selectedId = widget.ultravioletRadiation?.id;
    organizationNameController.text =
        (widget.ultravioletRadiation?.organizationName ?? widget.protocolName?.organizationName)!;
    organizationIdController.text =
        (widget.ultravioletRadiation?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text =
        (widget.ultravioletRadiation?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
        (widget.ultravioletRadiation?.workplaceId ?? widget.protocolName?.workplaceId)!;
    parameterNameController.text =
        (widget.ultravioletRadiation?.parameterName ?? widget.protocolName?.protocolName)!;
    uvAIntensityH05_10Controller.text = widget.ultravioletRadiation?.uvAIntensityH05_10 ?? '';
    uvAIntensityH15Controller.text = widget.ultravioletRadiation?.uvAIntensityH15 ?? '';
    uvBIntensityH05_10Controller.text = widget.ultravioletRadiation?.uvBIntensityH05_10 ?? '';
    uvBIntensityH15Controller.text = widget.ultravioletRadiation?.uvBIntensityH15 ?? '';

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
                TextField(
                  controller: organizationIdController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Уникальный номер организации',
                    hintText: 'Введите уникальный номер организации',
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
                  controller: workplaceIdController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Уникальный идентификатор для рабочего места',
                    hintText: 'Введите уникальный идентификатор для рабочего места',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvAIntensityH05_10Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 0.5 - 1.0м',
                    hintText: 'Введите значение УФ-А излучения на высоте 0.5 - 1.0м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvAIntensityH15Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 1.5м',
                    hintText: 'Введите значение УФ-А излучения на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH05_10Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 0.5 - 1.0м',
                    hintText: 'Введите значение УФ-В излучения на высоте 0.5 - 1.0м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH15Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 1.5м',
                    hintText: 'Введите значение УФ-В излучения на высоте 1.5м',
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
                    final uvAIntensityH05_10 = uvAIntensityH05_10Controller.text;
                    final uvAIntensityH15 = uvAIntensityH15Controller.text;
                    final uvBIntensityH05_10 = uvBIntensityH05_10Controller.text;
                    final uvBIntensityH15 = uvBIntensityH15Controller.text;

                    if (organizationName.isNotEmpty) {
                      var ultravioletRadiation = UltravioletRadiationProtocolModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        measurementDate: measurementDate,
                        workplace: workplaceName,
                        workplaceId: workplaceId,
                        parameterName: parameterName,
                        uvAIntensityH05_10: uvAIntensityH05_10,
                        uvAIntensityH15: uvAIntensityH15,
                        uvBIntensityH05_10: uvBIntensityH05_10,
                        uvBIntensityH15: uvBIntensityH15,
                      );
                      BlocProvider.of<UltravioletRadiationProtocolBloc>(context).add(
                          selectedId == null
                              ? UltravioletRadiationProtocolEvent.addUltravioletRadiation(
                                  ultravioletRadiation: ultravioletRadiation)
                              : UltravioletRadiationProtocolEvent.update(
                                  ultravioletRadiation: ultravioletRadiation));
                      selectedId = null;
                      organizationNameController.clear();
                      organizationIdController.clear();
                      measurementDateController.clear();
                      workplaceIdController.clear();
                      workplaceController.clear();
                      parameterNameController.clear();

                      uvAIntensityH05_10Controller.clear();
                      uvAIntensityH15Controller.clear();
                      uvBIntensityH05_10Controller.clear();
                      uvBIntensityH15Controller.clear();
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
