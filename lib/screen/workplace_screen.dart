import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/organization_event.dart';
import '../bloc_workplace/bloc_workplace.dart';
import '../bloc_workplace/body.dart';
import '../bloc_workplace/workplace_state.dart';
import '../data/models/organization_model/organization_model.dart';

class WorkplaceScreen extends StatefulWidget {
  const WorkplaceScreen({super.key, this.organization});
  final OrganizationModel? organization;

  @override
  State<WorkplaceScreen> createState() => _WorkplaceScreenState();
}

class _WorkplaceScreenState extends State<WorkplaceScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Список рабочих мест")),
          centerTitle: true, // this is all you need
        ),
        body: BlocConsumer<WorkplaceBloc, WorkplaceState>(
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
                return BodyWorkplace(
                  workplaceList: data.workplaceList,
                  organization: widget.organization,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
