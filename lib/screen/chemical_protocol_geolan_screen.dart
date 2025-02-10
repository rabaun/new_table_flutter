import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_chemical_protocol_geolan/bloc_chemical_protocol_geolan.dart';
import '../bloc_chemical_protocol_geolan/chemical_protocol_geolan_state.dart';
import '../bloc_chemical_protocol_geolan/new_body.dart';
import '../data/models/protocol_name_model/protocol_name_model.dart';

class ChemicalProtocolGeolanScreen extends StatefulWidget {
  const ChemicalProtocolGeolanScreen({super.key, required this.protocolName});

  final ProtocolNameModel? protocolName;

  @override
  State<ChemicalProtocolGeolanScreen> createState() => _ChemicalProtocolGankState();
}

class _ChemicalProtocolGankState extends State<ChemicalProtocolGeolanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ChemicalProtocolGeolanBloc, ChemicalProtocolGeolanState>(
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
            return NewChemicalProtocolGeolanBody(
              chemicalProtocolGeolan: data.chemicalProtocolGeolan,
              protocolNameModel: widget.protocolName,
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    ));
  }
}
