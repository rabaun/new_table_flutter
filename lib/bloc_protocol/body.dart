import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:new_table_flutter/bloc_protocol/protocol_dialog.dart';
import 'package:new_table_flutter/bloc_protocol/protocol_event.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/workplace_model/workplace_model.dart';
import '../screen/microclimate_protocol_screen.dart';
import '../screen/primary_protocol_screen.dart';
import 'bloc_protocol.dart';

class BodyProtocolName extends StatefulWidget {
  final List<ProtocolNameModel>? protocolNameList;
  final OrganizationModel? organization;
  final WorkplaceModel? workplaceName;

  const BodyProtocolName(
      {super.key,
      required this.protocolNameList,
      required this.organization,
      required this.workplaceName});

  @override
  _BodyProtocolNameState createState() => _BodyProtocolNameState();
}

class _BodyProtocolNameState extends State<BodyProtocolName> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProtocolNameBloc>(context).add(ProtocolNameEvent.getProtocol(
        organization: widget.organization, workplaceName: widget.workplaceName));
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
              return AddProtocolNameDialog(
                workplace: widget.workplaceName,
                organization: widget.organization,
              );
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
        leftHandSideColumnWidth: 297,
        rightHandSideColumnWidth: 1233,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.protocolNameList?.length ?? 0,
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
      _getTitleItemWidget('Наименование организации', 250),
      _getTitleItemWidget('Наименование рабочего места', 250),
      _getTitleItemWidget('УИД рабочего места', 350),
      _getTitleItemWidget('Наименование вредных факторов на РМ', 300),
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
              BlocProvider.of<ProtocolNameBloc>(context)
                  .add(ProtocolNameEvent.remove(protocolName: widget.protocolNameList?[index]));
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        getName(widget.protocolNameList![index].protocolName.toString(), index)),
              );
            },
            child: Text(
                "${widget.protocolNameList?[index].id} ${widget.protocolNameList?[index].organizationName.toString()}"),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      getName(widget.protocolNameList![index].protocolName.toString(), index)),
            );
          },
        ),
      ],
    );
  }

  getName(String value, int index) {
    dynamic title = PrimaryProtocolScreen(
      protocolName: widget.protocolNameList?[index],
    );
    switch (value) {
      case "Шум":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Вибрация локальная":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Вибрация общая":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Освещение":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Химический":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Ультрафиолет":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Микроклимат":
        title = MicroclimateProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Аэрозоли АПДФ":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Лазерное излучение":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Тяжесть турдового процесса":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      case "Напряженность турдового процесса":
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
        break;
      default:
        title = PrimaryProtocolScreen(
          protocolName: widget.protocolNameList?[index],
        );
    }
    return title;
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Row(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 250,
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
                    onLongPress: () {},
                    child: Text("${widget.protocolNameList?[index].workplace.toString()}")),
              )),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 350,
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
                    onLongPress: () {},
                    child: Text("${widget.protocolNameList?[index].workplaceId.toString()}")),
              )),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 250,
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
                    onLongPress: () {},
                    child: Text("${widget.protocolNameList?[index].protocolName.toString()}")),
              )),
        ],
      ),
    );
  }
}
