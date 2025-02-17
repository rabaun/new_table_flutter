import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:new_table_flutter/bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_dialog.dart';
import 'package:new_table_flutter/bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_event.dart';

import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../data/models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';
import '../generated/l10n.dart';
import 'bloc_ultraviolet_radiation_protocol.dart';

class BodyUltravioletRadiationProtocol extends StatefulWidget {
  final List<UltravioletRadiationProtocolModel>? ultravioletRadiation;
  final ProtocolNameModel? protocolNameModel;

  const BodyUltravioletRadiationProtocol(
      {super.key, required this.ultravioletRadiation, required this.protocolNameModel});

  @override
  _BodyUltravioletRadiationProtocolState createState() => _BodyUltravioletRadiationProtocolState();
}

class _BodyUltravioletRadiationProtocolState extends State<BodyUltravioletRadiationProtocol> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UltravioletRadiationProtocolBloc>(context)
        .add(UltravioletRadiationProtocolEvent.getOrganization(protocolName: widget.protocolNameModel));
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
              return AddUltravioletRadiationProtocolDialog(
                protocolName: widget.protocolNameModel,
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
        leftHandSideColumnWidth: 197,
        rightHandSideColumnWidth: 1233,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.ultravioletRadiation?.length ?? 0,
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
      _getTitleItemWidget(S.of(context).name_company, 124),
      _getTitleItemWidget('Дата замера', 124),
      _getTitleItemWidget('Раб места', 124),
      _getTitleItemWidget('Значение УФ-А на 0.5-1.0м', 144),
      _getTitleItemWidget('Значение УФ-А на 1.5м', 144),
      _getTitleItemWidget('Значение УФ-В на 0.5-1.0м', 144),
      _getTitleItemWidget('Значение УФ-В на 1.5м', 144),
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
              BlocProvider.of<UltravioletRadiationProtocolBloc>(context)
                  .add(UltravioletRadiationProtocolEvent.remove(ultravioletRadiation: widget.ultravioletRadiation?[index]));
            },
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (_) => ProtocolScreen(organization: widget.organization),
            //     ),
            //   );
            // },
            child: Text(
                "${widget.ultravioletRadiation?[index].id} ${widget.ultravioletRadiation?[index].organizationName.toString()}"),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Row(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 124,
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
                    child: Text("${widget.ultravioletRadiation?[index].measurementDate.toString()}")),
              )),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 124,
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
                    child: Text("${widget.ultravioletRadiation?[index].workplace.toString()}")),
              )),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 124,
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
                    child: Text("${widget.ultravioletRadiation?[index].uvAIntensityH05_101.toString()}")),
              )),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 144,
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
                    child: Text("${widget.ultravioletRadiation?[index].uvAIntensityH151.toString()}")),
              )),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 144,
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
                    child: Text("${widget.ultravioletRadiation?[index].uvBIntensityH05_101.toString()}")),
              )),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: 144,
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
                    child: Text("${widget.ultravioletRadiation?[index].uvBIntensityH151.toString()}")),
              )),
        ],
      ),
    );
  }
}
