import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_device/bloc_device.dart';
import '../bloc_device/body.dart';
import '../bloc_device/device_event.dart';
import '../bloc_device/device_state.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DeviceBloc>(context).add(const DeviceEvent.getDevice());
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Список приборов к поверке")),
          centerTitle: true, // this is all you need
        ),
        body: BlocConsumer<DeviceBloc, DeviceState>(
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
                return BodyDevice(
                  deviceList: data.deviceModelList,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
