import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_local_vibration_protocol/bloc_local_vibration_protocol.dart';
import '../bloc_local_vibration_protocol/local_vibration_protocol_state.dart';
import '../bloc_local_vibration_protocol/new_body.dart';
import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/organization_event.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class LocalVibrationProtocolScreen extends StatefulWidget {
  const LocalVibrationProtocolScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<LocalVibrationProtocolScreen> createState() => _LocalVibrationProtocolState();
}

class _LocalVibrationProtocolState extends State<LocalVibrationProtocolScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        body: BlocConsumer<LocalVibrationProtocolBloc, LocalVibrationProtocolState>(
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
            return NewLocalVibrationProtocolBody(
              localVibrationProtocol: data.localVibrationProtocol,
              protocolNameModel: widget.protocolName,
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    ));
  }
}
