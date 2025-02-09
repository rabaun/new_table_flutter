import 'package:flutter/foundation.dart';

import '../../models/primary_protocol_model/primary_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class PrimaryProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'primary_protocol';

  List<PrimaryProtocolModel> list = [];
  PrimaryProtocolModel? tableModel;

  Future<List<PrimaryProtocolModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => PrimaryProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => PrimaryProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(PrimaryProtocolModel? primaryProtocol) async {
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
          (primaryProtocol?.organizationName),
          (primaryProtocol?.organizationId),
          (primaryProtocol?.measurementDate),
          (primaryProtocol?.workplace),
          (primaryProtocol?.workplaceId),
          (primaryProtocol?.protocolId),
          (primaryProtocol?.familyName),
          (primaryProtocol?.parameterName),
          (primaryProtocol?.parameterValue),
        ]);
    return result;
  }

  Future<List<PrimaryProtocolModel>?> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ? AND protocolId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId, protocolName?.protocolId]);
      list = maps!.isNotEmpty ? maps.map((e) => PrimaryProtocolModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<PrimaryProtocolModel>> updateTableProtocol(
      PrimaryProtocolModel? primaryProtocol) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        '''UPDATE $table SET organizationName = ?, 
        organizationId = ?, 
        measurementDate = ?, 
        workplace = ?, 
        workplaceId = ?, 
        familyName, 
        parameterName =?, 
        parameterValue =? 
        WHERE id = ?''',
        [
          primaryProtocol?.organizationName,
          primaryProtocol?.organizationId,
          primaryProtocol?.measurementDate,
          primaryProtocol?.workplace,
          primaryProtocol?.workplaceId,
          primaryProtocol?.protocolId,
          primaryProtocol?.familyName,
          primaryProtocol?.parameterName,
          primaryProtocol?.parameterValue,
          primaryProtocol?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [primaryProtocol?.id]);
      list = result!.isNotEmpty ? result.map((e) => PrimaryProtocolModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(PrimaryProtocolModel? primaryProtocol) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${primaryProtocol?.id});');
  }
}
