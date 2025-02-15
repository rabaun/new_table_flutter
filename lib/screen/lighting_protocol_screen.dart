import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_lighting_protocol/bloc_lighting_protocol.dart';
import '../bloc_lighting_protocol/lighting_protocol_event.dart';
import '../bloc_lighting_protocol/lighting_protocol_state.dart';
import '../bloc_lighting_protocol/new_body.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class LightingProtocolScreen extends StatefulWidget {
  const LightingProtocolScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<LightingProtocolScreen> createState() => _LightingProtocolScreenState();
}

class _LightingProtocolScreenState extends State<LightingProtocolScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LightingProtocolBloc>(context)
        .add(const LightingProtocolEvent.getTableProtocol());
    return Scaffold(
        body: BlocConsumer<LightingProtocolBloc, LightingProtocolState>(
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
            return NewLightingProtocolBody(
              lightingProtocolList: data.lightingProtocolList,
              protocolNameModel: widget.protocolName,
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    ));
  }
}
