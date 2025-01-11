import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../data/models/organization_model/organization_model.dart';
import '../screen/workplace_screen.dart';
import 'bloc_organization.dart';
import 'organization_dialog.dart';
import 'organization_event.dart';

class BodyOrganization extends StatefulWidget {
  final List<OrganizationModel>? organizationList;

  const BodyOrganization({super.key, required this.organizationList});

  @override
  _BodyOrganizationState createState() => _BodyOrganizationState();
}

class _BodyOrganizationState extends State<BodyOrganization> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
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
              return const AddOrganizationDialog();
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
        leftHandSideColumnWidth: 500,
        rightHandSideColumnWidth: 900,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.organizationList?.length ?? 0,
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
      _getTitleItemWidget('Наименование организации', 350),
      _getTitleItemWidget('УИД рабочего места', 350),
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
              BlocProvider.of<OrganizationBloc>(context)
                  .add(OrganizationEvent.remove(organization: widget.organizationList?[index]));
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WorkplaceScreen(organization: widget.organizationList?[index]),
                ),
              );
            },
            child: Text(
                "${widget.organizationList?[index].id} ${widget.organizationList?[index].organizationName.toString()}"),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => WorkplaceScreen(organization: widget.organizationList?[index]),
            //   ),
            // );
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
                    child: Text(
                        "${widget.organizationList?[index].organizationId.toString()}")),
              )),
        ],
      ),
    );
  }
}