import 'package:flutter/foundation.dart';

import '../../models/intensity_work_process_model/intensity_work_process_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class IntensityWorkProcessDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'intensity_work_process';

  List<IntensityWorkProcessModel> list = [];
  IntensityWorkProcessModel? intensityWorkProcessModel;

  Future<List<IntensityWorkProcessModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => IntensityWorkProcessModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => IntensityWorkProcessModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(IntensityWorkProcessModel? intensityWorkProcess) async {
    final db = await dbHelper.database;
    var result = db?.execute('''INSERT INTO $table 
    (organizationName, organizationId, measurementDate, workplace, workplaceId, parameterName,  signalDensity,
     simultaneousObjectsCount,  opticalDeviceUsage, voiceApparatusLoadHours, auditoryAnalyzerLoad,
     focusedObservationDuration, monotonyLoads, elementsCount, monotonyEnvironment, activeObservationTime)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          (intensityWorkProcess?.organizationName),
          (intensityWorkProcess?.organizationId),
          (intensityWorkProcess?.measurementDate),
          (intensityWorkProcess?.workplace),
          (intensityWorkProcess?.workplaceId),
          (intensityWorkProcess?.parameterName),
          (intensityWorkProcess?.signalDensity),
          (intensityWorkProcess?.simultaneousObjectsCount),
          (intensityWorkProcess?.opticalDeviceUsage),

          (intensityWorkProcess?.voiceApparatusLoadHours),
          (intensityWorkProcess?.auditoryAnalyzerLoad),
          (intensityWorkProcess?.focusedObservationDuration),
          (intensityWorkProcess?.monotonyLoads),
          (intensityWorkProcess?.elementsCount),
          (intensityWorkProcess?.monotonyEnvironment),
          (intensityWorkProcess?.activeObservationTime),
        ]);
    return result;
  }

  Future<List<IntensityWorkProcessModel>> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<IntensityWorkProcessModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId]);
      list = maps!.isNotEmpty ? maps.map((e) => IntensityWorkProcessModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<IntensityWorkProcessModel>> updateTableProtocol(
      IntensityWorkProcessModel? intensityWorkProcess) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        'UPDATE $table SET organizationName = ?, organizationId = ?, measurementDate = ?, workplace = ?,  workplaceId =?, parameterName =?, parameterValue =? WHERE id = ?',
        [
          (intensityWorkProcess?.organizationName),
          (intensityWorkProcess?.organizationId),
          (intensityWorkProcess?.measurementDate),
          (intensityWorkProcess?.workplace),
          (intensityWorkProcess?.workplaceId),
          (intensityWorkProcess?.parameterName),
          (intensityWorkProcess?.signalDensity),
          (intensityWorkProcess?.simultaneousObjectsCount),
          (intensityWorkProcess?.opticalDeviceUsage),
          (intensityWorkProcess?.voiceApparatusLoadHours),
          (intensityWorkProcess?.auditoryAnalyzerLoad),
          (intensityWorkProcess?.focusedObservationDuration),
          (intensityWorkProcess?.monotonyLoads),
          (intensityWorkProcess?.elementsCount),
          (intensityWorkProcess?.monotonyEnvironment),
          (intensityWorkProcess?.activeObservationTime),
          intensityWorkProcess?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [intensityWorkProcess?.id]);
      list = result!.isNotEmpty ? result.map((e) => IntensityWorkProcessModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(IntensityWorkProcessModel? intensityWorkProcess) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${intensityWorkProcess?.id});');
  }
}
