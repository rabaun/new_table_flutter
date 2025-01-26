import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_microclimate_protocol/bloc_microclimate_protocol.dart';
import '../bloc_microclimate_protocol/body.dart';
import '../bloc_microclimate_protocol/microclimate_protocol_state.dart';
import '../bloc_microclimate_protocol/new_body.dart';
import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/organization_event.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class MicroclimateProtocolScreen extends StatefulWidget {
  const MicroclimateProtocolScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<MicroclimateProtocolScreen> createState() => _WorkplaceScreenState();
}

class _WorkplaceScreenState extends State<MicroclimateProtocolScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        body: BlocConsumer<MicroclimateProtocolBloc, MicroclimateState>(
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
                return NewMicroclimateProtocolBody(
                  microclimate: data.microclimateList,
                  protocolNameModel: widget.protocolName,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
