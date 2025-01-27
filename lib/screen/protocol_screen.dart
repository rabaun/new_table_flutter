import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_protocol/bloc_protocol.dart';
import '../bloc_protocol/new_body.dart';
import '../bloc_protocol/protocol_event.dart';
import '../bloc_protocol/protocol_state.dart';
import '../data/models/organization_model/organization_model.dart';
import '../data/models/workplace_model/workplace_model.dart';

class ProtocolScreen extends StatefulWidget {
  const ProtocolScreen({super.key, required this.organization, required this.workplaceName});

  final WorkplaceModel? workplaceName;
  final OrganizationModel? organization;

  @override
  State<ProtocolScreen> createState() => _ProtocolScreenState();
}

class _ProtocolScreenState extends State<ProtocolScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProtocolNameBloc>(context).add(const ProtocolNameEvent.getProtocolName());
    return Scaffold(
        body: BlocConsumer<ProtocolNameBloc, ProtocolNameState>(
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
            return NewProtocolNameBody(
              protocolNameList: data.protocolNameList,
              organization: widget.organization,
              workplaceName: widget.workplaceName,
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    ));
  }
}
