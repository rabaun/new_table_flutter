import 'package:flutter/foundation.dart';

import '../../models/protocol_name_model/protocol_name_model.dart';
import '../../models/severity_work_process_model/severity_work_process_model.dart';
import '../database_helper.dart';

class SeverityWorkProcessDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'severity_work_process';

  // Колонки таблицы
  static const columnId = 'id';
  static const columnOrganizationName = 'organizationName';
  static const columnOrganizationId = 'organizationId';
  static const columnMeasurementDate = 'measurementDate';
  static const columnWorkplace = 'workplace';
  static const columnWorkplaceId = 'workplaceId';
  static const columnParameterName = 'parameterName';

  // Поля для перемещения груза на расстояние до 1 м
  static const columnMassUpTo1mKg = 'massUpTo1mKg';
  static const columnDistanceUpTo1mM = 'distanceUpTo1mM';
  static const columnMovementCountUpTo1m = 'movementCountUpTo1m';

  // Поля для перемещения груза на расстояние от 1 до 5 м
  static const columnMass1To5mKg = 'mass1To5mKg';
  static const columnDistance1To5mM = 'distance1To5mM';
  static const columnMovementCount1To5m = 'movementCount1To5m';

  // Поля для перемещения груза на расстояние более 5 м
  static const columnMassMoreThan5mKg = 'massMoreThan5mKg';
  static const columnDistanceMoreThan5mM = 'distanceMoreThan5mM';
  static const columnMovementCountMoreThan5m = 'movementCountMoreThan5m';

  // Поля для подъема и перемещения тяжести
  static const columnLiftingIntermittentMassKg = 'liftingIntermittentMassKg';
  static const columnLiftingIntermittentMovementCount = 'liftingIntermittentMovementCount';

  // Поля для постоянного подъема и перемещения тяжести
  static const columnLiftingConstantMassKg = 'liftingConstantMassKg';
  static const columnLiftingConstantMovementCount = 'liftingConstantMovementCount';

  // Поля для подъема с рабочей поверхности
  static const columnLiftingFromSurfaceMassKg = 'liftingFromSurfaceMassKg';
  static const columnLiftingFromSurfaceMovementCount = 'liftingFromSurfaceMovementCount';

  // Поля для подъема с пола
  static const columnLiftingFromFloorMassKg = 'liftingFromFloorMassKg';
  static const columnLiftingFromFloorMovementCount = 'liftingFromFloorMovementCount';

  // Поля для стереотипных рабочих движений
  static const columnStereotypicalLocalMovementPerOperation =
      'stereotypicalLocalMovementPerOperation';
  static const columnStereotypicalLocalOperationCount = 'stereotypicalLocalOperationCount';

  // Поля для стереотипных движений при региональной нагрузке
  static const columnStereotypicalRegionalMovementPerOperation =
      'stereotypicalRegionalMovementPerOperation';
  static const columnStereotypicalRegionalOperationCount = 'stereotypicalRegionalOperationCount';

  // Поля для статической нагрузки (одной рукой)
  static const columnStaticLoadOneHandMassKg = 'staticLoadOneHandMassKg';
  static const columnStaticLoadOneHandHoldingTimeS = 'staticLoadOneHandHoldingTimeS';
  static const columnStaticLoadOneHandOperationCount = 'staticLoadOneHandOperationCount';

  // Поля для статической нагрузки (двумя руками)
  static const columnStaticLoadTwoHandsMassKg = 'staticLoadTwoHandsMassKg';
  static const columnStaticLoadTwoHandsHoldingTimeS = 'staticLoadTwoHandsHoldingTimeS';
  static const columnStaticLoadTwoHandsOperationCount = 'staticLoadTwoHandsOperationCount';

  // Поля для статической нагрузки (с участием мышц корпуса и ног)
  static const columnStaticLoadBodyAndLegsMassKg = 'staticLoadBodyAndLegsMassKg';
  static const columnStaticLoadBodyAndLegsHoldingTimeS = 'staticLoadBodyAndLegsHoldingTimeS';
  static const columnStaticLoadBodyAndLegsOperationCount = 'staticLoadBodyAndLegsOperationCount';

  // Поля для рабочей позы
  static const columnFreePosturePercentage = 'freePosturePercentage';
  static const columnStandingPosturePercentage = 'standingPosturePercentage';
  static const columnUncomfortablePosturePercentage = 'uncomfortablePosturePercentage';
  static const columnFixedPosturePercentage = 'fixedPosturePercentage';
  static const columnForcedPosturePercentage = 'forcedPosturePercentage';
  static const columnSittingPosturePercentage = 'sittingPosturePercentage';

  // Поля для наклонов корпуса
  static const columnTiltsPerOperation = 'tiltsPerOperation';
  static const columnTiltsOperationCount = 'tiltsOperationCount';

  // Поля для перемещения в пространстве (горизонтально)
  static const columnHorizontalMovementDistanceKm = 'horizontalMovementDistanceKm';
  static const columnHorizontalMovementDistancePerMoveM = 'horizontalMovementDistancePerMoveM';
  static const columnHorizontalMovementCount = 'horizontalMovementCount';

  // Поля для перемещения в пространстве (вертикально)
  static const columnVerticalMovementDistanceKm = 'verticalMovementDistanceKm';
  static const columnVerticalMovementDistancePerMoveM = 'verticalMovementDistancePerMoveM';
  static const columnVerticalMovementCount = 'verticalMovementCount';

  List<SeverityWorkProcessModel> list = [];
  SeverityWorkProcessModel? tableModel;

  Future<List<SeverityWorkProcessModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list =
        result!.isNotEmpty ? result.map((e) => SeverityWorkProcessModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list =
        result!.isNotEmpty ? result.map((e) => SeverityWorkProcessModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(SeverityWorkProcessModel? severityWork) async {
    final db = await dbHelper.database;
    var result = db?.execute(''' INSERT INTO $table
    (organizationName, 
    organizationId, 
    measurementDate, 
    workplace,  
    workplaceId,  
    parameterName,
    massUpTo1mKg, 
    distanceUpTo1mM,  
    movementCountUpTo1m, 
    mass1To5mKg, 
    distance1To5mM, 
    movementCount1To5m,
    massMoreThan5mKg, 
    distanceMoreThan5mM, 
    movementCountMoreThan5m, 
    liftingIntermittentMassKg,
    liftingIntermittentMovementCount, 
    liftingConstantMassKg,
    liftingConstantMovementCount,
    liftingFromSurfaceMassKg, 
    liftingFromSurfaceMovementCount, 
    liftingFromFloorMassKg, 
    liftingFromFloorMovementCount, 
    stereotypicalLocalMovementPerOperation,
    stereotypicalLocalOperationCount,
    stereotypicalRegionalMovementPerOperation,
    stereotypicalRegionalOperationCount, 
    staticLoadOneHandMassKg, 
    staticLoadOneHandHoldingTimeS, 
    staticLoadOneHandOperationCount, 
    staticLoadTwoHandsMassKg,
    staticLoadTwoHandsHoldingTimeS, 
    staticLoadTwoHandsOperationCount, 
    staticLoadBodyAndLegsMassKg, 
    staticLoadBodyAndLegsHoldingTimeS, 
    staticLoadBodyAndLegsOperationCount, 
    freePosturePercentage,
    standingPosturePercentage, 
    uncomfortablePosturePercentage, 
    fixedPosturePercentage, 
    forcedPosturePercentage, 
    sittingPosturePercentage, 
    tiltsPerOperation, 
    tiltsOperationCount,
    horizontalMovementDistanceKm, 
    horizontalMovementDistancePerMoveM, 
    horizontalMovementCount, 
    verticalMovementDistanceKm, 
    verticalMovementDistancePerMoveM, 
    verticalMovementCount)
    VALUES (?, ?, ?,  ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
      severityWork?.organizationName,
      severityWork?.organizationId,
      severityWork?.measurementDate,
      severityWork?.workplace,
      severityWork?.workplaceId,
      severityWork?.parameterName,

      // Поля для перемещения груза на расстояние до 1 м
      severityWork?.massUpTo1mKg,
      severityWork?.distanceUpTo1mM,
      severityWork?.movementCountUpTo1m,

      // Поля для перемещения груза на расстояние от 1 до 5 м
      severityWork?.mass1To5mKg,
      severityWork?.distance1To5mM,
      severityWork?.movementCount1To5m,

      // Поля для перемещения груза на расстояние более 5 м
      severityWork?.massMoreThan5mKg,
      severityWork?.distanceMoreThan5mM,
      severityWork?.movementCountMoreThan5m,

      // Поля для подъема и перемещения тяжести
      severityWork?.liftingIntermittentMassKg,
      severityWork?.liftingIntermittentMovementCount,

      // Поля для постоянного подъема и перемещения тяжести
      severityWork?.liftingConstantMassKg,
      severityWork?.liftingConstantMovementCount,

      // Поля для подъема с рабочей поверхности
      severityWork?.liftingFromSurfaceMassKg,
      severityWork?.liftingFromSurfaceMovementCount,

      // Поля для подъема с пола
      severityWork?.liftingFromFloorMassKg,
      severityWork?.liftingFromFloorMovementCount,

      // Поля для стереотипных рабочих движений
      severityWork?.stereotypicalLocalMovementPerOperation,
      severityWork?.stereotypicalLocalOperationCount,

      // Поля для стереотипных движений при региональной нагрузке
      severityWork?.stereotypicalRegionalMovementPerOperation,
      severityWork?.stereotypicalRegionalOperationCount,

      // Поля для статической нагрузки (одной рукой)
      severityWork?.staticLoadOneHandMassKg,
      severityWork?.staticLoadOneHandHoldingTimeS,
      severityWork?.staticLoadOneHandOperationCount,

      // Поля для статической нагрузки (двумя руками)
      severityWork?.staticLoadTwoHandsMassKg,
      severityWork?.staticLoadTwoHandsHoldingTimeS,
      severityWork?.staticLoadTwoHandsOperationCount,

      // Поля для статической нагрузки (с участием мышц корпуса и ног)
      severityWork?.staticLoadBodyAndLegsMassKg,
      severityWork?.staticLoadBodyAndLegsHoldingTimeS,
      severityWork?.staticLoadBodyAndLegsOperationCount,

      // Поля для рабочей позы
      severityWork?.freePosturePercentage,
      severityWork?.standingPosturePercentage,
      severityWork?.uncomfortablePosturePercentage,
      severityWork?.fixedPosturePercentage,
      severityWork?.forcedPosturePercentage,
      severityWork?.sittingPosturePercentage,

      // Поля для наклонов корпуса
      severityWork?.tiltsPerOperation,
      severityWork?.tiltsOperationCount,

      // Поля для перемещения в пространстве (горизонтально)
      severityWork?.horizontalMovementDistanceKm,
      severityWork?.horizontalMovementDistancePerMoveM,
      severityWork?.horizontalMovementCount,

      // Поля для перемещения в пространстве (вертикально)
      severityWork?.verticalMovementDistanceKm,
      severityWork?.verticalMovementDistancePerMoveM,
      severityWork?.verticalMovementCount,
    ]);
    return result;
  }

  Future<List<SeverityWorkProcessModel>?> getProtocol(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    try {
      var maps = await db?.select(
          'SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId]);
      list = maps!.isNotEmpty ? maps.map((e) => SeverityWorkProcessModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<SeverityWorkProcessModel>> updateTableProtocol(
      SeverityWorkProcessModel? severityWork) async {
    final db = await dbHelper.database;
    try {
      db?.execute('''UPDATE $table SET 
    organizationName = ?, 
    organizationId = ?, 
    measurementDate = ?, 
    workplace = ?,  
    workplaceId = ?,  
    parameterName = ?, 
    massUpTo1mKg = ?, 
    distanceUpTo1mM = ?,  
    movementCountUpTo1m = ?, 
    mass1To5mKg = ?, 
    distance1To5mM = ?, 
    movementCount1To5m = ?, 
    massMoreThan5mKg = ?, 
    distanceMoreThan5mM = ?, 
    movementCountMoreThan5m = ?, 
    liftingIntermittentMassKg = ?, 
    liftingIntermittentMovementCount = ?, 
    liftingConstantMassKg = ?, 
    liftingConstantMovementCount = ?, 
    liftingFromSurfaceMassKg = ?, 
    liftingFromSurfaceMovementCount = ?, 
    liftingFromFloorMassKg = ?, 
    liftingFromFloorMovementCount = ?, 
    stereotypicalLocalMovementPerOperation = ?, 
    stereotypicalLocalOperationCount = ?, 
    stereotypicalRegionalMovementPerOperation = ?, 
    stereotypicalRegionalOperationCount = ?, 
    staticLoadOneHandMassKg = ?, 
    staticLoadOneHandHoldingTimeS = ?, 
    staticLoadOneHandOperationCount = ?, 
    staticLoadTwoHandsMassKg = ?, 
    staticLoadTwoHandsHoldingTimeS = ?, 
    staticLoadTwoHandsOperationCount = ?, 
    staticLoadBodyAndLegsMassKg = ?, 
    staticLoadBodyAndLegsHoldingTimeS = ?, 
    staticLoadBodyAndLegsOperationCount = ?, 
    freePosturePercentage = ?, 
    standingPosturePercentage = ?, 
    uncomfortablePosturePercentage = ?, 
    fixedPosturePercentage = ?, 
    forcedPosturePercentage = ?, 
    sittingPosturePercentage = ?, 
    tiltsPerOperation = ?, 
    tiltsOperationCount = ?, 
    horizontalMovementDistanceKm = ?, 
    horizontalMovementDistancePerMoveM = ?, 
    horizontalMovementCount = ?, 
    verticalMovementDistanceKm = ?, 
    verticalMovementDistancePerMoveM = ?, 
    verticalMovementCount = ? WHERE id = ? ''',
    [
    severityWork?.organizationName,
    severityWork?.organizationId,
    severityWork?.measurementDate,
    severityWork?.workplace,
    severityWork?.workplaceId,
    severityWork?.parameterName,

    // Поля для перемещения груза на расстояние до 1 м
    severityWork?.massUpTo1mKg,
    severityWork?.distanceUpTo1mM,
    severityWork?.movementCountUpTo1m,

    // Поля для перемещения груза на расстояние от 1 до 5 м
    severityWork?.mass1To5mKg,
    severityWork?.distance1To5mM,
    severityWork?.movementCount1To5m,

    // Поля для перемещения груза на расстояние более 5 м
    severityWork?.massMoreThan5mKg,
    severityWork?.distanceMoreThan5mM,
    severityWork?.movementCountMoreThan5m,

    // Поля для подъема и перемещения тяжести
    severityWork?.liftingIntermittentMassKg,
    severityWork?.liftingIntermittentMovementCount,

    // Поля для постоянного подъема и перемещения тяжести
    severityWork?.liftingConstantMassKg,
    severityWork?.liftingConstantMovementCount,

    // Поля для подъема с рабочей поверхности
    severityWork?.liftingFromSurfaceMassKg,
    severityWork?.liftingFromSurfaceMovementCount,

    // Поля для подъема с пола
    severityWork?.liftingFromFloorMassKg,
    severityWork?.liftingFromFloorMovementCount,

    // Поля для стереотипных рабочих движений
    severityWork?.stereotypicalLocalMovementPerOperation,
    severityWork?.stereotypicalLocalOperationCount,

    // Поля для стереотипных движений при региональной нагрузке
    severityWork?.stereotypicalRegionalMovementPerOperation,
    severityWork?.stereotypicalRegionalOperationCount,

    // Поля для статической нагрузки (одной рукой)
    severityWork?.staticLoadOneHandMassKg,
    severityWork?.staticLoadOneHandHoldingTimeS,
    severityWork?.staticLoadOneHandOperationCount,

    // Поля для статической нагрузки (двумя руками)
    severityWork?.staticLoadTwoHandsMassKg,
    severityWork?.staticLoadTwoHandsHoldingTimeS,
    severityWork?.staticLoadTwoHandsOperationCount,

    // Поля для статической нагрузки (с участием мышц корпуса и ног)
    severityWork?.staticLoadBodyAndLegsMassKg,
    severityWork?.staticLoadBodyAndLegsHoldingTimeS,
    severityWork?.staticLoadBodyAndLegsOperationCount,

    // Поля для рабочей позы
    severityWork?.freePosturePercentage,
    severityWork?.standingPosturePercentage,
    severityWork?.uncomfortablePosturePercentage,
    severityWork?.fixedPosturePercentage,
    severityWork?.forcedPosturePercentage,
    severityWork?.sittingPosturePercentage,

    // Поля для наклонов корпуса
    severityWork?.tiltsPerOperation,
    severityWork?.tiltsOperationCount,

    // Поля для перемещения в пространстве (горизонтально)
    severityWork?.horizontalMovementDistanceKm,
    severityWork?.horizontalMovementDistancePerMoveM,
    severityWork?.horizontalMovementCount,

    // Поля для перемещения в пространстве (вертикально)
    severityWork?.verticalMovementDistanceKm,
    severityWork?.verticalMovementDistancePerMoveM,
    severityWork?.verticalMovementCount,  severityWork?.id,
    ]);
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [severityWork?.id]);
      list = result!.isNotEmpty
          ? result.map((e) => SeverityWorkProcessModel.fromJson(e)).toList()
          : [];
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

  Future<dynamic> removeTableProtocol(SeverityWorkProcessModel? protocol) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${protocol?.id});');
  }
}
