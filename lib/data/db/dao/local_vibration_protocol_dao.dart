import 'package:flutter/foundation.dart';

import '../../models/local_vibration_protocol_model/local_vibration_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class LocalVibrationProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'local_vibration_protocol';

  List<LocalVibrationProtocolModel> list = [];

  Future<List<LocalVibrationProtocolModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => LocalVibrationProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => LocalVibrationProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(LocalVibrationProtocolModel? localVibration) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        '''INSERT INTO $table (
        organizationName, 
        organizationId, 
        measurementDate, 
        workplace, 
        workplaceId, 
        parameterName, 
        protocolId, 
        familyName, 
        
        correctedLevelX1,
        correctedLevelX2, 
        correctedLevelX3, 
        averageCorrectedLevelX, 
 
        correctedLevelY1, 
        correctedLevelY2, 
        correctedLevelY3, 
        averageCorrectedLevelY,
         
        correctedLevelZ1,
        correctedLevelZ2,
        correctedLevelZ3,
        averageCorrectedLevelZ
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          (localVibration?.organizationName),
          (localVibration?.organizationId),
          (localVibration?.measurementDate),
          (localVibration?.workplace),
          (localVibration?.workplaceId),
          (localVibration?.parameterName),
          (localVibration?.protocolId),
          (localVibration?.familyName),

          (localVibration?.correctedLevelX1),
          (localVibration?.correctedLevelX2),
          (localVibration?.correctedLevelX3),
          (localVibration?.averageCorrectedLevelX),

          (localVibration?.correctedLevelY1),
          (localVibration?.correctedLevelY2),
          (localVibration?.correctedLevelY3),
          (localVibration?.averageCorrectedLevelY),

          (localVibration?.correctedLevelZ1),
          (localVibration?.correctedLevelZ2),
          (localVibration?.correctedLevelZ3),
          (localVibration?.averageCorrectedLevelZ),

        ]);
    return result;
  }

  Future<List<LocalVibrationProtocolModel>> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<LocalVibrationProtocolModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId]);
      list = maps!.isNotEmpty ? maps.map((e) => LocalVibrationProtocolModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<LocalVibrationProtocolModel>> updateTableProtocol(
      LocalVibrationProtocolModel? localVibration) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        '''UPDATE $table SET 
        organizationName = ?, 
        organizationId = ?, 
        measurementDate = ?, 
        workplace = ?,  
        workplaceId =?, 
        parameterName =?, 
        protocolId = ?,
        familyName = ?, 
        
        correctedLevelX1 =?, 
        correctedLevelX2 =?, 
        correctedLevelX3 =?, 
        averageCorrectedLevelX =?, 

        correctedLevelY1 =?, 
        correctedLevelY2 =?, 
        correctedLevelY3 =?, 
        averageCorrectedLevelY =?, 

        correctedLevelZ1 =?, 
        correctedLevelZ2 =?,
        correctedLevelZ3 =?,
        averageCorrectedLevelZ =? 
        
        WHERE id = ?''',
        [
          (localVibration?.organizationName),
          (localVibration?.organizationId),
          (localVibration?.measurementDate),
          (localVibration?.workplace),
          (localVibration?.workplaceId),
          (localVibration?.parameterName),
          (localVibration?.protocolId),
          (localVibration?.familyName),

          (localVibration?.correctedLevelX1),
          (localVibration?.correctedLevelX2),
          (localVibration?.correctedLevelX3),
          (localVibration?.averageCorrectedLevelX),

          (localVibration?.correctedLevelY1),
          (localVibration?.correctedLevelY2),
          (localVibration?.correctedLevelY3),
          (localVibration?.averageCorrectedLevelY),

          (localVibration?.correctedLevelZ1),
          (localVibration?.correctedLevelZ2),
          (localVibration?.correctedLevelZ3),
          (localVibration?.averageCorrectedLevelZ),

          localVibration?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [localVibration?.id]);
      list = result!.isNotEmpty ? result.map((e) => LocalVibrationProtocolModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(LocalVibrationProtocolModel? localVibration) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${localVibration?.id});');
  }
}
