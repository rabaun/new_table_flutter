import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_chemical_protocol_gank/bloc_chemical_protocol_gank.dart';
import '../bloc_chemical_protocol_gank/chemical_protocol_gank_state.dart';
import '../bloc_chemical_protocol_gank/new_body.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class ChemicalProtocolGankScreen extends StatefulWidget {
  const ChemicalProtocolGankScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<ChemicalProtocolGankScreen> createState() => _ChemicalProtocolGankState();
}

class _ChemicalProtocolGankState extends State<ChemicalProtocolGankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ChemicalProtocolGankBloc, ChemicalProtocolGankState>(
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
            return NewChemicalProtocolGankBody(
              chemicalProtocolGankList: data.chemicalProtocolGankList,
              protocolNameModel: widget.protocolName,
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    ));
  }
}
