import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/device_model/device_model.dart';
import 'bloc_device.dart';
import 'device_event.dart';

class AddDeviceDialog extends StatefulWidget {
  const AddDeviceDialog({Key? key, this.deviceModel}) : super(key: key);

  final DeviceModel? deviceModel;

  @override
  State<AddDeviceDialog> createState() => _AddDeviceDialogState();
}

class _AddDeviceDialogState extends State<AddDeviceDialog> {
  final deviceNameController = TextEditingController();
  final registryNumberController = TextEditingController();
  final serialNumberController = TextEditingController();
  int? selectedId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DeviceBloc>(context).add(const DeviceEvent.getDevice());
    deviceNameController.text = widget.deviceModel?.name ?? '';
    registryNumberController.text = widget.deviceModel?.registryNumber ?? '';
    serialNumberController.text = widget.deviceModel?.serialNumber ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Введите данные по оборудованию',
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
                controller: deviceNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Наименование СИ',
                  hintText: 'Введите наименование СИ',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: registryNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Номер в госреестре',
                  hintText: 'Введите номер в госреестре',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: serialNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Заводской номер',
                  hintText: 'Введите заводской номер',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  final name = deviceNameController.text;
                  final registryNumber = registryNumberController.text;
                  final serialNumber = serialNumberController.text;
                  if (name.isNotEmpty && registryNumber.isNotEmpty && serialNumber.isNotEmpty) {
                    var user = DeviceModel(
                        id: selectedId,
                        name: name,
                        registryNumber: registryNumber,
                        serialNumber: serialNumber);
                    BlocProvider.of<DeviceBloc>(context).add(selectedId == null
                        ? DeviceEvent.addDevice(device: user)
                        : DeviceEvent.update(device: user));
                    selectedId = null;
                    deviceNameController.clear();
                    registryNumberController.clear();
                    serialNumberController.clear();
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
