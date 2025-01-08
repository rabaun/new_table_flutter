import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../bloc_device_cert/bloc_device_cert.dart';
import '../bloc_device_cert/device_cert_event.dart';
import '../data/models/device_model/device_model.dart';
import '../screen/device_cert_screen.dart';
import 'bloc_device.dart';
import 'device_dialogs.dart';
import 'device_event.dart';

class BodyDevice extends StatefulWidget {
  final List<DeviceModel>? deviceList;

  const BodyDevice({super.key, required this.deviceList});

  @override
  _BodyDeviceState createState() => _BodyDeviceState();
}

class _BodyDeviceState extends State<BodyDevice> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DeviceBloc>(context).add(const DeviceEvent.getDevice());
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: textController,
          decoration: const InputDecoration(labelText: 'Input Name', border: OutlineInputBorder()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Divider(color: Colors.grey[250]),
      ),
      Expanded(
          child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                          'Чтобы просмотреть обращение детально кликните дважды по строке'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
                    child: Container(
                      child: _getBodyWidget(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _floatingButton(context),
      ))
    ]);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _floatingButton(context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.yellow),
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AddDeviceDialog();
            },
          );
        },
        child: const Icon(Icons.save, color: Colors.white),
      ),
    );
  }

  Widget _getBodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 197,
        rightHandSideColumnWidth: 1233,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.deviceList?.length ?? 0,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Наименование СИ', 200),
      _getTitleItemWidget('Номер в госреестре', 224),
      _getTitleItemWidget('Заводской номер', 224),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
          ),
          child: InkWell(
            onLongPress: () {
              selectedId = null;
              textController.clear();
              BlocProvider.of<DeviceBloc>(context)
                  .add(DeviceEvent.remove(device: widget.deviceList?[index]));
            },
            onTap: () {
              BlocProvider.of<DeviceCertBloc>(context)
                  .add(DeviceCertEvent.getSerialNumberData(deviceModel: widget.deviceList?[index]));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DeviceCertSrceen(
                    deviceList: widget.deviceList?[index],
                  ),
                ),
              );
            },
            child: Text(
                "${widget.deviceList?[index].id} ${widget.deviceList?[index].name.toString()}"),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DeviceCertSrceen(
                  deviceList: widget.deviceList?[index],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 224,
            child: InkWell(
                // onTap: () {
                //   if (selectedId == user.id) {
                //     textController.text = "";
                //     selectedId = null;
                //   } else {
                //     textController.text = user.name!;
                //     selectedId = user.id;
                //   }
                // },
                onLongPress: () {
                  selectedId = null;
                  textController.clear();
                  BlocProvider.of<DeviceBloc>(context)
                      .add(DeviceEvent.remove(device: widget.deviceList?[index]));
                },
                child: Text(widget.deviceList![index].registryNumber.toString())),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: 224,
              child: InkWell(
                  // onTap: () {
                  //   if (selectedId == user.id) {
                  //     textController.text = "";
                  //     selectedId = null;
                  //   } else {
                  //     textController.text = user.name!;
                  //     selectedId = user.id;
                  //   }
                  // },
                  onLongPress: () {
                    selectedId = null;
                    textController.clear();
                    BlocProvider.of<DeviceBloc>(context)
                        .add(DeviceEvent.remove(device: widget.deviceList?[index]));
                  },
                  child: Text(widget.deviceList![index].serialNumber.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
