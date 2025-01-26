import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_intensity_work_process/bloc_intensity_work_process.dart';
import '../bloc_intensity_work_process/intensity_work_process_state.dart';
import '../bloc_intensity_work_process/new_body.dart';
import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/organization_event.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class IntensityWorkProcessScreen extends StatefulWidget {
  const IntensityWorkProcessScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<IntensityWorkProcessScreen> createState() => _WorkplaceScreenState();
}

class _WorkplaceScreenState extends State<IntensityWorkProcessScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        body: BlocConsumer<IntensityWorkProcessBloc, IntensityWorkProcessState>(
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
            return IntensityWorkProcessBody(
              intensityWorkProcess: data.intensityWorkProcess,
              protocolNameModel: widget.protocolName,
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    ));
  }
}
