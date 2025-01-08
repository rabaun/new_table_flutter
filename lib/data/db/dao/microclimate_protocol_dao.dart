import 'package:flutter/foundation.dart';

import '../../models/microclimate_protocol_model/microclimate_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class MicroclimateProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'microclimate_protocol';
  static const columnId = 'id';
  static const columnOrganizationName = 'organizationName';
  static const columnWorkplace = 'workplace';
  static const columnWorkplaceId = 'workplaceId';
  static const columnParameterName = 'parameterName';
  static const columnAirTemperature01m = 'airTemperature01m';
  static const columnAirTemperature15m = 'airTemperature15m';
  static const columnTncIndex01m = 'tncIndex01m';
  static const columnTncIndex15m = 'tncIndex15m';
  static const columnairVelocity01m = 'airVelocity01m';
  static const columnairVelocity15m = 'airVelocity15m';
  static const columnRelativeHumidity = 'relativeHumidity';

  List<MicroclimateProtocolModel> list = [];
  MicroclimateProtocolModel? microclimateProtocolModel;

  Future<List<MicroclimateProtocolModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(MicroclimateProtocolModel? microclimate) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        'INSERT INTO $table (organizationName, measurementDate, workplace, workplaceId, parameterName, airTemperature01m, airTemperature15m, tncIndex01m, tncIndex15m, airVelocity01m, airVelocity15m, relativeHumidity) VALUES (?, ?,?,?, ?, ?, ?, ?,?,?,?,?)',
        [
          (microclimate?.organizationName),
          (microclimate?.measurementDate),
          (microclimate?.workplace),
          (microclimate?.workplaceId),
          (microclimate?.parameterName),
          (microclimate?.airTemperature01m),
          (microclimate?.airTemperature15m),
          (microclimate?.tncIndex01m),
          (microclimate?.tncIndex15m),
          (microclimate?.airVelocity01m),
          (microclimate?.airVelocity15m),
          (microclimate?.relativeHumidity),

        ]);
    return result;
  }

  Future<List<MicroclimateProtocolModel>> getWorkplace(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<MicroclimateProtocolModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [protocolName?.organizationName, protocolName?.workplaceId]);
      list = maps!.isNotEmpty ? maps.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }


  Future<List<MicroclimateProtocolModel>> updateTableProtocol(
      MicroclimateProtocolModel? microclimate) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET organizationName = ?, measurementDate = ?, workplace = ?,  workplaceId =?, parameterName =?, parameterValue =? WHERE id = ?',
        [
          (microclimate?.organizationName),
          (microclimate?.measurementDate),
          (microclimate?.workplace),
          (microclimate?.workplaceId),
          (microclimate?.parameterName),
          (microclimate?.airTemperature01m),
          (microclimate?.airTemperature15m),
          (microclimate?.tncIndex01m),
          (microclimate?.tncIndex15m),
          (microclimate?.airVelocity01m),
          (microclimate?.airVelocity15m),
          (microclimate?.relativeHumidity),
          microclimate?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [microclimate?.id]);
      list = result!.isNotEmpty ? result.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(MicroclimateProtocolModel? microclimate) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${microclimate?.id});');
  }
}
