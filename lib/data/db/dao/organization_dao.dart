import 'package:flutter/foundation.dart';

import '../../models/organization_model/organization_model.dart';
import '../database_helper.dart';

class OrganizationDao {
  final dbHelper = DatabaseHelper.instance;
  List<OrganizationModel> organizationList = [];
  static const table = 'organization_name';
  static const columnId = 'id';
  static const columnName = 'organizationName';
  static const columnNameId = 'organizationId';

  Future<dynamic> addOrganization(OrganizationModel? organization) async {
    final db = await dbHelper.database;
    if (organization?.organizationName == null || organization?.organizationId == null) {
      print("Organization name or ID is null");
      return null;
    }
    try {
      var result = db?.execute(
          'INSERT INTO $table (organizationName, organizationId) VALUES (?, ?)',
          [
            organization?.organizationName,
            organization?.organizationId,
          ]);
      return result;
    } catch (e) {
      print("Error inserting organization: ${e.toString()}");
    }
    return null;
  }

  Future<List<OrganizationModel>> getOrganization() async {
    final db = await dbHelper.database;
    var maps = db?.select('SELECT * FROM $table;'); // Добавьте await
    organizationList = maps != null && maps.isNotEmpty
        ? maps.map((e) => OrganizationModel.fromJson(e)).toList()
        : [];

    // Вывод для отладки
    for (var org in organizationList) {
      print("Organization ID: ${org.organizationId}, Name: ${org.organizationName}");
    }
    return organizationList;
  }


  Future<List<OrganizationModel>> updateOrganization(OrganizationModel? organization) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET organizationName = ?, organizationId = ? WHERE id = ?',
        [
          organization?.organizationName,
          organization?.organizationId,
          organization?.id,
        ],
      );
      var result =
      db?.select('SELECT * FROM $table WHERE id = ?', [organization?.id]);
      if (result != null && result.isNotEmpty) {
        organizationList = result.isNotEmpty ? result.map((e) => OrganizationModel.fromJson(e)).toList() : [];      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
    return organizationList;
  }

  Future<dynamic> removeOrganization(OrganizationModel? organization) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${organization?.id});');
  }
}
