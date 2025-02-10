import 'package:flutter/foundation.dart';

import '../../models/chemical_protocol_geolan_model/chemical_protocol_geolan_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class ChemicalProtocolGeolanDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'chemical_protocol_geolan';

  List<ChemicalProtocolGeolanModel> list = [];
  ChemicalProtocolGeolanModel? tableModel;

  Future<List<ChemicalProtocolGeolanModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => ChemicalProtocolGeolanModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => ChemicalProtocolGeolanModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(ChemicalProtocolGeolanModel? chemicalProtocolGeolan) async {
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
        parameterValue) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          (chemicalProtocolGeolan?.organizationName),
          (chemicalProtocolGeolan?.organizationId),
          (chemicalProtocolGeolan?.measurementDate),
          (chemicalProtocolGeolan?.workplace),
          (chemicalProtocolGeolan?.workplaceId),
          (chemicalProtocolGeolan?.protocolId),
          (chemicalProtocolGeolan?.familyName),
          (chemicalProtocolGeolan?.parameterName),
          (chemicalProtocolGeolan?.parameterValue),
        ]);
    return result;
  }

  Future<List<ChemicalProtocolGeolanModel>?> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ? AND protocolId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId, protocolName?.protocolId]);
      list = maps!.isNotEmpty ? maps.map((e) => ChemicalProtocolGeolanModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<ChemicalProtocolGeolanModel>> updateTableProtocol(
      ChemicalProtocolGeolanModel? chemicalProtocolGeolan) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        '''UPDATE $table SET 
        organizationName = ?, 
        organizationId = ?, 
        measurementDate = ?,
        workplace = ?, 
        workplaceId = ?,
        protocolId = ?,
        familyName = ?, 
        parameterName = ?,
        parameterValue = ?
        WHERE id = ?''',
        [
          chemicalProtocolGeolan?.organizationName,
          chemicalProtocolGeolan?.organizationId,
          chemicalProtocolGeolan?.measurementDate,
          chemicalProtocolGeolan?.workplace,
          chemicalProtocolGeolan?.workplaceId,
          chemicalProtocolGeolan?.protocolId,
          chemicalProtocolGeolan?.familyName,
          chemicalProtocolGeolan?.parameterName,
          chemicalProtocolGeolan?.parameterValue,
          chemicalProtocolGeolan?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [chemicalProtocolGeolan?.id]);
      list = result!.isNotEmpty ? result.map((e) => ChemicalProtocolGeolanModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(ChemicalProtocolGeolanModel? chemicalProtocolGeolan) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${chemicalProtocolGeolan?.id});');
  }
}
