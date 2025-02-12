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
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final parameterNameController = TextEditingController();
  final protocolIdController = TextEditingController();
  final familyNameController = TextEditingController();

  final airTemperature01m1Controller = TextEditingController();
  final airTemperature01m2Controller = TextEditingController();
  final airTemperature01m3Controller = TextEditingController();
  final averageAirTemperature01mController = TextEditingController();

  final airTemperature15m1Controller = TextEditingController();
  final airTemperature15m2Controller = TextEditingController();
  final airTemperature15m3Controller = TextEditingController();
  final averageAirTemperature15mController = TextEditingController();

  final tncIndex01m1Controller = TextEditingController();
  final tncIndex01m2Controller = TextEditingController();
  final tncIndex01m3Controller = TextEditingController();
  final averageTncIndex01mController = TextEditingController();

  final tncIndex15m1Controller = TextEditingController();
  final tncIndex15m2Controller = TextEditingController();
  final tncIndex15m3Controller = TextEditingController();
  final averageTncIndex15mController = TextEditingController();

  final airVelocity01m1Controller = TextEditingController();
  final airVelocity01m2Controller = TextEditingController();
  final airVelocity01m3Controller = TextEditingController();
  final averageAirVelocity01mController = TextEditingController();

  final airVelocity15m1Controller = TextEditingController();
  final airVelocity15m2Controller = TextEditingController();
  final airVelocity15m3Controller = TextEditingController();
  final averageAirVelocity15mController = TextEditingController();

  final relativeHumidity1Controller = TextEditingController();
  final relativeHumidity2Controller = TextEditingController();
  final relativeHumidity3Controller = TextEditingController();
  final averageRelativeHumidityController = TextEditingController();

  final thermalRadiationIntensity05m1Controller = TextEditingController();
  final thermalRadiationIntensity05m2Controller = TextEditingController();
  final thermalRadiationIntensity05m3Controller = TextEditingController();
  final averageThermalRadiationIntensity05mController = TextEditingController();

  final thermalRadiationIntensity1m1Controller = TextEditingController();
  final thermalRadiationIntensity1m2Controller = TextEditingController();
  final thermalRadiationIntensity1m3Controller = TextEditingController();
  final averageThermalRadiationIntensity1mController = TextEditingController();

  final thermalRadiationIntensity15m1Controller = TextEditingController();
  final thermalRadiationIntensity15m2Controller = TextEditingController();
  final thermalRadiationIntensity15m3Controller = TextEditingController();
  final averageThermalRadiationIntensity15mController = TextEditingController();

  final thermalRadiationExposureDose1Controller = TextEditingController();
  final thermalRadiationExposureDose2Controller = TextEditingController();
  final thermalRadiationExposureDose3Controller = TextEditingController();
  final averageThermalRadiationExposureDoseController = TextEditingController();

  int? selectedId;
  Color _color = Colors.white; // Исходный цвет

  @override
  void initState() {
    super.initState();


    // Добавляем слушателей для контроллеров температуры на 1 м
    airTemperature01m1Controller.addListener(_updateAverageAirTemperature01m);
    airTemperature01m2Controller.addListener(_updateAverageAirTemperature01m);
    airTemperature01m3Controller.addListener(_updateAverageAirTemperature01m);

    // Добавляем слушателей для контроллеров температуры на 15 м
    airTemperature15m1Controller.addListener(_updateAverageAirTemperature15m);
    airTemperature15m2Controller.addListener(_updateAverageAirTemperature15m);
    airTemperature15m3Controller.addListener(_updateAverageAirTemperature15m);

    // Добавляем слушателей для контроллеров TNC на 1 м
    tncIndex01m1Controller.addListener(_updateAverageTncIndex01m);
    tncIndex01m2Controller.addListener(_updateAverageTncIndex01m);
    tncIndex01m3Controller.addListener(_updateAverageTncIndex01m);

    // Добавляем слушателей для контроллеров TNC на 15 м
    tncIndex15m1Controller.addListener(_updateAverageTncIndex15m);
    tncIndex15m2Controller.addListener(_updateAverageTncIndex15m);
    tncIndex15m3Controller.addListener(_updateAverageTncIndex15m);
  }

  void _updateAverageAirTemperature01m() {
    double t1 = double.tryParse(airTemperature01m1Controller.text) ?? 0;
    double t2 = double.tryParse(airTemperature01m2Controller.text) ?? 0;
    double t3 = double.tryParse(airTemperature01m3Controller.text) ?? 0;

    double averageT = (t1 + t2 + t3) / 3;
    averageAirTemperature01mController.text = averageT.toStringAsFixed(2);
  }

  void _updateAverageAirTemperature15m() {
    double t1 = double.tryParse(airTemperature15m1Controller.text) ?? 0;
    double t2 = double.tryParse(airTemperature15m2Controller.text) ?? 0;
    double t3 = double.tryParse(airTemperature15m3Controller.text) ?? 0;

    double averageT = (t1 + t2 + t3) / 3;
    averageAirTemperature15mController.text = averageT.toStringAsFixed(2);
  }

  void _updateAverageTncIndex01m() {
    double t1 = double.tryParse(tncIndex01m1Controller.text) ?? 0;
    double t2 = double.tryParse(tncIndex01m2Controller.text) ?? 0;
    double t3 = double.tryParse(tncIndex01m3Controller.text) ?? 0;

    double averageT = (t1 + t2 + t3) / 3;
    averageTncIndex01mController.text = averageT.toStringAsFixed(2);
  }

  void _updateAverageTncIndex15m() {
    double t1 = double.tryParse(tncIndex15m1Controller.text) ?? 0;
    double t2 = double.tryParse(tncIndex15m2Controller.text) ?? 0;
    double t3 = double.tryParse(tncIndex15m3Controller.text) ?? 0;

    double averageT = (t1 + t2 + t3) / 3;
    averageTncIndex15mController.text = averageT.toStringAsFixed(2);


    // Слушатели для контроллеров скорости воздуха на 1 м
    airVelocity01m1Controller.addListener(_updateAverageAirVelocity01m);
    airVelocity01m2Controller.addListener(_updateAverageAirVelocity01m);
    airVelocity01m3Controller.addListener(_updateAverageAirVelocity01m);

    // Слушатели для контроллеров скорости воздуха на 15 м
    airVelocity15m1Controller.addListener(_updateAverageAirVelocity15m);
    airVelocity15m2Controller.addListener(_updateAverageAirVelocity15m);
    airVelocity15m3Controller.addListener(_updateAverageAirVelocity15m);

    // Слушатели для контроллеров относительной влажности
    relativeHumidity1Controller.addListener(_updateAverageRelativeHumidity);
    relativeHumidity2Controller.addListener(_updateAverageRelativeHumidity);
    relativeHumidity3Controller.addListener(_updateAverageRelativeHumidity);

    // Слушатели для контроллеров интенсивности теплового излучения на 0.5 м
    thermalRadiationIntensity05m1Controller.addListener(_updateAverageThermalRadiationIntensity05m);
    thermalRadiationIntensity05m2Controller.addListener(_updateAverageThermalRadiationIntensity05m);
    thermalRadiationIntensity05m3Controller.addListener(_updateAverageThermalRadiationIntensity05m);
  }

  void _updateAverageAirVelocity01m() {
    double v1 = double.tryParse(airVelocity01m1Controller.text) ?? 0;
    double v2 = double.tryParse(airVelocity01m2Controller.text) ?? 0;
    double v3 = double.tryParse(airVelocity01m3Controller.text) ?? 0;

    double averageV = (v1 + v2 + v3) / 3;
    averageAirVelocity01mController.text = averageV.toStringAsFixed(2);
  }

  void _updateAverageAirVelocity15m() {
    double v1 = double.tryParse(airVelocity15m1Controller.text) ?? 0;
    double v2 = double.tryParse(airVelocity15m2Controller.text) ?? 0;
    double v3 = double.tryParse(airVelocity15m3Controller.text) ?? 0;

    double averageV = (v1 + v2 + v3) / 3;
    averageAirVelocity15mController.text = averageV.toStringAsFixed(2);
  }

  void _updateAverageRelativeHumidity() {
    double h1 = double.tryParse(relativeHumidity1Controller.text) ?? 0;
    double h2 = double.tryParse(relativeHumidity2Controller.text) ?? 0;
    double h3 = double.tryParse(relativeHumidity3Controller.text) ?? 0;

    double averageH = (h1 + h2 + h3) / 3;
    averageRelativeHumidityController.text = averageH.toStringAsFixed(2);
  }

  void _updateAverageThermalRadiationIntensity05m() {
    double r1 = double.tryParse(thermalRadiationIntensity05m1Controller.text) ?? 0;
    double r2 = double.tryParse(thermalRadiationIntensity05m2Controller.text) ?? 0;
    double r3 = double.tryParse(thermalRadiationIntensity05m3Controller.text) ?? 0;

    double averageR = (r1 + r2 + r3) / 3;
    averageThermalRadiationIntensity05mController.text = averageR.toStringAsFixed(2);


    // Слушатели для контроллеров интенсивности теплового излучения на 1 м
    thermalRadiationIntensity1m1Controller.addListener(_updateAverageThermalRadiationIntensity1m);
    thermalRadiationIntensity1m2Controller.addListener(_updateAverageThermalRadiationIntensity1m);
    thermalRadiationIntensity1m3Controller.addListener(_updateAverageThermalRadiationIntensity1m);

    // Слушатели для контроллеров интенсивности теплового излучения на 15 м
    thermalRadiationIntensity15m1Controller.addListener(_updateAverageThermalRadiationIntensity15m);
    thermalRadiationIntensity15m2Controller.addListener(_updateAverageThermalRadiationIntensity15m);
    thermalRadiationIntensity15m3Controller.addListener(_updateAverageThermalRadiationIntensity15m);

    // Слушатели для контроллеров дозы теплового излучения
    thermalRadiationExposureDose1Controller.addListener(_updateAverageThermalRadiationExposureDose);
    thermalRadiationExposureDose2Controller.addListener(_updateAverageThermalRadiationExposureDose);
    thermalRadiationExposureDose3Controller.addListener(_updateAverageThermalRadiationExposureDose);
  }

  void _updateAverageThermalRadiationIntensity1m() {
    double r1 = double.tryParse(thermalRadiationIntensity1m1Controller.text) ?? 0;
    double r2 = double.tryParse(thermalRadiationIntensity1m2Controller.text) ?? 0;
    double r3 = double.tryParse(thermalRadiationIntensity1m3Controller.text) ?? 0;

    double averageR = (r1 + r2 + r3) / 3;
    averageThermalRadiationIntensity1mController.text = averageR.toStringAsFixed(2);
  }

  void _updateAverageThermalRadiationIntensity15m() {
    double r1 = double.tryParse(thermalRadiationIntensity15m1Controller.text) ?? 0;
    double r2 = double.tryParse(thermalRadiationIntensity15m2Controller.text) ?? 0;
    double r3 = double.tryParse(thermalRadiationIntensity15m3Controller.text) ?? 0;

    double averageR = (r1 + r2 + r3) / 3;
    averageThermalRadiationIntensity15mController.text = averageR.toStringAsFixed(2);
  }

  void _updateAverageThermalRadiationExposureDose() {
    double d1 = double.tryParse(thermalRadiationExposureDose1Controller.text) ?? 0;
    double d2 = double.tryParse(thermalRadiationExposureDose2Controller.text) ?? 0;
    double d3 = double.tryParse(thermalRadiationExposureDose3Controller.text) ?? 0;

    double averageD = (d1 + d2 + d3) / 3;
    averageThermalRadiationExposureDoseController.text = averageD.toStringAsFixed(2);
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
    organizationIdController.text =
        (widget.microclimate?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text = (widget.microclimate?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
        (widget.microclimate?.workplaceId ?? widget.protocolName?.workplaceId)!;
    parameterNameController.text =
        (widget.microclimate?.parameterName ?? widget.protocolName?.protocolName)!;
    protocolIdController.text =
        (widget.microclimate?.protocolId ?? widget.protocolName?.protocolId)!;
    familyNameController.text = widget.microclimate?.familyName ?? '';

    airTemperature01m1Controller.text = widget.microclimate?.airTemperature01m1 ?? '';
    airTemperature01m2Controller.text = widget.microclimate?.airTemperature01m2 ?? '';
    airTemperature01m3Controller.text = widget.microclimate?.airTemperature01m3 ?? '';
    averageAirTemperature01mController.text = widget.microclimate?.averageAirTemperature01m ?? '';

    airTemperature15m1Controller.text = widget.microclimate?.airTemperature15m1 ?? '';
    airTemperature15m2Controller.text = widget.microclimate?.airTemperature15m2 ?? '';
    airTemperature15m3Controller.text = widget.microclimate?.airTemperature15m3 ?? '';
    averageAirTemperature15mController.text = widget.microclimate?.averageAirTemperature15m ?? '';

    tncIndex01m1Controller.text = widget.microclimate?.tncIndex01m1 ?? '';
    tncIndex01m2Controller.text = widget.microclimate?.tncIndex01m2 ?? '';
    tncIndex01m3Controller.text = widget.microclimate?.tncIndex01m3 ?? '';
    averageTncIndex01mController.text = widget.microclimate?.averageTncIndex01m ?? '';

    tncIndex15m1Controller.text = widget.microclimate?.tncIndex15m1 ?? '';
    tncIndex15m2Controller.text = widget.microclimate?.tncIndex15m2 ?? '';
    tncIndex15m3Controller.text = widget.microclimate?.tncIndex15m3 ?? '';
    averageTncIndex15mController.text = widget.microclimate?.averageTncIndex15m ?? '';

    airVelocity01m1Controller.text = widget.microclimate?.airVelocity01m1 ?? '';
    airVelocity01m2Controller.text = widget.microclimate?.airVelocity01m2 ?? '';
    airVelocity01m3Controller.text = widget.microclimate?.airVelocity01m3 ?? '';
    averageAirVelocity01mController.text = widget.microclimate?.averageAirVelocity01m ?? '';

    airVelocity15m1Controller.text = widget.microclimate?.airVelocity15m1 ?? '';
    airVelocity15m2Controller.text = widget.microclimate?.airVelocity15m2 ?? '';
    airVelocity15m3Controller.text = widget.microclimate?.airVelocity15m3 ?? '';
    averageAirVelocity15mController.text = widget.microclimate?.averageAirVelocity15m ?? '';

    relativeHumidity1Controller.text = widget.microclimate?.relativeHumidity1 ?? '';
    relativeHumidity2Controller.text = widget.microclimate?.relativeHumidity2 ?? '';
    relativeHumidity3Controller.text = widget.microclimate?.relativeHumidity3 ?? '';
    averageRelativeHumidityController.text = widget.microclimate?.averageRelativeHumidity ?? '';

    thermalRadiationIntensity05m1Controller.text = widget.microclimate?.thermalRadiationIntensity05m1 ?? '';
    thermalRadiationIntensity05m2Controller.text = widget.microclimate?.thermalRadiationIntensity05m2 ?? '';
    thermalRadiationIntensity05m3Controller.text = widget.microclimate?.thermalRadiationIntensity05m3 ?? '';
    averageThermalRadiationIntensity05mController.text = widget.microclimate?.averageThermalRadiationIntensity05m ?? '';

    thermalRadiationIntensity1m1Controller.text = widget.microclimate?.thermalRadiationIntensity1m1 ?? '';
    thermalRadiationIntensity1m2Controller.text = widget.microclimate?.thermalRadiationIntensity1m2 ?? '';
    thermalRadiationIntensity1m3Controller.text = widget.microclimate?.thermalRadiationIntensity1m3 ?? '';
    averageThermalRadiationIntensity1mController.text = widget.microclimate?.averageThermalRadiationIntensity1m ?? '';

    thermalRadiationIntensity15m1Controller.text = widget.microclimate?.thermalRadiationIntensity15m1 ?? '';
    thermalRadiationIntensity15m2Controller.text = widget.microclimate?.thermalRadiationIntensity15m2 ?? '';
    thermalRadiationIntensity15m3Controller.text = widget.microclimate?.thermalRadiationIntensity15m3 ?? '';
    averageThermalRadiationIntensity15mController.text = widget.microclimate?.averageThermalRadiationIntensity15m ?? '';

    thermalRadiationExposureDose1Controller.text = widget.microclimate?.thermalRadiationExposureDose1 ?? '';
    thermalRadiationExposureDose2Controller.text = widget.microclimate?.thermalRadiationExposureDose2 ?? '';
    thermalRadiationExposureDose3Controller.text = widget.microclimate?.thermalRadiationExposureDose3 ?? '';
    averageThermalRadiationExposureDoseController.text = widget.microclimate?.averageThermalRadiationExposureDose ?? '';

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
                  controller: airTemperature01m1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 0.1м №1',
                    hintText: 'Введите значение температуры воздуха на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airTemperature01m2Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 0.1м №2',
                    hintText: 'Введите значение температуры воздуха на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airTemperature01m3Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 0.1м №3',
                    hintText: 'Введите значение температуры воздуха на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageAirTemperature01mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Средняя температура на высоте 0,1м',
                    hintText: 'Введите среднее значение температуры воздуха на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airTemperature15m1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 1.5м №1',
                    hintText: 'Введите значение температуры воздуха на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airTemperature15m2Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 1.5м №2',
                    hintText: 'Введите значение температуры воздуха на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airTemperature15m3Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Температура воздуха на высоте 1.5м №3',
                    hintText: 'Введите значение температуры воздуха на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageAirTemperature15mController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Средняя температура на высоте 1.5м',
                    hintText: 'Введите среднее значение температуры воздуха на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex01m1Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 0.1м №1',
                    hintText: 'Введите значение ТНС на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex01m2Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 0.1м №2',
                    hintText: 'Введите значение ТНС на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex01m3Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 0.1м №3',
                    hintText: 'Введите значение ТНС на высоте 0.1м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageTncIndex01mController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее ТНС на высоте 0.1м',
                    hintText: 'Введите среднее значение ТНС',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex15m1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 1.5м №1',
                    hintText: 'Введите значение ТНС на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex15m2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 1.5м №2',
                    hintText: 'Введите значение ТНС на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: tncIndex15m3Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение ТНС на высоте 1.5м №3',
                    hintText: 'Введите значение ТНС на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageTncIndex15mController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее ТНС на высоте 1.5м',
                    hintText: 'Введите среднее значение ТНС',
                  ),
                ),
                // Поля для скорости воздушного потока на высоте 0.1м
                const SizedBox(
                  height: 30,
                ),
                const Text('Скорость воздушного потока на высоте 0.1м'),
                TextField(
                  controller: airVelocity01m1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость на высоте 0.1м №1',
                    hintText: 'Введите скорость 1',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airVelocity01m2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость на высоте 0.1м №2',
                    hintText: 'Введите скорость 2',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airVelocity01m3Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость на высоте 0.1м №3',
                    hintText: 'Введите скорость 3',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageAirVelocity01mController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Средняя скорость на высоте 0.1м',
                    hintText: 'Введите среднее значение скорости',
                  ),
                ),
                // Поля для скорости воздушного потока на высоте 1.5м
                const SizedBox(
                  height: 30,
                ),
                const Text('Скорость воздушного потока на высоте 1.5м'),
                TextField(
                  controller: airVelocity15m1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость воздушного потока на высоте 1.5м №1',
                    hintText: 'Введите скорость на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airVelocity15m2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость воздушного потока на высоте 1.5м №2',
                    hintText: 'Введите скорость на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: airVelocity15m3Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Скорость воздушного потока на высоте 1.5м №3',
                    hintText: 'Введите скорость на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageAirVelocity15mController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Средняя скорость на высоте 1.5м',
                    hintText: 'Введите среднее значение скорости',
                  ),
                ),

                // Поля для относительной влажности
                const SizedBox(
                  height: 30,
                ),
                const Text('Относительная влажность'),
                TextField(
                  controller: relativeHumidity1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение относительной влажности №1',
                    hintText: 'Введите значение относительной влажность №1',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: relativeHumidity2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Значение относительной влажности №2',
                    hintText: 'Введите значение влажность №2',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: relativeHumidity3Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Значение относительной влажности №3",
                        hintText: "Введите значение относительной влажность 3")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: averageRelativeHumidityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Средняя относительная влажность",
                        hintText: "Введите среднее значение относительной влажности")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity05m1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-0,5 м), Вт/м2 №1",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-0,5 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity05m2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-0,5 м), Вт/м2 №2",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-0,5 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity05m3Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-0,5 м), Вт/м2 №3",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-0,5 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: averageThermalRadiationIntensity05mController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText:
                            "Среднее значение интенсивности теплового излучения (h-0,5 м), Вт/м2",
                        hintText:
                            "Введите Среднее значение интенсивности теплового излучения (h-0,5 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity1m1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-1 м), Вт/м2 №1",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity1m2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-1 м), Вт/м2 №2",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity1m3Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-1 м), Вт/м2 №3",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: averageThermalRadiationIntensity1mController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText:
                            "Среднее значение интенсивности теплового излучения (h-1 м), Вт/м2",
                        hintText:
                            "Введите среднее значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity15m1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-1,5 м), Вт/м2 №1",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity15m2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-1,5 м), Вт/м2 №2",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationIntensity15m3Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Интенсивность теплового излучения (h-1,5 м), Вт/м2 №3",
                        hintText:
                            "Введите значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: averageThermalRadiationIntensity15mController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText:
                            "Среднее значение интенсивности теплового излучения (h-1,5 м), Вт/м2",
                        hintText:
                            "Введите среднее значение интенсивности теплового излучения (h-1 м), Вт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationExposureDose1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Экспозиционная доза теплового излучения, Вт·ч №1",
                        hintText:
                            "Введите значение экспозиционной дозы теплового излучения, Вт·чВт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationExposureDose2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Экспозиционная доза теплового излучения, Вт·ч №2",
                        hintText:
                            "Введите значение экспозиционной дозы теплового излучения, Вт·чВт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: thermalRadiationExposureDose3Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Экспозиционная доза теплового излучения, Вт·ч №3",
                        hintText:
                            "Введите значение экспозиционной дозы теплового излучения, Вт·чВт/м2")),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: averageThermalRadiationExposureDoseController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Среднее значение экспозиционной дозы теплового излучения, Вт·ч",
                        hintText:
                            "Введите Среднее значение экспозиционной дозы теплового излучения, Вт·чВт/м2")),
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

                    final airTemperature01m1 = airTemperature01m1Controller.text;
                    final airTemperature01m2 = airTemperature01m2Controller.text;
                    final airTemperature01m3 = airTemperature01m3Controller.text;
                    final averageAirTemperature01m = averageAirTemperature01mController.text;

                    final airTemperature15m1 = airTemperature15m1Controller.text;
                    final airTemperature15m2 = airTemperature15m2Controller.text;
                    final airTemperature15m3 = airTemperature15m3Controller.text;
                    final averageAirTemperature15m = averageAirTemperature15mController.text;

                    final tncIndex01m1 = tncIndex01m1Controller.text;
                    final tncIndex01m2 = tncIndex01m2Controller.text;
                    final tncIndex01m3 = tncIndex01m3Controller.text;
                    final averageTncIndex01m = averageTncIndex01mController.text;

                    final tncIndex15m1 = tncIndex15m1Controller.text;
                    final tncIndex15m2 = tncIndex15m2Controller.text;
                    final tncIndex15m3 = tncIndex15m3Controller.text;
                    final averageTncIndex15m = averageTncIndex15mController.text;

                    final airVelocity01m1 = airVelocity01m1Controller.text;
                    final airVelocity01m2 = airVelocity01m2Controller.text;
                    final airVelocity01m3 = airVelocity01m3Controller.text;
                    final averageAirVelocity01m = averageAirVelocity01mController.text;

                    final airVelocity15m1 = airVelocity15m1Controller.text;
                    final airVelocity15m2 = airVelocity15m2Controller.text;
                    final airVelocity15m3 = airVelocity15m3Controller.text;
                    final averageAirVelocity15m = averageAirVelocity15mController.text;

                    final relativeHumidity1 = relativeHumidity1Controller.text;
                    final relativeHumidity2 = relativeHumidity2Controller.text;
                    final relativeHumidity3 = relativeHumidity3Controller.text;
                    final averageRelativeHumidity = averageRelativeHumidityController.text;

                    final thermalRadiationIntensity05m1 =
                        thermalRadiationIntensity05m1Controller.text;
                    final thermalRadiationIntensity05m2 =
                        thermalRadiationIntensity05m2Controller.text;
                    final thermalRadiationIntensity05m3 =
                        thermalRadiationIntensity05m3Controller.text;
                    final averageThermalRadiationIntensity05m =
                        averageThermalRadiationIntensity05mController.text;

                    final thermalRadiationIntensity1m1 =
                        thermalRadiationIntensity1m1Controller.text;
                    final thermalRadiationIntensity1m2 =
                        thermalRadiationIntensity1m2Controller.text;
                    final thermalRadiationIntensity1m3 =
                        thermalRadiationIntensity1m3Controller.text;
                    final averageThermalRadiationIntensity1m =
                        averageThermalRadiationIntensity1mController.text;

                    final thermalRadiationIntensity15m1 =
                        thermalRadiationIntensity15m1Controller.text;
                    final thermalRadiationIntensity15m2 =
                        thermalRadiationIntensity15m2Controller.text;
                    final thermalRadiationIntensity15m3 =
                        thermalRadiationIntensity15m3Controller.text;
                    final averageThermalRadiationIntensity15m =
                        averageThermalRadiationIntensity15mController.text;

                    final thermalRadiationExposureDose1 =
                        thermalRadiationExposureDose1Controller.text;
                    final thermalRadiationExposureDose2 =
                        thermalRadiationExposureDose2Controller.text;
                    final thermalRadiationExposureDose3 =
                        thermalRadiationExposureDose3Controller.text;
                    final averageThermalRadiationExposureDose =
                        averageThermalRadiationExposureDoseController.text;

                    if (organizationName.isNotEmpty) {
                      var microclimate = MicroclimateProtocolModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        measurementDate: measurementDate,
                        workplace: workplaceName,
                        workplaceId: workplaceId,
                        parameterName: parameterName,
                        protocolId: protocolId,
                        familyName: familyName,
                        airTemperature01m1: airTemperature01m1,
                        airTemperature01m2: airTemperature01m2,
                        airTemperature01m3: airTemperature01m3,
                        averageAirTemperature01m: averageAirTemperature01m,
                        airTemperature15m1: airTemperature15m1,
                        airTemperature15m2: airTemperature15m2,
                        airTemperature15m3: airTemperature15m3,
                        averageAirTemperature15m: averageAirTemperature15m,
                        tncIndex01m1: tncIndex01m1,
                        tncIndex01m2: tncIndex01m2,
                        tncIndex01m3: tncIndex01m3,
                        averageTncIndex01m: averageTncIndex01m,
                        tncIndex15m1: tncIndex15m1,
                        tncIndex15m2: tncIndex15m2,
                        tncIndex15m3: tncIndex15m3,
                        averageTncIndex15m: averageTncIndex15m,
                        airVelocity01m1: airVelocity01m1,
                        airVelocity01m2: airVelocity01m2,
                        airVelocity01m3: airVelocity01m3,
                        averageAirVelocity01m: averageAirVelocity01m,
                        airVelocity15m1: airVelocity15m1,
                        airVelocity15m2: airVelocity15m2,
                        airVelocity15m3: airVelocity15m3,
                        averageAirVelocity15m: averageAirVelocity15m,
                        relativeHumidity1: relativeHumidity1,
                        relativeHumidity2: relativeHumidity2,
                        relativeHumidity3: relativeHumidity3,
                        averageRelativeHumidity: averageRelativeHumidity,
                        thermalRadiationIntensity05m1: thermalRadiationIntensity05m1,
                        thermalRadiationIntensity05m2: thermalRadiationIntensity05m2,
                        thermalRadiationIntensity05m3: thermalRadiationIntensity05m3,
                        averageThermalRadiationIntensity05m: averageThermalRadiationIntensity05m,
                        thermalRadiationIntensity1m1: thermalRadiationIntensity1m1,
                        thermalRadiationIntensity1m2: thermalRadiationIntensity1m2,
                        thermalRadiationIntensity1m3: thermalRadiationIntensity1m3,
                        averageThermalRadiationIntensity1m: averageThermalRadiationIntensity1m,
                        thermalRadiationIntensity15m1: thermalRadiationIntensity15m1,
                        thermalRadiationIntensity15m2: thermalRadiationIntensity15m2,
                        thermalRadiationIntensity15m3: thermalRadiationIntensity15m3,
                        averageThermalRadiationIntensity15m: averageThermalRadiationIntensity15m,
                        thermalRadiationExposureDose1: thermalRadiationExposureDose1,
                        thermalRadiationExposureDose2: thermalRadiationExposureDose2,
                        thermalRadiationExposureDose3: thermalRadiationExposureDose3,
                        averageThermalRadiationExposureDose: averageThermalRadiationExposureDose,
                      );
                      BlocProvider.of<MicroclimateProtocolBloc>(context).add(selectedId == null
                          ? MicroclimateEvent.addMicroclimate(microclimate: microclimate)
                          : MicroclimateEvent.update(microclimate: microclimate));
                      selectedId = null;
                      organizationNameController.clear();
                      organizationIdController.clear();
                      workplaceController.clear();
                      parameterNameController.clear();
                      airTemperature01m1Controller.clear();
                      airTemperature01m2Controller.clear();
                      airTemperature01m3Controller.clear();
                      airTemperature15m1Controller.clear();
                      airTemperature15m2Controller.clear();
                      airTemperature15m3Controller.clear();

                      tncIndex01m1Controller.clear();
                      tncIndex01m2Controller.clear();
                      tncIndex01m3Controller.clear();

                      tncIndex15m1Controller.clear();
                      tncIndex15m2Controller.clear();
                      tncIndex15m3Controller.clear();

                      airVelocity01m1Controller.clear();
                      airVelocity01m2Controller.clear();
                      airVelocity01m3Controller.clear();

                      airVelocity15m1Controller.clear();
                      airVelocity15m2Controller.clear();
                      airVelocity15m3Controller.clear();

                      relativeHumidity1Controller.clear();
                      relativeHumidity2Controller.clear();
                      relativeHumidity3Controller.clear();

                      thermalRadiationIntensity05m1Controller.clear();
                      thermalRadiationIntensity05m2Controller.clear();
                      thermalRadiationIntensity05m3Controller.clear();
                      averageThermalRadiationIntensity05mController.clear();

                      thermalRadiationIntensity1m1Controller.clear();
                      thermalRadiationIntensity1m2Controller.clear();
                      thermalRadiationIntensity1m3Controller.clear();
                      averageThermalRadiationIntensity1mController.clear();

                      thermalRadiationIntensity15m1Controller.clear();
                      thermalRadiationIntensity15m2Controller.clear();
                      thermalRadiationIntensity15m3Controller.clear();
                      averageThermalRadiationIntensity15mController.clear();

                      thermalRadiationExposureDose1Controller.clear();
                      thermalRadiationExposureDose2Controller.clear();
                      thermalRadiationExposureDose3Controller.clear();
                      averageThermalRadiationExposureDoseController.clear();

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
