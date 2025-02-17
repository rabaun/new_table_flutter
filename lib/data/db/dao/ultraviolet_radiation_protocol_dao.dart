import 'package:flutter/foundation.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../../models/ultraviolet_radiation_protocol_model/ultraviolet_radiation_protocol_model.dart';
import '../database_helper.dart';

class UltravioletRadiationProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'ultraviolet_radiation_protocol';

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
        '''INSERT INTO $table (
        organizationName, 
        organizationId, 
        measurementDate, 
        workplace, 
        workplaceId, 
        parameterName, 
        protocolId, 
        familyName, 
        
        uvAIntensityH05_101, 
        uvAIntensityH05_102, 
        uvAIntensityH05_103, 
        averageUvAIntensityH05_10,
        
        uvAIntensityH151, 
        uvAIntensityH152, 
        uvAIntensityH153, 
        averageUvAIntensityH15,
        
        uvBIntensityH05_101, 
        uvBIntensityH05_102, 
        uvBIntensityH05_103, 
        averageUvBIntensityH05_10,
        
        uvBIntensityH151, 
        uvBIntensityH152, 
        uvBIntensityH153,
        averageUvBIntensityH15
        ) VALUES (
        ?, ?, ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?,
        ?, ?, ?, ?, 
        ?, ?, ?, ?,
        ?, ?, ?, ?
        )''',
        [
          (ultravioletRadiation?.organizationName),
          (ultravioletRadiation?.organizationId),
          (ultravioletRadiation?.measurementDate),
          (ultravioletRadiation?.workplace),
          (ultravioletRadiation?.workplaceId),
          (ultravioletRadiation?.parameterName),
          (ultravioletRadiation?.protocolId),
          (ultravioletRadiation?.familyName),

          (ultravioletRadiation?.uvAIntensityH05_101),
          (ultravioletRadiation?.uvAIntensityH05_102),
          (ultravioletRadiation?.uvAIntensityH05_103),
          (ultravioletRadiation?.averageUvAIntensityH05_10),

          (ultravioletRadiation?.uvAIntensityH151),
          (ultravioletRadiation?.uvAIntensityH152),
          (ultravioletRadiation?.uvAIntensityH153),
          (ultravioletRadiation?.averageUvAIntensityH15),

          (ultravioletRadiation?.uvBIntensityH05_101),
          (ultravioletRadiation?.uvBIntensityH05_102),
          (ultravioletRadiation?.uvBIntensityH05_103),
          (ultravioletRadiation?.averageUvBIntensityH05_10),

          (ultravioletRadiation?.uvBIntensityH151),
          (ultravioletRadiation?.uvBIntensityH152),
          (ultravioletRadiation?.uvBIntensityH153),
          (ultravioletRadiation?.averageUvBIntensityH15),
        ]);
    return result;
  }

  Future<List<UltravioletRadiationProtocolModel>> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<UltravioletRadiationProtocolModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?  AND protocolId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId, protocolName?.protocolId]);
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
        '''UPDATE $table SET 
        organizationName = ?, 
        organizationId = ?, 
        measurementDate = ?, 
        workplace = ?,  
        workplaceId =?, 
        parameterName =?,  
        protocolId =?, 
        familyName =?,  
        
        uvAIntensityH05_101 =?,  
        uvAIntensityH05_102 =?,  
        uvAIntensityH05_103 =?, 
        averageUvAIntensityH05_10 =?,
        
        uvAIntensityH151 =?, 
        uvAIntensityH152 =?, 
        uvAIntensityH153 =?, 
        averageUvAIntensityH15 =?, 
        
        uvBIntensityH05_101 =?, 
        uvBIntensityH05_102 =?, 
        uvBIntensityH05_103 =?, 
        averageUvBIntensityH05_10 =?,
        
        uvBIntensityH151 =?, 
        uvBIntensityH152 =?, 
        uvBIntensityH153 =?,
        averageUvBIntensityH15 =?
        
        WHERE id = ?''',
        [
          (ultravioletRadiation?.organizationName),
          (ultravioletRadiation?.organizationId),
          (ultravioletRadiation?.measurementDate),
          (ultravioletRadiation?.workplace),
          (ultravioletRadiation?.workplaceId),
          (ultravioletRadiation?.parameterName),
          (ultravioletRadiation?.protocolId),
          (ultravioletRadiation?.familyName),

          (ultravioletRadiation?.uvAIntensityH05_101),
          (ultravioletRadiation?.uvAIntensityH05_102),
          (ultravioletRadiation?.uvAIntensityH05_103),
          (ultravioletRadiation?.averageUvAIntensityH05_10),

          (ultravioletRadiation?.uvAIntensityH151),
          (ultravioletRadiation?.uvAIntensityH152),
          (ultravioletRadiation?.uvAIntensityH153),
          (ultravioletRadiation?.averageUvAIntensityH15),

          (ultravioletRadiation?.uvBIntensityH05_101),
          (ultravioletRadiation?.uvBIntensityH05_102),
          (ultravioletRadiation?.uvBIntensityH05_103),
          (ultravioletRadiation?.averageUvBIntensityH05_10),

          (ultravioletRadiation?.uvBIntensityH151),
          (ultravioletRadiation?.uvBIntensityH152),
          (ultravioletRadiation?.uvBIntensityH153),
          (ultravioletRadiation?.averageUvBIntensityH15),

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
