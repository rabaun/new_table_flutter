import 'package:flutter/foundation.dart';

import '../../models/organization_model/organization_model.dart';
import '../database_helper.dart';

class OrganizationDao {
  final dbHelper = DatabaseHelper.instance;
  List<OrganizationModel> organizationList = [];
  static const table = 'organization_name';
  static const columnId = 'id';
  static const columnName = 'organizationName';

  Future<dynamic> addOrganization(OrganizationModel? organization) async {
    final db = await dbHelper.database;
    var users = db?.execute(
        'INSERT INTO $table (organizationName) VALUES (?)',
        [
          (organization?.organizationName),
        ]);
    return users;
  }

  Future<List<OrganizationModel>> getOrganization() async {
    final db = await dbHelper.database;
    var maps = db?.select('SELECT * FROM $table;');
    organizationList =
    maps!.isNotEmpty ? maps.map((e) => OrganizationModel.fromJson(e)).toList() : [];
    return organizationList;
  }

  Future<List<OrganizationModel>> updateOrganization(OrganizationModel? organization) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET organizationId = ? WHERE id = ?',
        [
          organization?.organizationName,
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
