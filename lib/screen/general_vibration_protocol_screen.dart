import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_general_vibration_protocol/bloc_general_vibration_protocol.dart';
import '../bloc_general_vibration_protocol/body.dart';
import '../bloc_general_vibration_protocol/general_vibration_protocol_state.dart';
import '../bloc_organization/bloc_organization.dart';
import '../bloc_organization/organization_event.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class GeneralVibrationProtocolScreen extends StatefulWidget {
  const GeneralVibrationProtocolScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<GeneralVibrationProtocolScreen> createState() => _GeneralVibrationProtocolState();
}

class _GeneralVibrationProtocolState extends State<GeneralVibrationProtocolScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationBloc>(context).add(const OrganizationEvent.getOrganization());
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Первичный протокол по микроклимату")),
          centerTitle: true, // this is all you need
        ),
        body: BlocConsumer<GeneralVibrationProtocolBloc, GeneralVibrationProtocolState>(
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
                return BodyGeneralVibrationProtocol(
                  generalVibrationProtocol: data.generalVibrationProtocol,
                  protocolNameModel: widget.protocolName,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
