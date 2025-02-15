import 'package:flutter/foundation.dart';
import '../../models/lighting_protocol_model/lighting_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class LightingProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'lighting_protocol';

  List<LightingProtocolModel> list = [];
  LightingProtocolModel? tableModel;

  Future<List<LightingProtocolModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => LightingProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => LightingProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(LightingProtocolModel? lightingProtocol) async {
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
        parameterValue1,
        parameterValue2,
        parameterValue3,
        averageConcentration
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          (lightingProtocol?.organizationName),
          (lightingProtocol?.organizationId),
          (lightingProtocol?.measurementDate),
          (lightingProtocol?.workplace),
          (lightingProtocol?.workplaceId),
          (lightingProtocol?.protocolId),
          (lightingProtocol?.familyName),
          (lightingProtocol?.parameterName),
          (lightingProtocol?.parameterValue1),
          (lightingProtocol?.parameterValue2),
          (lightingProtocol?.parameterValue3),
          (lightingProtocol?.averageConcentration),
        ]);
    return result;
  }

  Future<List<LightingProtocolModel>?> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ? AND protocolId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId, protocolName?.protocolId]);
      list = maps!.isNotEmpty ? maps.map((e) => LightingProtocolModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<LightingProtocolModel>> updateTableProtocol(
      LightingProtocolModel? lightingProtocol) async {
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
        parameterValue1 = ?,
        parameterValue2 = ?,
        parameterValue3 = ?,
        averageConcentration = ?
        WHERE id = ?''',
        [
          lightingProtocol?.organizationName,
          lightingProtocol?.organizationId,
          lightingProtocol?.measurementDate,
          lightingProtocol?.workplace,
          lightingProtocol?.workplaceId,
          lightingProtocol?.protocolId,
          lightingProtocol?.familyName,
          lightingProtocol?.parameterName,
          lightingProtocol?.parameterValue1,
          lightingProtocol?.parameterValue2,
          lightingProtocol?.parameterValue3,
          lightingProtocol?.averageConcentration,
          lightingProtocol?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [lightingProtocol?.id]);
      list = result!.isNotEmpty ? result.map((e) => LightingProtocolModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(LightingProtocolModel? lightingProtocol) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${lightingProtocol?.id});');
  }
}
