import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_table_flutter/bloc_workplace/workplace_event.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/workplace_model/workplace_model.dart';
import 'bloc_workplace.dart';
import 'package:uuid/uuid.dart';


class AddWorkplaceDialog extends StatefulWidget {
  const AddWorkplaceDialog({super.key, this.workplace, this.organization});

  final WorkplaceModel? workplace;
  final OrganizationModel? organization;

  @override
  State<AddWorkplaceDialog> createState() => _AddProtocolNameDialogState();
}

class _AddProtocolNameDialogState extends State<AddWorkplaceDialog> {
  final organizationNameController = TextEditingController();
  final organizationIdController = TextEditingController();
  final departmentNameController = TextEditingController();
  final workplaceNameController = TextEditingController();
  final workplaceIdController = TextEditingController();
  int? selectedId;
  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WorkplaceBloc>(context).add(WorkplaceEvent.getOrganization(organization: widget.organization));
    organizationNameController.text = (widget.workplace?.organizationName ?? widget.organization?.organizationName)!;
    organizationIdController.text =  (widget.workplace?.organizationId ?? widget.organization?.organizationId)!;
    departmentNameController.text = widget.workplace?.departmentName ?? '';
    workplaceNameController.text = widget.workplace?.workplaceName ?? '';
    workplaceIdController.text = uuid.v4();
    selectedId = widget.workplace?.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Введите данные по рабочему месту',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
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
              TextField(
                controller: departmentNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Наименование подразделения',
                  hintText: 'Введите наименование подразделения',
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
              MaterialButton(
                onPressed: () {
                  final organizationName = organizationNameController.text;
                  final organizationId = organizationIdController.text;
                  final departmentName = departmentNameController.text;
                  final workplaceName = workplaceNameController.text;
                  final workplaceId = workplaceIdController.text;
                  if (organizationName.isNotEmpty) {
                    var workplace = WorkplaceModel(
                        id: selectedId,
                        organizationName: organizationName,
                        organizationId: organizationId,
                        departmentName: departmentName,
                        workplaceName: workplaceName,
                        workplaceId:workplaceId);
                    BlocProvider.of<WorkplaceBloc>(context).add(selectedId == null
                        ? WorkplaceEvent.addWorkplace(workplace: workplace)
                        : WorkplaceEvent.update(workplaceName: workplace));
                    selectedId = null;
                    organizationNameController.clear();
                    organizationIdController.clear();
                    departmentNameController.clear();
                    workplaceNameController.clear();
                    workplaceIdController.clear();
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
    );
  }
}
