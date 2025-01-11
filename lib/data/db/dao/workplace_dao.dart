import 'package:flutter/foundation.dart';
import '../../models/organization_model/organization_model.dart';
import '../../models/workplace_model/workplace_model.dart';
import '../database_helper.dart';

class WorkplaceDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'workplace_name';
  static const columnId = 'id';
  static const columnOrganizationName = 'organizationName';
  static const columnOrganizationId = 'organizationId';
  static const columnDpartmentName = 'departmentName';
  static const columnWorkplaceName = 'workplaceName';
  static const columnWorkplaceId = 'workplaceId';

  List<WorkplaceModel> list = [];

  Future<List<WorkplaceModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => WorkplaceModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTable() async {
    final db = await dbHelper.database;
    var result =
    db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => WorkplaceModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTable(WorkplaceModel? workplaceModel) async {
    final db = await dbHelper.database;
    var result = db?.execute(
        'INSERT INTO $table (organizationName, organizationId, departmentName, workplaceName, workplaceId) VALUES (?, ?, ?, ?, ?)',
        [
          (workplaceModel?.organizationName),
          (workplaceModel?.organizationId),
          (workplaceModel?.departmentName),
          (workplaceModel?.workplaceName),
          (workplaceModel?.workplaceId),
        ]);
    return result;
  }

  Future<List<WorkplaceModel>> getWorkplace(OrganizationModel? organization) async {
    final db = await dbHelper.database;
    try {
      var maps = db?.select('SELECT * FROM $table WHERE organizationId = ?', [organization?.organizationId]);
      list = maps!.isNotEmpty ? maps.map((e) => WorkplaceModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<WorkplaceModel>> updateTable(WorkplaceModel? workplaceModel) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET organizationName = ?, organizationId = ?, departmentName = ?, workplaceName = ?, workplaceId = ?, WHERE id = ?',
        [
          (workplaceModel?.organizationName),
          (workplaceModel?.organizationId),
          (workplaceModel?.departmentName),
          (workplaceModel?.workplaceName),
          (workplaceModel?.workplaceId),
        ],
      );
      var result =
      db?.select('SELECT * FROM $table WHERE id = ?', [workplaceModel?.id]);
      list = result!.isNotEmpty ? result.map((e) => WorkplaceModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTable(WorkplaceModel? workplaceModel) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${workplaceModel?.id});');
  }
}
