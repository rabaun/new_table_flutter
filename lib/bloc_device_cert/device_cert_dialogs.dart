import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/device_cert_model/table_model.dart';
import 'bloc_device_cert.dart';
import 'device_cert_event.dart';

class AddDeviceCertDialog extends StatefulWidget {
  const AddDeviceCertDialog({Key? key, this.deviceCertModel}) : super(key: key);

  final DeviceCertModel? deviceCertModel;

  @override
  State<AddDeviceCertDialog> createState() => _AddDeviceCertDialogState();
}

class _AddDeviceCertDialogState extends State<AddDeviceCertDialog> {
  final serialNumberController = TextEditingController();
  final cerVerificationController = TextEditingController();
  final endTimeController = TextEditingController();
  final startTimeController = TextEditingController();
  int? selectedId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedId = widget.deviceCertModel?.id;
    serialNumberController.text = widget.deviceCertModel?.serialNumber ?? '';
    serialNumberController.text = widget.deviceCertModel?.serialNumber ?? '';
    cerVerificationController.text = widget.deviceCertModel?.cerVerification ?? '';
    startTimeController.text = widget.deviceCertModel?.startTime ?? '';
    endTimeController.text = widget.deviceCertModel?.endTime ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Введите данные по должнику',
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
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: serialNumberController,
                keyboardType: TextInputType.text,
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
              TextField(
                controller: cerVerificationController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Свидетельство о поверке',
                  hintText: 'Введите свидетельство о поверке',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: startTimeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Дата начала',
                  hintText: 'Введите дату начала',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: endTimeController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Дата окончания',
                  hintText: 'Введите дату окончания',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  BlocProvider.of<DeviceCertBloc>(context).add(const DeviceCertEvent.getDevice());
                  final serialNumber = serialNumberController.text;
                  final cerVerification = cerVerificationController.text;
                  final startTime = startTimeController.text;
                  final endTime = endTimeController.text;

                  if (serialNumber.isNotEmpty &&
                      cerVerification.isNotEmpty &&
                      startTime.isNotEmpty &&
                      endTime.isNotEmpty) {
                    var verification = DeviceCertModel(
                      id: selectedId,
                      serialNumber: serialNumber,
                      cerVerification: cerVerification,
                      startTime: startTime,
                      endTime: endTime,
                    );

                    BlocProvider.of<DeviceCertBloc>(context).add(selectedId == null
                        ? DeviceCertEvent.addDevice(deviceCertModel: verification)
                        : DeviceCertEvent.update(deviceCertModel: verification));

                    selectedId = null;
                    cerVerificationController.clear();
                    startTimeController.clear();
                    endTimeController.clear();
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
