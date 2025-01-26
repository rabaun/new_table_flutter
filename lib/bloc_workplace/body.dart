import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:new_table_flutter/bloc_workplace/workplace_dialog.dart';
import 'package:new_table_flutter/bloc_workplace/workplace_event.dart';

import '../data/models/organization_model/organization_model.dart';
import '../data/models/workplace_model/workplace_model.dart';
import '../screen/protocol_screen.dart';
import 'bloc_workplace.dart';

class BodyWorkplace extends StatefulWidget {
  final List<WorkplaceModel>? workplaceList;
  final OrganizationModel? organization;

  const BodyWorkplace({super.key, required this.workplaceList, required this.organization});

  @override
  _BodyProtocolNameState createState() => _BodyProtocolNameState();
}

class _BodyProtocolNameState extends State<BodyWorkplace> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WorkplaceBloc>(context).add(WorkplaceEvent.getOrganization(organization: widget.organization));
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
              return AddWorkplaceDialog(organization: widget.organization);
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
        itemCount: widget.workplaceList?.length ?? 0,
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
      _getTitleItemWidget('Наименование подразделения', 250),
      _getTitleItemWidget('Наименование рабочего места', 250),
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
              BlocProvider.of<WorkplaceBloc>(context)
                  .add(WorkplaceEvent.remove(workplace: widget.workplaceList?[index]));
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProtocolScreen(organization: widget.organization,workplaceName: widget.workplaceList?[index]),
                ),
              );
            },
            child: Text(
                "${widget.workplaceList?[index].id} ${widget.workplaceList?[index].organizationName.toString()}"),
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
          SizedBox(
            width:250,
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
                onLongPress: () {   },
              child: Text(
                  " ${widget.workplaceList?[index].departmentName.toString()}"),
            ),
          ),
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
                    onLongPress: () { },
                    child: Text(
                        "${widget.workplaceList?[index].workplaceName.toString()}")),
              )),
        ],
      ),
    );
  }
}
