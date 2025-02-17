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
  final protocolIdController = TextEditingController();
  final familyNameController = TextEditingController();

  final uvAIntensityH05_101Controller = TextEditingController();
  final uvAIntensityH05_102Controller = TextEditingController();
  final uvAIntensityH05_103Controller = TextEditingController();
  final averageUvAIntensityH05_10Controller = TextEditingController();

  final uvAIntensityH151Controller = TextEditingController();
  final uvAIntensityH152Controller = TextEditingController();
  final uvAIntensityH153Controller = TextEditingController();
  final averageUvAIntensityH15Controller = TextEditingController();

  final uvBIntensityH05_101Controller = TextEditingController();
  final uvBIntensityH05_102Controller = TextEditingController();
  final uvBIntensityH05_103Controller = TextEditingController();
  final averageUvBIntensityH05_10Controller = TextEditingController();

  final uvBIntensityH151Controller = TextEditingController();
  final uvBIntensityH152Controller = TextEditingController();
  final uvBIntensityH153Controller = TextEditingController();
  final averageUvBIntensityH15Controller = TextEditingController();

  int? selectedId;
  Color _color = Colors.white; // Исходный цвет

  @override
  void initState() {
    super.initState();

    // Инициализация значений из виджета
    uvAIntensityH05_101Controller.text = widget.ultravioletRadiation?.uvAIntensityH05_101 ?? '';
    uvAIntensityH05_102Controller.text = widget.ultravioletRadiation?.uvAIntensityH05_102 ?? '';
    uvAIntensityH05_103Controller.text = widget.ultravioletRadiation?.uvAIntensityH05_103 ?? '';
    averageUvAIntensityH05_10Controller.text =
        widget.ultravioletRadiation?.uvAIntensityH05_103 ?? '';

    uvAIntensityH151Controller.text = widget.ultravioletRadiation?.uvAIntensityH151 ?? '';
    uvAIntensityH152Controller.text = widget.ultravioletRadiation?.uvAIntensityH152 ?? '';
    uvAIntensityH153Controller.text = widget.ultravioletRadiation?.uvAIntensityH153 ?? '';
    averageUvAIntensityH15Controller.text = widget.ultravioletRadiation?.uvAIntensityH153 ?? '';

    uvBIntensityH05_101Controller.text = widget.ultravioletRadiation?.uvBIntensityH05_101 ?? '';
    uvBIntensityH05_102Controller.text = widget.ultravioletRadiation?.uvBIntensityH05_102 ?? '';
    uvBIntensityH05_103Controller.text = widget.ultravioletRadiation?.uvBIntensityH05_103 ?? '';
    averageUvBIntensityH05_10Controller.text =
        widget.ultravioletRadiation?.uvBIntensityH05_103 ?? '';

    uvBIntensityH151Controller.text = widget.ultravioletRadiation?.uvBIntensityH151 ?? '';
    uvBIntensityH152Controller.text = widget.ultravioletRadiation?.uvBIntensityH152 ?? '';
    uvBIntensityH153Controller.text = widget.ultravioletRadiation?.uvBIntensityH153 ?? '';
    averageUvBIntensityH15Controller.text = widget.ultravioletRadiation?.uvBIntensityH153 ?? '';

    // Слушатели для контроллеров
    uvAIntensityH05_101Controller.addListener(_updateAverageUvAIntensityH05);
    uvAIntensityH05_102Controller.addListener(_updateAverageUvAIntensityH05);
    uvAIntensityH05_103Controller.addListener(_updateAverageUvAIntensityH05);

    uvAIntensityH151Controller.addListener(_updateAverageUvAIntensityH15);
    uvAIntensityH152Controller.addListener(_updateAverageUvAIntensityH15);
    uvAIntensityH153Controller.addListener(_updateAverageUvAIntensityH15);

    uvBIntensityH05_101Controller.addListener(_updateAverageUvBIntensityH05);
    uvBIntensityH05_102Controller.addListener(_updateAverageUvBIntensityH05);
    uvBIntensityH05_103Controller.addListener(_updateAverageUvBIntensityH05);

    uvBIntensityH151Controller.addListener(_updateAverageUvBIntensityH15);
    uvBIntensityH152Controller.addListener(_updateAverageUvBIntensityH15);
    uvBIntensityH153Controller.addListener(_updateAverageUvBIntensityH15);
  }

  void _updateAverageUvAIntensityH05() {
    double h101 = double.tryParse(uvAIntensityH05_101Controller.text) ?? 0;
    double h102 = double.tryParse(uvAIntensityH05_102Controller.text) ?? 0;
    double h103 = double.tryParse(uvAIntensityH05_103Controller.text) ?? 0;

    double average = (h101 + h102 + h103) / 3;
    averageUvAIntensityH05_10Controller.text = average.toStringAsFixed(2);
  }

  void _updateAverageUvAIntensityH15() {
    double h151 = double.tryParse(uvAIntensityH151Controller.text) ?? 0;
    double h152 = double.tryParse(uvAIntensityH152Controller.text) ?? 0;
    double h153 = double.tryParse(uvAIntensityH153Controller.text) ?? 0;

    double average = (h151 + h152 + h153) / 3;
    averageUvAIntensityH15Controller.text = average.toStringAsFixed(2);
  }

  void _updateAverageUvBIntensityH05() {
    double h101 = double.tryParse(uvBIntensityH05_101Controller.text) ?? 0;
    double h102 = double.tryParse(uvBIntensityH05_102Controller.text) ?? 0;
    double h103 = double.tryParse(uvBIntensityH05_103Controller.text) ?? 0;

    double average = (h101 + h102 + h103) / 3;
    averageUvBIntensityH05_10Controller.text = average.toStringAsFixed(2);
  }

  void _updateAverageUvBIntensityH15() {
    double h151 = double.tryParse(uvBIntensityH151Controller.text) ?? 0;
    double h152 = double.tryParse(uvBIntensityH152Controller.text) ?? 0;
    double h153 = double.tryParse(uvBIntensityH153Controller.text) ?? 0;

    double average = (h151 + h152 + h153) / 3;
    averageUvBIntensityH15Controller.text = average.toStringAsFixed(2);
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
    protocolIdController.text =
        (widget.ultravioletRadiation?.protocolId ?? widget.protocolName?.protocolId)!;
    familyNameController.text = widget.ultravioletRadiation?.familyName ?? '';

    uvAIntensityH05_101Controller.text = widget.ultravioletRadiation?.uvAIntensityH05_101 ?? '';
    uvAIntensityH05_102Controller.text = widget.ultravioletRadiation?.uvAIntensityH05_102 ?? '';
    uvAIntensityH05_103Controller.text = widget.ultravioletRadiation?.uvAIntensityH05_103 ?? '';
    averageUvAIntensityH05_10Controller.text =
        widget.ultravioletRadiation?.averageUvAIntensityH05_10 ?? '';

    uvAIntensityH151Controller.text = widget.ultravioletRadiation?.uvAIntensityH151 ?? '';
    uvAIntensityH152Controller.text = widget.ultravioletRadiation?.uvAIntensityH152 ?? '';
    uvAIntensityH153Controller.text = widget.ultravioletRadiation?.uvAIntensityH153 ?? '';
    averageUvAIntensityH15Controller.text = widget.ultravioletRadiation?.averageUvAIntensityH15 ?? '';

    uvBIntensityH05_101Controller.text = widget.ultravioletRadiation?.uvBIntensityH05_101 ?? '';
    uvBIntensityH05_102Controller.text = widget.ultravioletRadiation?.uvBIntensityH05_102 ?? '';
    uvBIntensityH05_103Controller.text = widget.ultravioletRadiation?.uvBIntensityH05_103 ?? '';
    averageUvBIntensityH05_10Controller.text =
        widget.ultravioletRadiation?.averageUvBIntensityH05_10 ?? '';

    uvBIntensityH151Controller.text = widget.ultravioletRadiation?.uvBIntensityH151 ?? '';
    uvBIntensityH152Controller.text = widget.ultravioletRadiation?.uvBIntensityH152 ?? '';
    uvBIntensityH153Controller.text = widget.ultravioletRadiation?.uvBIntensityH153 ?? '';
    averageUvBIntensityH15Controller.text = widget.ultravioletRadiation?.averageUvBIntensityH15 ?? '';

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
                  controller: uvAIntensityH05_101Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 0.5 - 1.0м №1',
                    hintText: 'Введите значение УФ-А излучения на высоте 0.5 - 1.0м №1',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvAIntensityH05_102Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 0.5 - 1.0м №2',
                    hintText: 'Введите значение УФ-А излучения на высоте 0.5 - 1.0м №2',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvAIntensityH05_103Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 0.5 - 1.0м №3',
                    hintText: 'Введите значение УФ-А излучения на высоте 0.5 - 1.0м №3',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageUvAIntensityH05_10Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среденее значение УФ-А излучение на высоте 0.5 - 1.0м',
                    hintText: 'Введите среденее значение УФ-А излучения на высоте 0.5 - 1.0м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvAIntensityH151Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 1.5м №1',
                    hintText: 'Введите значение УФ-А излучения на высоте 1.5м №1',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvAIntensityH152Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 1.5м №2',
                    hintText: 'Введите значение УФ-А излучения на высоте 1.5м №2',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvAIntensityH153Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-А излучение на высоте 1.5м №3',
                    hintText: 'Введите значение УФ-А излучения на высоте 1.5м №3',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageUvAIntensityH15Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее значение УФ-А излучение на высоте 1.5м',
                    hintText: 'Введите значение среднее значение УФ-А излучения на высоте 1.5м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH05_101Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 0.5 - 1.0м №1',
                    hintText: 'Введите значение УФ-В излучения на высоте 0.5 - 1.0м №1',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH05_102Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 0.5 - 1.0м №2',
                    hintText: 'Введите значение УФ-В излучения на высоте 0.5 - 1.0м №2',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH05_103Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 0.5 - 1.0м №3',
                    hintText: 'Введите значение УФ-В излучения на высоте 0.5 - 1.0м №3',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageUvBIntensityH05_10Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее значение УФ-В излучение на высоте 0.5 - 1.0м',
                    hintText: 'Введите среднее значение УФ-В излучения на высоте 0.5 - 1.0м',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH151Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 1.5м №1',
                    hintText: 'Введите значение УФ-В излучения на высоте 1.5м №1',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH152Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 1.5м №2',
                    hintText: 'Введите значение УФ-В излучения на высоте 1.5м №2',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: uvBIntensityH153Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'УФ-В излучение на высоте 1.5м №3',
                    hintText: 'Введите значение УФ-В излучения на высоте 1.5м №3',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: averageUvBIntensityH15Controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Среднее значение УФ-В излучение на высоте 1.5м',
                    hintText: 'Введите среднее значение УФ-В излучения на высоте 1.5м',
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

                    final uvAIntensityH05_101 = uvAIntensityH05_101Controller.text;
                    final uvAIntensityH05_102 = uvAIntensityH05_102Controller.text;
                    final uvAIntensityH05_103 = uvAIntensityH05_103Controller.text;
                    final averageUvAIntensityH05_10 = averageUvAIntensityH05_10Controller.text;

                    final uvAIntensityH151 = uvAIntensityH151Controller.text;
                    final uvAIntensityH152 = uvAIntensityH152Controller.text;
                    final uvAIntensityH153 = uvAIntensityH153Controller.text;
                    final averageUvAIntensityH15 = averageUvAIntensityH15Controller.text;

                    final uvBIntensityH05_101 = uvBIntensityH05_101Controller.text;
                    final uvBIntensityH05_102 = uvBIntensityH05_102Controller.text;
                    final uvBIntensityH05_103 = uvBIntensityH05_103Controller.text;
                    final averageUvBIntensityH05_10 = averageUvBIntensityH05_10Controller.text;

                    final uvBIntensityH151 = uvBIntensityH151Controller.text;
                    final uvBIntensityH152 = uvBIntensityH152Controller.text;
                    final uvBIntensityH153 = uvBIntensityH153Controller.text;
                    final averageUvBIntensityH15 = averageUvBIntensityH15Controller.text;

                    if (organizationName.isNotEmpty) {
                      var ultravioletRadiation = UltravioletRadiationProtocolModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        measurementDate: measurementDate,
                        workplace: workplaceName,
                        workplaceId: workplaceId,
                        parameterName: parameterName,
                        protocolId: protocolId,
                        familyName: familyName,
                        uvAIntensityH05_101: uvAIntensityH05_101,
                        uvAIntensityH05_102: uvAIntensityH05_102,
                        uvAIntensityH05_103: uvAIntensityH05_103,
                        averageUvAIntensityH05_10: averageUvAIntensityH05_10,
                        uvAIntensityH151: uvAIntensityH151,
                        uvAIntensityH152: uvAIntensityH152,
                        uvAIntensityH153: uvAIntensityH153,
                        averageUvAIntensityH15: averageUvAIntensityH15,
                        uvBIntensityH05_101: uvBIntensityH05_101,
                        uvBIntensityH05_102: uvBIntensityH05_102,
                        uvBIntensityH05_103: uvBIntensityH05_103,
                        averageUvBIntensityH05_10: averageUvBIntensityH05_10,
                        uvBIntensityH151: uvBIntensityH151,
                        uvBIntensityH152: uvBIntensityH152,
                        uvBIntensityH153: uvBIntensityH153,
                        averageUvBIntensityH15: averageUvBIntensityH15,
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
                      familyNameController.clear();
                      uvAIntensityH05_101Controller.clear();
                      uvAIntensityH05_102Controller.clear();
                      uvAIntensityH05_103Controller.clear();

                      uvAIntensityH151Controller.clear();
                      uvAIntensityH152Controller.clear();
                      uvAIntensityH153Controller.clear();

                      uvBIntensityH05_101Controller.clear();
                      uvBIntensityH05_102Controller.clear();
                      uvBIntensityH05_103Controller.clear();

                      uvBIntensityH151Controller.clear();
                      uvBIntensityH152Controller.clear();
                      uvBIntensityH153Controller.clear();

                      uvBIntensityH05_101Controller.clear();
                      uvBIntensityH05_102Controller.clear();
                      uvBIntensityH05_103Controller.clear();

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
