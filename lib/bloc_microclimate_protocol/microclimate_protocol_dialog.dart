import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/microclimate_protocol_model/microclimate_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_microclimate_protocol.dart';
import 'microclimate_protocol_event.dart';

class AddMicroclimateDialog extends StatefulWidget {
  const AddMicroclimateDialog({super.key, this.microclimate, required this.protocolName});

  final MicroclimateProtocolModel? microclimate;
  final ProtocolNameModel? protocolName;

  @override
  State<AddMicroclimateDialog> createState() => _AddMicroclimateDialogState();
}

class _AddMicroclimateDialogState extends State<AddMicroclimateDialog> {
  final organizationNameController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final parameterNameController = TextEditingController();
  final airTemperature01mController = TextEditingController();
  final airTemperature15mController = TextEditingController();
  final tncIndex01mController = TextEditingController();
  final tncIndex15mController = TextEditingController();
  final airVelocity01mController = TextEditingController();
  final airVelocity15mController = TextEditingController();
  final relativeHumidityController = TextEditingController();
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
    BlocProvider.of<MicroclimateProtocolBloc>(context)
        .add(MicroclimateEvent.getOrganization(protocolName: widget.protocolName));
    selectedId = widget.microclimate?.id;
    organizationNameController.text =
        (widget.microclimate?.organizationName ?? widget.protocolName?.organizationName)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text = (widget.microclimate?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
        (widget.microclimate?.workplaceId ?? widget.protocolName?.workplaceId)!;
    parameterNameController.text =
        (widget.microclimate?.parameterName ?? widget.protocolName?.protocolName)!;
    airTemperature01mController.text = widget.microclimate?.airTemperature01m ?? '';
    airTemperature15mController.text = widget.microclimate?.airTemperature15m ?? '';
    tncIndex01mController.text = widget.microclimate?.tncIndex01m ?? '';
    tncIndex15mController.text = widget.microclimate?.airTemperature15m ?? '';
    airVelocity01mController.text = widget.microclimate?.airVelocity01m ?? '';
    airVelocity15mController.text = widget.microclimate?.airTemperature15m ?? '';
    relativeHumidityController.text = widget.microclimate?.relativeHumidity ?? '';

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
                  controller: airTemperature01mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 0.1м',
                    hintText: 'Введите значение температуры воздуха на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airTemperature15mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 1.5м',
                    hintText: 'Введите значение температуры воздуха на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex01mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 0.1м',
                    hintText: 'Введите значение ТНС на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex15mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 1.5м',
                    hintText: 'Введите значение ТНС на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airVelocity01mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость воздушного потока 0.1м',
                    hintText: 'Введите значение скорость воздушного потока 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airVelocity15mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость воздушного потока 1.5м',
                    hintText: 'Введите значение скорость воздушного потока 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: relativeHumidityController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение влажности воздуха',
                    hintText: 'Введите значение влажности воздуха',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    final organizationName = organizationNameController.text;
                    final measurementDate = measurementDateController.text;
                    final workplaceName = workplaceController.text;
                    final workplaceId = workplaceIdController.text;
                    final parameterName = parameterNameController.text;
                    final airTemperature01m = airTemperature01mController.text;
                    final airTemperature15m = airTemperature15mController.text;
                    final tncIndex01m = tncIndex01mController.text;
                    final tncIndex15m = tncIndex15mController.text;
                    final airVelocity01m = airVelocity01mController.text;
                    final airVelocity15m = airVelocity15mController.text;
                    final relativeHumidity = relativeHumidityController.text;

                    if (organizationName.isNotEmpty) {
                      var microclimate = MicroclimateProtocolModel(
                          id: selectedId,
                          organizationName: organizationName,
                          measurementDate: measurementDate,
                          workplace: workplaceName,
                          workplaceId: workplaceId,
                          parameterName: parameterName,
                          airTemperature01m: airTemperature01m,
                          airTemperature15m: airTemperature15m,
                          tncIndex01m: tncIndex01m,
                          tncIndex15m: tncIndex15m,
                          airVelocity01m: airVelocity01m,
                          airVelocity15m: airVelocity15m,
                          relativeHumidity: relativeHumidity);
                      BlocProvider.of<MicroclimateProtocolBloc>(context).add(selectedId == null
                          ? MicroclimateEvent.addMicroclimate(microclimate: microclimate)
                          : MicroclimateEvent.update(microclimate: microclimate));
                      selectedId = null;
                      organizationNameController.clear();
                      workplaceController.clear();
                      parameterNameController.clear();
                      airTemperature01mController.clear();
                      airTemperature15mController.clear();
                      tncIndex01mController.clear();
                      tncIndex15mController.clear();
                      airVelocity01mController.clear();
                      airVelocity15mController.clear();
                      relativeHumidityController.clear();
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
