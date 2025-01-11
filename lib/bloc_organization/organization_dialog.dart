import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../data/models/organization_model/organization_model.dart';
import 'bloc_organization.dart';
import 'organization_event.dart';

class AddOrganizationDialog extends StatefulWidget {
  const AddOrganizationDialog({Key? key, this.organization}) : super(key: key);

  final OrganizationModel? organization;

  @override
  State<AddOrganizationDialog> createState() => _AddOrganizationDialogState();
}

class _AddOrganizationDialogState extends State<AddOrganizationDialog> {
  final organizationNameController = TextEditingController();
  final organizatioIdController = TextEditingController();
  int? selectedId;
  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    organizationNameController.text = widget.organization?.organizationName ?? '';
    selectedId = widget.organization?.id;
    organizatioIdController.text = uuid.v4();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Введите данные по организации',
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
                controller: organizatioIdController,
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
                  final organizationId = organizatioIdController.text;
                  if (organizationName.isNotEmpty) {
                    var organization = OrganizationModel(
                      id: selectedId,
                      organizationName: organizationName,
                      organizationId: organizationId,
                    );
                    BlocProvider.of<OrganizationBloc>(context).add(selectedId == null
                        ? OrganizationEvent.addOrganization(organization: organization)
                        : OrganizationEvent.update(organization: organization));
                    selectedId = null;
                    organizationNameController.clear();
                    organizatioIdController.clear();
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
