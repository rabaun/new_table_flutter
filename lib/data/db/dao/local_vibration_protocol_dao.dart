import 'package:flutter/foundation.dart';

import '../../models/general_vibration_protocol_model/general_vibration_protocol_model.dart';
import '../../models/local_vibration_protocol_model/local_vibration_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class LocalVibrationProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'microclimate_protocol';
  static const columnId = 'id';
  static const columnOrganizationName = 'organizationName';
  static const columnWorkplace = 'workplace';
  static const columnWorkplaceId = 'workplaceId';
  static const columnParameterName = 'parameterName';
  static const columnCorrectedLevelX = 'correctedLevelX';
  static const columnCorrectedLevelY = 'correctedLevelY';
  static const columnCorrectedLevelZ = 'correctedLevelZ';

  List<LocalVibrationProtocolModel> list = [];
  GeneralVibrationProtocolModel? generalVibrationProtocolModel;

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
        'INSERT INTO $table (organizationName, organizationId, measurementDate, workplace, workplaceId, parameterName, correctedLevelX, correctedLevelY, correctedLevelZ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          (localVibration?.organizationName),
          (localVibration?.measurementDate),
          (localVibration?.workplace),
          (localVibration?.workplaceId),
          (localVibration?.parameterName),
          (localVibration?.correctedLevelX),
          (localVibration?.correctedLevelY),
          (localVibration?.correctedLevelZ),
        ]);
    return result;
  }

  Future<List<LocalVibrationProtocolModel>> getWorkplace(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<LocalVibrationProtocolModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [protocolName?.organizationName, protocolName?.workplaceId]);
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
        'UPDATE $table SET organizationName = ?, organizationId = ?, measurementDate = ?, workplace = ?,  workplaceId =?, parameterName =?, correctedLevelX =?, correctedLevelY =?, correctedLevelZ =? WHERE id = ?',
        [
          (localVibration?.organizationName),
          (localVibration?.measurementDate),
          (localVibration?.workplace),
          (localVibration?.workplaceId),
          (localVibration?.parameterName),
          (localVibration?.correctedLevelX),
          (localVibration?.correctedLevelY),
          (localVibration?.correctedLevelZ),
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
