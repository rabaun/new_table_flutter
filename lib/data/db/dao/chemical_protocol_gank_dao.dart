import 'package:flutter/foundation.dart';

import '../../models/chemical_protocol_gank_model/chemical_protocol_gank_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class ChemicalProtocolGankDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'chemical_protocol_gank';

  List<ChemicalProtocolGankModel> list = [];
  ChemicalProtocolGankModel? tableModel;

  Future<List<ChemicalProtocolGankModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => ChemicalProtocolGankModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => ChemicalProtocolGankModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(ChemicalProtocolGankModel? chemicalProtocolGank) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        '''INSERT INTO $table (
        organizationName, 
        organizationId, 
        measurementDate, 
        workplace, 
        workplaceId, 
        protocolId, 
        familyName,
        parameterName, 
        concentration1_1,
        concentration2_1,
        averageConcentration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          (chemicalProtocolGank?.organizationName),
          (chemicalProtocolGank?.organizationId),
          (chemicalProtocolGank?.measurementDate),
          (chemicalProtocolGank?.workplace),
          (chemicalProtocolGank?.workplaceId),
          (chemicalProtocolGank?.protocolId),
          (chemicalProtocolGank?.familyName),
          (chemicalProtocolGank?.parameterName),
          (chemicalProtocolGank?.concentration1_1),
          (chemicalProtocolGank?.concentration2_1),
          (chemicalProtocolGank?.averageConcentration),
        ]);
    return result;
  }

  Future<List<ChemicalProtocolGankModel>?> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ? AND protocolId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId, protocolName?.protocolId]);
      list = maps!.isNotEmpty ? maps.map((e) => ChemicalProtocolGankModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<ChemicalProtocolGankModel>> updateTableProtocol(
      ChemicalProtocolGankModel? chemicalProtocolGank) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        '''UPDATE $table SET organizationName = ?, 
        organizationId = ?, 
        measurementDate = ?, 
        workplace = ?, 
        workplaceId = ?, 
        protocolId = ?,
        familyName = ?,
        parameterName = ?, 
        concentration1_1 = ?,
        concentration2_1 = ?,
        averageConcentration = ?
        WHERE id = ?''',
        [
          (chemicalProtocolGank?.organizationName),
          (chemicalProtocolGank?.organizationId),
          (chemicalProtocolGank?.measurementDate),
          (chemicalProtocolGank?.workplace),
          (chemicalProtocolGank?.workplaceId),
          (chemicalProtocolGank?.protocolId),
          (chemicalProtocolGank?.familyName),
          (chemicalProtocolGank?.parameterName),
          (chemicalProtocolGank?.concentration1_1),
          (chemicalProtocolGank?.concentration2_1),
          (chemicalProtocolGank?.averageConcentration),
          chemicalProtocolGank?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [chemicalProtocolGank?.id]);
      list = result!.isNotEmpty ? result.map((e) => ChemicalProtocolGankModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  void deleteTableProtocol() async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table;');
  }

  Future<dynamic> removeTableProtocol(ChemicalProtocolGankModel? chemicalProtocolGank) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${chemicalProtocolGank?.id});');
  }
}
