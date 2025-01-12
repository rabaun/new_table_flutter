import 'package:flutter/foundation.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../../models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';
import '../database_helper.dart';

class UltravioletRadiationProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'ultraviolet_radiation_protocol';
  static const columnId = 'id';
  static const columnOrganizationName = 'organizationName';
  static const columnWorkplace = 'workplace';
  static const columnWorkplaceId = 'workplaceId';
  static const columnParameterName = 'parameterName';
  static const columnUvAIntensityH05_10 = 'uvAIntensityH05_10';
  static const columnUvAIntensityH15 = 'uvAIntensityH15';
  static const columnUvBIntensityH05_10 = 'uvBIntensityH05_10';
  static const columnUvBIntensityH15 = 'uvBIntensityH15';

  List<UltravioletRadiationProtocolModel> list = [];

  Future<List<UltravioletRadiationProtocolModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => UltravioletRadiationProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => UltravioletRadiationProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(UltravioletRadiationProtocolModel? ultravioletRadiation) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        'INSERT INTO $table (organizationName, organizationId, measurementDate, workplace, workplaceId, parameterName, uvAIntensityH05_10, uvAIntensityH15, uvBIntensityH05_10, uvBIntensityH15) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          (ultravioletRadiation?.organizationName),
          (ultravioletRadiation?.organizationId),
          (ultravioletRadiation?.measurementDate),
          (ultravioletRadiation?.workplace),
          (ultravioletRadiation?.workplaceId),
          (ultravioletRadiation?.parameterName),
          (ultravioletRadiation?.uvAIntensityH05_10),
          (ultravioletRadiation?.uvAIntensityH15),
          (ultravioletRadiation?.uvBIntensityH05_10),
          (ultravioletRadiation?.uvBIntensityH15),
        ]);
    return result;
  }

  Future<List<UltravioletRadiationProtocolModel>> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<UltravioletRadiationProtocolModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId]);
      list = maps!.isNotEmpty ? maps.map((e) => UltravioletRadiationProtocolModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<UltravioletRadiationProtocolModel>> updateTableProtocol(
      UltravioletRadiationProtocolModel? ultravioletRadiation) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET organizationName = ?, organizationId = ?, measurementDate = ?, workplace = ?,  workplaceId =?, parameterName =?, uvAIntensityH05_10 =?, uvAIntensityH15 =?, uvBIntensityH05_10 =?, uvBIntensityH15 =?,  WHERE id = ?',
        [
          (ultravioletRadiation?.organizationName),
          (ultravioletRadiation?.organizationId),
          (ultravioletRadiation?.measurementDate),
          (ultravioletRadiation?.workplace),
          (ultravioletRadiation?.workplaceId),
          (ultravioletRadiation?.parameterName),
          (ultravioletRadiation?.uvAIntensityH05_10),
          (ultravioletRadiation?.uvAIntensityH15),
          (ultravioletRadiation?.uvBIntensityH05_10),
          (ultravioletRadiation?.uvBIntensityH15),
          ultravioletRadiation?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [ultravioletRadiation?.id]);
      list = result!.isNotEmpty ? result.map((e) => UltravioletRadiationProtocolModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(UltravioletRadiationProtocolModel? ultravioletRadiation) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${ultravioletRadiation?.id});');
  }
}
