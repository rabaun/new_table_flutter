import 'package:flutter/foundation.dart';

import '../../models/microclimate_protocol_model/microclimate_protocol_model.dart';
import '../../models/protocol_name_model/protocol_name_model.dart';
import '../database_helper.dart';

class MicroclimateProtocolDao {
  final dbHelper = DatabaseHelper.instance;
  static const table = 'microclimate_protocol';

  List<MicroclimateProtocolModel> list = [];
  MicroclimateProtocolModel? microclimateProtocolModel;

  Future<List<MicroclimateProtocolModel>> initialTable() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT id FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  getFromTableProtocol() async {
    final db = await dbHelper.database;
    var result = db?.select('SELECT * FROM $table;');
    list = result!.isNotEmpty ? result.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<dynamic> addInTableProtocol(MicroclimateProtocolModel? microclimate) async {
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
        
        airTemperature01m1, 
        airTemperature01m2, 
        airTemperature01m3, 
        averageAirTemperature01m, 

        airTemperature15m1, 
        airTemperature15m2, 
        airTemperature15m3, 
        averageAirTemperature15m, 

        tncIndex01m1, 
        tncIndex01m2, 
        tncIndex01m3, 
        averageTncIndex01m, 

        tncIndex15m1, 
        tncIndex15m2, 
        tncIndex15m3, 
        averageTncIndex15m, 

        airVelocity01m1, 
        airVelocity01m2, 
        airVelocity01m3, 
        averageAirVelocity01m, 

        airVelocity15m1, 
        airVelocity15m2, 
        airVelocity15m3, 
        averageAirVelocity15m, 

        relativeHumidity1, 
        relativeHumidity2, 
        relativeHumidity3, 
        averageRelativeHumidity,
        
        thermalRadiationIntensity05m1,
        thermalRadiationIntensity05m2,
        thermalRadiationIntensity05m3,
        averageThermalRadiationIntensity05m,

         thermalRadiationIntensity1m1,
         thermalRadiationIntensity1m2,
         thermalRadiationIntensity1m3,
         averageThermalRadiationIntensity1m,

         thermalRadiationIntensity15m1,
         thermalRadiationIntensity15m2,
         thermalRadiationIntensity15m3,
         averageThermalRadiationIntensity15m,

         thermalRadiationExposureDose1,
         thermalRadiationExposureDose2,
         thermalRadiationExposureDose3,
         averageThermalRadiationExposureDose
     ) VALUES (?, ?, ?, ?,
               ?, ?, ?, ?, 
               ?, ?, ?, ?, 
               ?, ?, ?, ?, 
               ?, ?, ?, ?, 
               ?, ?, ?, ?, 
               ?, ?, ?, ?,  
               ?, ?, ?, ?, 
               ?, ?, ?, ?,
               ?, ?, ?, ?, 
               ?, ?, ?, ?, 
               ?, ?, ?, ?, 
               ?, ?, ?, ?)''',
        [
          microclimate?.organizationName,
          microclimate?.organizationId,
          microclimate?.measurementDate,
          microclimate?.workplace,
          microclimate?.workplaceId,
          microclimate?.parameterName,
          microclimate?.protocolId,
          microclimate?.familyName,

          // Поля для температуры на высоте 1 м
          microclimate?.airTemperature01m1,
          microclimate?.airTemperature01m2,
          microclimate?.airTemperature01m3,
          microclimate?.averageAirTemperature01m,

          // Поля для температуры на высоте 15 м
          microclimate?.airTemperature15m1,
          microclimate?.airTemperature15m2,
          microclimate?.airTemperature15m3,
          microclimate?.averageAirTemperature15m,

          // Поля для индекса TNC на высоте 1 м
          microclimate?.tncIndex01m1,
          microclimate?.tncIndex01m2,
          microclimate?.tncIndex01m3,
          microclimate?.averageTncIndex01m,

          // Поля для индекса TNC на высоте 15 м
          microclimate?.tncIndex15m1,
          microclimate?.tncIndex15m2,
          microclimate?.tncIndex15m3,
          microclimate?.averageTncIndex15m,

          // Поля для скорости воздуха на высоте 1 м
          microclimate?.airVelocity01m1,
          microclimate?.airVelocity01m2,
          microclimate?.airVelocity01m3,
          microclimate?.averageAirVelocity01m,

          // Поля для скорости воздуха на высоте 15 м
          microclimate?.airVelocity15m1,
          microclimate?.airVelocity15m2,
          microclimate?.airVelocity15m3,
          microclimate?.averageAirVelocity15m,

          // Поля для относительной влажности
          microclimate?.relativeHumidity1,
          microclimate?.relativeHumidity2,
          microclimate?.relativeHumidity3,
          microclimate?.averageRelativeHumidity,

          microclimate?.thermalRadiationIntensity05m1,
          microclimate?.thermalRadiationIntensity05m2,
          microclimate?.thermalRadiationIntensity05m3,
          microclimate?.averageThermalRadiationIntensity05m,

          microclimate?.thermalRadiationIntensity1m1,
          microclimate?.thermalRadiationIntensity1m2,
          microclimate?.thermalRadiationIntensity1m3,
          microclimate?.averageThermalRadiationIntensity1m,

          microclimate?.thermalRadiationIntensity15m1,
          microclimate?.thermalRadiationIntensity15m2,
          microclimate?.thermalRadiationIntensity15m3,
          microclimate?.averageThermalRadiationIntensity15m,

          microclimate?.thermalRadiationExposureDose1,
          microclimate?.thermalRadiationExposureDose2,
          microclimate?.thermalRadiationExposureDose3,
          microclimate?.averageThermalRadiationExposureDose,
        ]);
    return result;
  }

  Future<List<MicroclimateProtocolModel>> getWorkplace(ProtocolNameModel? protocolName) async {
    final db = await dbHelper.database;
    List<MicroclimateProtocolModel> list = [];
    try {
      var maps = await db?.select('SELECT * FROM $table WHERE organizationId = ? AND workplaceId = ? AND protocolId = ?',
          [protocolName?.organizationId, protocolName?.workplaceId, protocolName?.protocolId]);
      list = maps!.isNotEmpty ? maps.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return list;
  }

  Future<List<MicroclimateProtocolModel>> updateTableProtocol(
      MicroclimateProtocolModel? microclimate) async {
    final db = await dbHelper.database;
    try {
      db?.execute(
        '''UPDATE $table SET 
        organizationName = ?, 
        organizationId = ?, 
        measurementDate = ?, 
        workplace = ?,  
        workplaceId = ?, 
        parameterName = ?, 
        protocolId = ?,
        familyName = ?,
        
        airTemperature01m1 = ?, 
        airTemperature01m2 = ?, 
        airTemperature01m3 = ?, 
        averageAirTemperature01m = ?, 

        airTemperature15m1 = ?, 
        airTemperature15m2 = ?, 
        airTemperature15m3 = ?, 
        averageAirTemperature15m = ?, 

        tncIndex01m1 = ?, 
        tncIndex01m2 = ?, 
        tncIndex01m3 = ?, 
        averageTncIndex01m = ?, 

        tncIndex15m1 = ?, 
        tncIndex15m2 = ?, 
        tncIndex15m3 = ?, 
        averageTncIndex15m = ?, 

        airVelocity01m1 = ?, 
        airVelocity01m2 = ?, 
        airVelocity01m3 = ?, 
        averageAirVelocity01m = ?, 

        airVelocity15m1 = ?, 
        airVelocity15m2 = ?, 
        airVelocity15m3 = ?, 
        averageAirVelocity15m = ?, 

        relativeHumidity1 = ?, 
        relativeHumidity2 = ?, 
        relativeHumidity3 = ?, 
        averageRelativeHumidity = ?,
        
        thermalRadiationIntensity05m1 = ?, 
        thermalRadiationIntensity05m2 = ?, 
        thermalRadiationIntensity05m3 = ?, 
        averageThermalRadiationIntensity05m = ?,

         thermalRadiationIntensity1m1 = ?, 
         thermalRadiationIntensity1m2 = ?, 
         thermalRadiationIntensity1m3 = ?, 
         averageThermalRadiationIntensity1m = ?,

         thermalRadiationIntensity15m1 = ?, 
         thermalRadiationIntensity15m2 = ?, 
         thermalRadiationIntensity15m3 = ?, 
         averageThermalRadiationIntensity15m = ?,

         thermalRadiationExposureDose1 = ?, 
         thermalRadiationExposureDose2 = ?, 
         thermalRadiationExposureDose3 = ?,
         averageThermalRadiationExposureDose = ?
         
         WHERE id = ?''',
        [
          microclimate?.organizationName,
          microclimate?.organizationId,
          microclimate?.measurementDate,
          microclimate?.workplace,
          microclimate?.workplaceId,
          microclimate?.parameterName,
          microclimate?.protocolId,
          microclimate?.familyName,

          // Поля для температуры на высоте 1 м
          microclimate?.airTemperature01m1,
          microclimate?.airTemperature01m2,
          microclimate?.airTemperature01m3,
          microclimate?.averageAirTemperature01m,

          // Поля для температуры на высоте 15 м
          microclimate?.airTemperature15m1,
          microclimate?.airTemperature15m2,
          microclimate?.airTemperature15m3,
          microclimate?.averageAirTemperature15m,

          // Поля для индекса TNC на высоте 1 м
          microclimate?.tncIndex01m1,
          microclimate?.tncIndex01m2,
          microclimate?.tncIndex01m3,
          microclimate?.averageTncIndex01m,

          // Поля для индекса TNC на высоте 15 м
          microclimate?.tncIndex15m1,
          microclimate?.tncIndex15m2,
          microclimate?.tncIndex15m3,
          microclimate?.averageTncIndex15m,

          // Поля для скорости воздуха на высоте 1 м
          microclimate?.airVelocity01m1,
          microclimate?.airVelocity01m2,
          microclimate?.airVelocity01m3,
          microclimate?.averageAirVelocity01m,

          // Поля для скорости воздуха на высоте 15 м
          microclimate?.airVelocity15m1,
          microclimate?.airVelocity15m2,
          microclimate?.airVelocity15m3,
          microclimate?.averageAirVelocity15m,

          // Поля для относительной влажности
          microclimate?.relativeHumidity1,
          microclimate?.relativeHumidity2,
          microclimate?.relativeHumidity3,
          microclimate?.averageRelativeHumidity,

          microclimate?.thermalRadiationIntensity05m1,
          microclimate?.thermalRadiationIntensity05m2,
          microclimate?.thermalRadiationIntensity05m3,
          microclimate?.averageThermalRadiationIntensity05m,

          microclimate?.thermalRadiationIntensity1m1,
          microclimate?.thermalRadiationIntensity1m2,
          microclimate?.thermalRadiationIntensity1m3,
          microclimate?.averageThermalRadiationIntensity1m,

          microclimate?.thermalRadiationIntensity15m1,
          microclimate?.thermalRadiationIntensity15m2,
          microclimate?.thermalRadiationIntensity15m3,
          microclimate?.averageThermalRadiationIntensity15m,

          microclimate?.thermalRadiationExposureDose1,
          microclimate?.thermalRadiationExposureDose2,
          microclimate?.thermalRadiationExposureDose3,
          microclimate?.averageThermalRadiationExposureDose,

          microclimate?.id,
        ],
      );
      var result = db?.select('SELECT * FROM $table WHERE id = ?', [microclimate?.id]);
      list = result!.isNotEmpty ? result.map((e) => MicroclimateProtocolModel.fromJson(e)).toList() : [];
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

  Future<dynamic> removeTableProtocol(MicroclimateProtocolModel? microclimate) async {
    final db = await dbHelper.database;
    db?.execute('DELETE FROM $table WHERE id IN (${microclimate?.id});');
  }
}
