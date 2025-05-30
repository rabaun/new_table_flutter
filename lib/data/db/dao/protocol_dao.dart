import 'package:flutter/foundation.dart';

import '../../models/organization_model/organization_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../../models/workplace_model/workplace_model.dart';
import '../database_helper.dart';

class ProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  List<ProtocolNameModel> deviceList = [];
  static const table = 'protocol_name';

  List<ProtocolNameModel> list = [];
  ProtocolNameModel? tableModel;

  Future<List<ProtocolNameModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => ProtocolNameModel.fromJson(e)).toList() : [];
    return list;
  }

  getProtocolName() async {
    final db = await dbHelper.database;
    var result =
    db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => ProtocolNameModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addProtocolName(ProtocolNameModel? protocol) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        'INSERT INTO $table (organizationName, organizationId, workplace, workplaceId, protocolName, protocolId) VALUES (?, ?, ?, ?, ?, ?)',
        [
          (protocol?.organizationName),
          (protocol?.organizationId),
          (protocol?.workplace),
          (protocol?.workplaceId),
          (protocol?.protocolName),
          (protocol?.protocolId),
        ]);
    return result;
  }

  Future<List<ProtocolNameModel>?> getProtocol(OrganizationModel? organization, WorkplaceModel? workplaceName) async {
    final db = await dbHelper.database;
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [organization?.organizationId, workplaceName?.workplaceId]);
      list = maps!.isNotEmpty ? maps.map((e) => ProtocolNameModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<ProtocolNameModel>> updateProtocol(ProtocolNameModel? protocol) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET organizationName = ?, organizationNId = ?, workplace = ?, workplaceId =?, protocolName = ?, protocolId = ?  WHERE id = ?',
        [
          protocol?.organizationName,
          protocol?.organizationId,
          protocol?.workplace,
          protocol?.workplaceId,
          protocol?.protocolName,
          protocol?.protocolId,
          protocol?.id,
        ],
      );
      var result =
      db?.select('SELECT * FROM $table WHERE id = ?', [protocol?.id]);
      list = result!.isNotEmpty ? result.map((e) => ProtocolNameModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeProtocolName(ProtocolNameModel? protocol) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${protocol?.id});');
  }
}
