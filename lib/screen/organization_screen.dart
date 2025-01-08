import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/body.dart';
import '../bloc_organization/organization_event.dart';
import '../bloc_organization/organization_state.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({super.key});

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Список организаций")),
          centerTitle: true, // this is all you need
        ),
        body: BlocConsumer<OrganizationBloc, OrganizationState>(
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
                return BodyOrganization(
                  organizationList: data.organizationList,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
