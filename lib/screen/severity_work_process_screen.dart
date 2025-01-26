import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/organization_event.dart';
import '../bloc_severity_work_process_protocol/bloc_severity_work_process_protocol.dart';
import '../bloc_severity_work_process_protocol/body.dart';
import '../bloc_severity_work_process_protocol/severity_work_process_state.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class SeverityWorkProcessScreen extends StatefulWidget {
  const SeverityWorkProcessScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<SeverityWorkProcessScreen> createState() => _SeverityWorkProcessState();
}

class _SeverityWorkProcessState extends State<SeverityWorkProcessScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        body: BlocConsumer<SeverityWorkProcessBloc, SeverityWorkProcessState>(
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
                return SeverityWorkProcessBody(
                  severityWorkProcessList: data.severityWorkProcessList,
                  protocolNameModel: widget.protocolName,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
