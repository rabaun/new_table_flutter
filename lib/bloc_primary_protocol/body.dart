import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:new_table_flutter/bloc_primary_protocol/primary_protocol_dialog.dart';
import 'package:new_table_flutter/bloc_primary_protocol/primary_protocol_event.dart';

import '../data/models/primary_protocol_model/primary_protocol_model.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';
import '../generated/l10n.dart';
import 'bloc_primary_protocol.dart';

class BodyPrimaryProtocol extends StatefulWidget {
  final List<PrimaryProtocolModel>? primaryProtocolList;
  final ProtocolNameModel? protocolNameModel;

  const BodyPrimaryProtocol(
      {super.key, required this.primaryProtocolList, required this.protocolNameModel});

  @override
  _BodyPrimaryProtocolState createState() => _BodyPrimaryProtocolState();
}

class _BodyPrimaryProtocolState extends State<BodyPrimaryProtocol> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PrimaryProtocolBloc>(context)
        .add(PrimaryProtocolEvent.getProtocol(organization: widget.protocolNameModel,workplaceName: widget.protocolNameModel));
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
                return AddPrimaryProtocolDialog(protocolName: widget.protocolNameModel,);
              },
            );
          },
        ));
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
        itemCount: widget.primaryProtocolList?.length ?? 0,
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
      _getTitleItemWidget(S.of(context).name_company, 250),
      _getTitleItemWidget('Рабочее место', 124),
      _getTitleItemWidget('УИД рабочего места', 300),
      _getTitleItemWidget('Дата замера', 124),
      _getTitleItemWidget('Наименование фактра', 200),
      _getTitleItemWidget('Значение фактра', 124),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onLongPress: () {
                selectedId = null;
                textController.clear();
                BlocProvider.of<PrimaryProtocolBloc>(context).add(PrimaryProtocolEvent.remove(
                    primaryProtocol: widget.primaryProtocolList?[index]));
              },
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddPrimaryProtocolDialog(
                      primaryProtocolName: widget.primaryProtocolList?[index], protocolName: widget.protocolNameModel,
                    );
                  },
                );
              },
              child: Text(
                  "${widget.primaryProtocolList?[index].id} ${widget.primaryProtocolList?[index].organizationName.toString()}"),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddPrimaryProtocolDialog(
                  primaryProtocolName: widget.primaryProtocolList?[index], protocolName: widget.protocolNameModel
                );
              },
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
            width: 124,
            child: InkWell(
              onLongPress: () {
                selectedId = null;
                textController.clear();
                BlocProvider.of<PrimaryProtocolBloc>(context).add(PrimaryProtocolEvent.remove(
                    primaryProtocol: widget.primaryProtocolList?[index]));
              },
              child: Text(widget.primaryProtocolList?[index].workplace.toString() ?? ''),
            ),
          ),
          SizedBox(
            width: 300,
            child: InkWell(
              onLongPress: () {
                selectedId = null;
                textController.clear();
                BlocProvider.of<PrimaryProtocolBloc>(context).add(PrimaryProtocolEvent.remove(
                    primaryProtocol: widget.primaryProtocolList?[index]));
              },
              child: Text(widget.primaryProtocolList?[index].workplaceId.toString() ?? ''),
            ),
          ),
          SizedBox(
            width: 124,
            child: InkWell(
              onLongPress: () {
                selectedId = null;
                textController.clear();
                BlocProvider.of<PrimaryProtocolBloc>(context).add(PrimaryProtocolEvent.remove(
                    primaryProtocol: widget.primaryProtocolList?[index]));
              },
              child: Text(widget.primaryProtocolList?[index].measurementDate.toString() ?? ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              child: InkWell(
                onLongPress: () {
                  selectedId = null;
                  textController.clear();
                  BlocProvider.of<PrimaryProtocolBloc>(context).add(PrimaryProtocolEvent.remove(
                      primaryProtocol: widget.primaryProtocolList?[index]));
                },
                child: Text(widget.primaryProtocolList?[index].parameterName.toString() ?? ''),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 124,
              child: InkWell(
                onLongPress: () {
                  selectedId = null;
                  textController.clear();
                  BlocProvider.of<PrimaryProtocolBloc>(context).add(PrimaryProtocolEvent.remove(
                      primaryProtocol: widget.primaryProtocolList?[index]));
                },
                child: Text(widget.primaryProtocolList?[index].parameterValue.toString() ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
