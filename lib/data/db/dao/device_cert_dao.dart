import 'package:flutter/foundation.dart';

import '../../models/device_cert_model/table_model.dart';
import '../../models/device_model/device_model.dart';
import '../database_helper.dart';

class DeviceCertDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'device_cert';
  static const columnId = 'id';
  static const columnCerVerification = 'cerVerification';
  static const columnStartTime = 'startTime';
  static const columnEndTime = 'endTime';

  List<DeviceCertModel> list = [];

  Future<List<DeviceCertModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => DeviceCertModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTable() async {
    final db = await dbHelper.database;
    var result =
        db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => DeviceCertModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTable(DeviceCertModel? tableModel) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        'INSERT INTO $table (serialNumber, cerVerification, startTime, endTime) VALUES (?, ?, ?, ?)',
        [
          (tableModel?.serialNumber),
          (tableModel?.cerVerification),
          (tableModel?.startTime),
          (tableModel?.endTime)
        ]);
    return result;
  }

  Future<List<DeviceCertModel>?> getSerialNumberData(DeviceModel? deviceModel) async {
    final db = await dbHelper.database;
    try {
      var maps = db?.select('SELECT * FROM $table WHERE serialNumber = ?', [deviceModel?.serialNumber]);
      list = maps!.isNotEmpty ? maps.map((e) => DeviceCertModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<DeviceCertModel>> updateTable(DeviceCertModel? tableModel) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET serialNumber = ?, '
        'cerVerification = ?, '
        'startTime = ?, '
        'endTime = ? '
        'WHERE id = ?',
        [
          tableModel?.serialNumber,
          tableModel?.cerVerification,
          tableModel?.startTime,
          tableModel?.endTime,
          tableModel?.id,
        ],
      );
      var result =
          db?.select('SELECT * FROM $table WHERE id = ?', [tableModel?.id]);
      list = result!.isNotEmpty ? result.map((e) => DeviceCertModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  void deleteDatabase() async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table;');
  }

  Future<dynamic> removeTable(DeviceCertModel? tableModel) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${tableModel?.id});');
  }
}
