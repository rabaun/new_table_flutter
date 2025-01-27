import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/organization_event.dart';
import '../bloc_ultraviolet_radiation_protocol/bloc_ultraviolet_radiation_protocol.dart';
import '../bloc_ultraviolet_radiation_protocol/new_body.dart';
import '../bloc_ultraviolet_radiation_protocol/ultraviolet_radiation_protocol_state.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class UltravioletRadiationProtocolScreen extends StatefulWidget {
  const UltravioletRadiationProtocolScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<UltravioletRadiationProtocolScreen> createState() => _UltravioletRadiationProtocolState();
}

class _UltravioletRadiationProtocolState extends State<UltravioletRadiationProtocolScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        body: BlocConsumer<UltravioletRadiationProtocolBloc, UltravioletRadiationProtocolState>(
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
            return NewUltravioletRadiationProtocolBody(
              ultravioletRadiation: data.ultravioletRadiationList,
              protocolNameModel: widget.protocolName,
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    ));
  }
}
