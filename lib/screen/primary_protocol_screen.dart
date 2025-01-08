import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_primary_protocol/bloc_primary_protocol.dart';
import '../bloc_primary_protocol/body.dart';
import '../bloc_primary_protocol/primary_protocol_event.dart';
import '../bloc_primary_protocol/primary_protocol_state.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class PrimaryProtocolScreen extends StatefulWidget {
  const PrimaryProtocolScreen({super.key, required this.protocolName});
  final ProtocolNameModel? protocolName;

  @override
  State<PrimaryProtocolScreen> createState() => _PrimaryProtocolScreenState();
}

class _PrimaryProtocolScreenState extends State<PrimaryProtocolScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PrimaryProtocolBloc>(context).add(const PrimaryProtocolEvent.getTableProtocol());
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Первичный протокол по шуму")),
          centerTitle: true, // this is all you need
        ),
        body: BlocConsumer<PrimaryProtocolBloc, PrimaryProtocolState>(
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
                return BodyPrimaryProtocol(
                  primaryProtocolList: data.primaryProtocolList, protocolNameModel: widget.protocolName,
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ));
  }
}
