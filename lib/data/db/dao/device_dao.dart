import 'package:flutter/foundation.dart';

import '../../models/device_model/device_model.dart';
import '../database_helper.dart';

class DeviceDao {
  final dbHelper = DatabaseHelper.instance;
  List<DeviceModel> deviceList = [];
  static const table = 'devices';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnRegistryNumber = 'registryNumber';
  static const columnSerialNumber = 'serialNumber';

  Future<dynamic> addDevice(DeviceModel? device) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        'INSERT INTO $table (name, registryNumber, serialNumber) VALUES (?, ?, ?)',
        [
          (device?.name),
          (device?.registryNumber),
          (device?.serialNumber),
        ]);
    return result;
  }

  Future<List<DeviceModel>> getDevice() async {
    final db = await dbHelper.database;
    var maps = db?.select('SELECT * FROM $table;');
    deviceList =
        maps!.isNotEmpty ? maps.map((e) => DeviceModel.fromJson(e)).toList() : [];
    return deviceList;
  }

  Future<List<DeviceModel>> updateDevice(DeviceModel? device) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET serialNumber = ?, '
            'cerVerification = ?, '
            'startTime = ?, '
            'endTime = ? '
            'WHERE id = ?',
        [
          device?.name,
          device?.serialNumber,
          device?.registryNumber,
          device?.id,
        ],
      );
      var result =
      db?.select('SELECT * FROM $table WHERE id = ?', [device?.id]);
      if (result != null && result.isNotEmpty) {
        deviceList = result!.isNotEmpty ? result.map((e) => DeviceModel.fromJson(e)).toList() : [];      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
    return deviceList;
  }

  Future<dynamic> removeDevice(DeviceModel? user) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${user?.id});');
  }
}
