import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/intensity_work_process_model/intensity_work_process_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import 'bloc_intensity_work_process.dart';
import 'intensity_work_process_event.dart';

class AddIntensityWorkProcessDialog extends StatefulWidget {
  const AddIntensityWorkProcessDialog(
      {super.key, this.intensityWorkProcess, required this.protocolName});

  final IntensityWorkProcessModel? intensityWorkProcess;
  final ProtocolNameModel? protocolName;

  @override
  State<AddIntensityWorkProcessDialog> createState() => _AddIntensityWorkProcessDialogState();
}

class _AddIntensityWorkProcessDialogState extends State<AddIntensityWorkProcessDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final measurementDateController = TextEditingController();
  final workplaceController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final parameterNameController = TextEditingController();
  final signalDensityController = TextEditingController();
  final simultaneousObjectsCountController = TextEditingController();
  final opticalDeviceUsageController = TextEditingController();
  final voiceApparatusLoadHoursController = TextEditingController();
  final auditoryAnalyzerLoadController = TextEditingController();
  final focusedObservationDurationController = TextEditingController();
  final monotonyLoadsController = TextEditingController();
  final elementsCountController = TextEditingController();
  final monotonyEnvironmentController = TextEditingController();
  final activeObservationTimeController = TextEditingController();

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
    BlocProvider.of<IntensityWorkProcessBloc>(context)
        .add(IntensityWorkProcessEvent.getOrganization(protocolName: widget.protocolName));
    selectedId = widget.intensityWorkProcess?.id;
    organizationNameController.text =
        (widget.intensityWorkProcess?.organizationName ?? widget.protocolName?.organizationName)!;
    organizationIdController.text =
        (widget.intensityWorkProcess?.organizationId ?? widget.protocolName?.organizationId)!;
    measurementDateController.text =
        DateFormat('dd.MM.yyyy', 'ru_RU').format(selectedDate ?? DateTime.now());
    workplaceController.text =
        (widget.intensityWorkProcess?.workplace ?? widget.protocolName?.workplace)!;
    workplaceIdController.text =
        (widget.intensityWorkProcess?.workplaceId ?? widget.protocolName?.workplaceId)!;
    parameterNameController.text =
        (widget.intensityWorkProcess?.parameterName ?? widget.protocolName?.protocolName)!;
    signalDensityController.text = widget.intensityWorkProcess?.signalDensity ?? '';
    simultaneousObjectsCountController.text =
        widget.intensityWorkProcess?.simultaneousObjectsCount ?? '';
    opticalDeviceUsageController.text = widget.intensityWorkProcess?.voiceApparatusLoadHours ?? '';

    voiceApparatusLoadHoursController.text =
        widget.intensityWorkProcess?.auditoryAnalyzerLoad ?? '';
    auditoryAnalyzerLoadController.text =
        widget.intensityWorkProcess?.focusedObservationDuration ?? '';
    focusedObservationDurationController.text =
        widget.intensityWorkProcess?.focusedObservationDuration ?? '';

    monotonyLoadsController.text = widget.intensityWorkProcess?.monotonyLoads ?? '';
    elementsCountController.text = widget.intensityWorkProcess?.elementsCount ?? '';
    activeObservationTimeController.text = widget.intensityWorkProcess?.activeObservationTime ?? '';

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
                  controller: signalDensityController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Плотность сигналов (световых, звуковых) и сообщений',
                    hintText: 'Введите значение плотности сигналов (световых, звуковых) и сообщений',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: simultaneousObjectsCountController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Число производственных объектов, наблюдаемых одновременно',
                    hintText: 'Введите число производственных объектов, наблюдаемых одновременно',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: opticalDeviceUsageController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Процент времени использования оптических приборов',
                    hintText: 'Введите значение процента времени использования оптических приборов',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: voiceApparatusLoadHoursController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Нагрузка на голосовой аппарат (суммарное количество часов в неделю)',
                    hintText: 'Введите значение нагрузка на голосовой аппарат (суммарное количество часов в неделю)',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: auditoryAnalyzerLoadController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Нагрузка на слуховой анализатор',
                    hintText: 'Введите значение нагрузку на слуховой анализатор',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: focusedObservationDurationController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Длительность сосредоточенного наблюдения (в % от времени смены)',
                    hintText: 'Введите значение длительности сосредоточенного наблюдения (в % от времени смены)',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: monotonyLoadsController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Уровень монотонности нагрузок',
                    hintText: 'Введите значение уровеня монотонности нагрузок',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: elementsCountController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Число элементов (приемов), необходимых для выполнения задания',
                    hintText: 'Введите число элементов (приемов), необходимых для выполнения задания',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: monotonyEnvironmentController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Уровень монотонности производственной обстановки',
                    hintText: 'Введите значение уровеня монотонности производственной обстановки',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: activeObservationTimeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    //<-- SEE HERE
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Время активного наблюдения за ходом производственного процесса ',
                    hintText: 'Введите время активного наблюдения за ходом производственного процесса ',
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
                    final signalDensity = signalDensityController.text;
                    final simultaneousObjectsCount = simultaneousObjectsCountController.text;
                    final opticalDeviceUsage = opticalDeviceUsageController.text;
                    final voiceApparatusLoadHours = voiceApparatusLoadHoursController.text;
                    final auditoryAnalyzerLoad = auditoryAnalyzerLoadController.text;
                    final focusedObservationDuration = focusedObservationDurationController.text;
                    final monotonyLoads = monotonyLoadsController.text;
                    final elementsCount = elementsCountController.text;
                    final monotonyEnvironment = monotonyEnvironmentController.text;
                    final activeObservationTime = activeObservationTimeController.text;

                    if (organizationName.isNotEmpty) {
                      var intensityWorkProcess = IntensityWorkProcessModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        measurementDate: measurementDate,
                        workplace: workplaceName,
                        workplaceId: workplaceId,
                        parameterName: parameterName,
                        signalDensity: signalDensity,
                        simultaneousObjectsCount: simultaneousObjectsCount,
                        opticalDeviceUsage: opticalDeviceUsage,
                        voiceApparatusLoadHours: voiceApparatusLoadHours,
                        auditoryAnalyzerLoad: auditoryAnalyzerLoad,
                        focusedObservationDuration: focusedObservationDuration,
                        monotonyLoads: monotonyLoads,
                        elementsCount: elementsCount,
                        monotonyEnvironment: monotonyEnvironment,
                        activeObservationTime: activeObservationTime,
                      );
                      BlocProvider.of<IntensityWorkProcessBloc>(context).add(selectedId == null
                          ? IntensityWorkProcessEvent.add(
                              intensityWorkProcess: intensityWorkProcess)
                          : IntensityWorkProcessEvent.update(
                              intensityWorkProcess: intensityWorkProcess));
                      selectedId = null;
                      organizationNameController.clear();
                      organizationIdController.clear();
                      workplaceController.clear();
                      parameterNameController.clear();
                      signalDensityController.clear();
                      simultaneousObjectsCountController.clear();
                      opticalDeviceUsageController.clear();
                      voiceApparatusLoadHoursController.clear();
                      auditoryAnalyzerLoadController.clear();
                      focusedObservationDurationController.clear();
                      monotonyLoadsController.clear();
                      elementsCountController.clear();
                      monotonyEnvironmentController.clear();
                      activeObservationTimeController.clear();

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
