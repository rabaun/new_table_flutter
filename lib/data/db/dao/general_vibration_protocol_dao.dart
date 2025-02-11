import 'package:flutter/foundation.dart';

import '../../models/general_vibration_protocol_model/general_vibration_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class GeneralVibrationProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'general_vibration_protocol';

  List<GeneralVibrationProtocolModel> list = [];

  Future<List<GeneralVibrationProtocolModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => GeneralVibrationProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => GeneralVibrationProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(GeneralVibrationProtocolModel? generalVibration) async {
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
        ) VALUES (
        ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?, 
        ?, ?, ?, ?, ?)''',
        [
          (generalVibration?.organizationName),
          (generalVibration?.organizationId),
          (generalVibration?.measurementDate),
          (generalVibration?.workplace),
          (generalVibration?.workplaceId),
          (generalVibration?.parameterName),
          (generalVibration?.protocolId),
          (generalVibration?.familyName),

          (generalVibration?.correctedLevelX1),
          (generalVibration?.correctedLevelX2),
          (generalVibration?.correctedLevelX3),
          (generalVibration?.averageCorrectedLevelX),

          (generalVibration?.correctedLevelY1),
          (generalVibration?.correctedLevelY2),
          (generalVibration?.correctedLevelY3),
          (generalVibration?.averageCorrectedLevelY),

          (generalVibration?.correctedLevelZ1),
          (generalVibration?.correctedLevelZ2),
          (generalVibration?.correctedLevelZ3),
          (generalVibration?.averageCorrectedLevelZ),

        ]);
    return result;
  }

  Future<List<GeneralVibrationProtocolModel>> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<GeneralVibrationProtocolModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId]);
      list = maps!.isNotEmpty ? maps.map((e) => GeneralVibrationProtocolModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<GeneralVibrationProtocolModel>> updateTableProtocol(
      GeneralVibrationProtocolModel? generalVibration) async {
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
          (generalVibration?.organizationName),
          (generalVibration?.organizationId),
          (generalVibration?.measurementDate),
          (generalVibration?.workplace),
          (generalVibration?.workplaceId),
          (generalVibration?.parameterName),
          (generalVibration?.protocolId),
          (generalVibration?.familyName),

          (generalVibration?.correctedLevelX1),
          (generalVibration?.correctedLevelX2),
          (generalVibration?.correctedLevelX3),
          (generalVibration?.averageCorrectedLevelX),

          (generalVibration?.correctedLevelY1),
          (generalVibration?.correctedLevelY2),
          (generalVibration?.correctedLevelY3),
          (generalVibration?.averageCorrectedLevelY),

          (generalVibration?.correctedLevelZ1),
          (generalVibration?.correctedLevelZ2),
          (generalVibration?.correctedLevelZ3),
          (generalVibration?.averageCorrectedLevelZ),

          generalVibration?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [generalVibration?.id]);
      list = result!.isNotEmpty ? result.map((e) => GeneralVibrationProtocolModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(GeneralVibrationProtocolModel? generalVibration) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${generalVibration?.id});');
  }
}
