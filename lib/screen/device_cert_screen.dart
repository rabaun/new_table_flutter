import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_device_cert/bloc_device_cert.dart';
import '../bloc_device_cert/body.dart';
import '../bloc_device_cert/device_cert_state.dart';
import '../data/models/device_model/device_model.dart';

class DeviceCertSrceen extends StatefulWidget {

  const DeviceCertSrceen({super.key, required this.deviceList});

  final DeviceModel? deviceList;
  @override
  State<DeviceCertSrceen> createState() => _DeviceCertSrceenState();
}

class _DeviceCertSrceenState extends State<DeviceCertSrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: const Center(child: Text("Таблица поверок приборов")),
          centerTitle: true, // this is all you need
        ),
        body: BlocConsumer<DeviceCertBloc, DeviceCertState>(
          listener: (context, state) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text('Loading data'),
            //     duration: Duration(seconds: 10),
            //   ),
            // );
          },
          builder: (context, state) {
            return state.maybeMap(
              loading: (_) => const Column(
                children: [
                  LinearProgressIndicator(),
                ],
              ),
              data: (data) {
                return BodyDeviceCert(
                  deviceModel: data.deviceCertModel, device: widget.deviceList,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
