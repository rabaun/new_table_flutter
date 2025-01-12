import 'package:flutter/foundation.dart';

import '../../models/general_vibration_protocol_model/general_vibration_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class GeneralVibrationProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'general_vibration_protocol';
  static const columnId = 'id';
  static const columnOrganizationName = 'organizationName';
  static const columnWorkplace = 'workplace';
  static const columnWorkplaceId = 'workplaceId';
  static const columnParameterName = 'parameterName';
  static const columnCorrectedLevelX = 'correctedLevelX';
  static const columnCorrectedLevelY = 'correctedLevelY';
  static const columnCorrectedLevelZ = 'correctedLevelZ';

  List<GeneralVibrationProtocolModel> list = [];
  GeneralVibrationProtocolModel? generalVibrationProtocolModel;

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
        'INSERT INTO $table (organizationName, organizationId, measurementDate, workplace, workplaceId, parameterName, correctedLevelX, correctedLevelY, correctedLevelZ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          (generalVibration?.organizationName),
          (generalVibration?.organizationId),
          (generalVibration?.measurementDate),
          (generalVibration?.workplace),
          (generalVibration?.workplaceId),
          (generalVibration?.parameterName),
          (generalVibration?.correctedLevelX),
          (generalVibration?.correctedLevelY),
          (generalVibration?.correctedLevelZ),
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
        'UPDATE $table SET organizationName = ?, organizationId = ?, measurementDate = ?, workplace = ?,  workplaceId =?, parameterName =?, correctedLevelX =?, correctedLevelY =?, correctedLevelZ =? WHERE id = ?',
        [
          (generalVibration?.organizationName),
          (generalVibration?.organizationId),
          (generalVibration?.measurementDate),
          (generalVibration?.workplace),
          (generalVibration?.workplaceId),
          (generalVibration?.parameterName),
          (generalVibration?.correctedLevelX),
          (generalVibration?.correctedLevelY),
          (generalVibration?.correctedLevelZ),
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
