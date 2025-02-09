import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_table_flutter/bloc_protocol/protocol_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/workplace_model/workplace_model.dart';
import '../screen/microclimate_protocol_screen.dart';
import '../screen/primary_protocol_screen.dart';
import 'bloc_protocol.dart';

class AddProtocolNameDialog extends StatefulWidget {
  const AddProtocolNameDialog({super.key, this.protocolName, required this.workplace, required this.organization});

  final ProtocolNameModel? protocolName;
  final WorkplaceModel? workplace;
  final OrganizationModel? organization;

  @override
  State<AddProtocolNameDialog> createState() => _AddProtocolNameDialogState();
}

class _AddProtocolNameDialogState extends State<AddProtocolNameDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final workplaceNameController = TextEditingController();
  final protocolNameController = TextEditingController();
  final workplaceIdController = TextEditingController();
  final protocolIdController = TextEditingController();
  int? selectedId;
  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _loadFactors();
  }

  static const List<String> factorsList = <String>[
    'Шум',
    'Вибрация локальная',
    'Вибрация общая',
    'Освещение',
    'Химический ГАНК',
    'УФ-излучение',
    'Микроклимат',
    'Аэрозоли АПДФ',
    'Лазерное излучение',
    'Тяжесть турдового процесса',
    'Напряженность турдового процесса',
  ];

  String? _factor;

  Future<String?> _loadFactors() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _factor = prefs.getString('factor') ?? 'Шум';
    });
    return _factor;
  }

  Future<void> _setFactors(String factor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('factor', factor);
    setState(() {
      _factor = factor;
    });
  }

  Widget dropdownButtonWidget() {
    String? languageType = _factor;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InputDecorator(
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Выберите вредный фактор', // Замена на более подходящий текст
          hintStyle: TextStyle(color: Colors.transparent),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: languageType,
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            onChanged: (String? value) {
              setState(() {
                languageType = value ?? ' ';
                _setFactors(value ?? ' ');
              });
            },
            items: factorsList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  String? changeCountryCode(String value, int index) {
    dynamic title = "";

    switch (value) {
      case "Шум":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Вибрация локальная":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Вибрация общая":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Освещение":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Химический ГАНК":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "УФ-излучение":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Микроклимат":
        title = MicroclimateProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Аэрозоли АПДФ":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Лазерное излучение":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Тяжесть турдового процесса":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      case "Напряженность турдового процесса":
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
        break;
      default:
        title = PrimaryProtocolScreen(protocolName: widget.protocolName,);
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProtocolNameBloc>(context).add(const ProtocolNameEvent.getProtocolName());
    selectedId = widget.protocolName?.id;
    organizationNameController.text =
        (widget.protocolName?.organizationName ?? widget.workplace?.organizationName)!;
    organizationIdController.text = (widget.protocolName?.workplaceId ?? widget.workplace?.organizationId)!;
    workplaceNameController.text =
        (widget.protocolName?.workplace ?? widget.workplace?.workplaceName)!;
    protocolNameController.text = _factor ?? '';
    workplaceIdController.text =
        (widget.protocolName?.workplaceId ?? widget.workplace?.workplaceId)!;
    protocolIdController.text = uuid.v4();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Выберите вредный фактор для протокола',
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
                  controller: workplaceNameController,
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
                dropdownButtonWidget(),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    final organizationName = organizationNameController.text;
                    final organizationId = organizationIdController.text;
                    final workplace = workplaceNameController.text;
                    final workplaceId = workplaceIdController.text;
                    final protocolName = protocolNameController.text;
                    final protocolId = protocolIdController.text;

                    if (organizationName.isNotEmpty) {
                      var organization = ProtocolNameModel(
                          id: selectedId,
                          organizationName: organizationName,
                          organizationId: organizationId,
                          workplace: workplace,
                          workplaceId: workplaceId,
                          protocolName: protocolName,
                          protocolId: protocolId);
                      BlocProvider.of<ProtocolNameBloc>(context).add(selectedId == null
                          ? ProtocolNameEvent.addProtocolName(protocolName: organization)
                          : ProtocolNameEvent.update(protocolName: organization));
                      selectedId = null;
                      organizationNameController.clear();
                      organizationIdController.clear();
                      workplaceNameController.clear();
                      protocolNameController.clear();
                      workplaceIdController.clear();
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
    );
  }
}
