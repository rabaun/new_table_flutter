import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  static const nameDb = 'devices_db';

  static const table = 'devices';
  static const table1 = 'device_cert';
  static const table2 = 'organization_name';
  static const table3 = 'workplace_name';
  static const table4 = 'protocol_name';
  static const table5 = 'primary_protocol'; // протокол по шуму
  static const table6 = 'microclimate_protocol';
  static const table7 = 'local_vibration_protocol'; // нужно сделать
  static const table8 = 'general_vibration_protocol';  // нужно сделать
  static const table9 = 'electromagnetic_field_protocol';
  static const table10 = 'ultraviolet_radiation_protocol';
  static const table11 = 'severity_work_process'; // сделал
  static const table12 = 'intensity_work_process'; // сделал
  static const table13 = 'chemical_protocol_geolan'; // сделал
  static const table14 = 'chemical_protocol_gank'; // сделал
  static const table15 = 'lighting_protocol'; // сделал

  static final DatabaseHelper instance = DatabaseHelper();
  static Database? db;

  Future<Database?> get database async => db ??= await initDatabase();

  Future<Database?> initDatabase() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final filename = path.join(docsDir.path, '$nameDb.db');
    db = sqlite3.open(filename);
    try {
      db?.execute('''
      CREATE TABLE IF NOT EXISTS $table 
      (id INTEGER PRIMARY KEY, 
      name NVARCHAR(64) NOT NULL, 
      registryNumber NVARCHAR(64) NOT NULL, 
      serialNumber NVARCHAR(64) NOT NULL);
      ''');

      db?.execute('''
      CREATE TABLE IF NOT EXISTS $table1 
      (id INTEGER PRIMARY KEY,
      serialNumber NVARCHAR(64) NOT NULL,
      cerVerification NVARCHAR(64) NOT NULL,
      startTime NVARCHAR(64) NOT NULL,
      endTime NVARCHAR(64) NOT NULL);
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table2 
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL);
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table3
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       departmentName VARCHAR(32) NOT NULL,
       workplaceName VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table4
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       workplace VARCHAR(100) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       protocolName VARCHAR(32) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table5
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(100) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       parameterValue1 VARCHAR(32) NOT NULL,
       parameterValue2 VARCHAR(32) NOT NULL,
       parameterValue3 VARCHAR(32) NOT NULL,
       averageConcentration VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table6
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       
       airTemperature01m1 VARCHAR(32) NOT NULL,
       airTemperature01m2 VARCHAR(32) NOT NULL,
       airTemperature01m3 VARCHAR(32) NOT NULL,
       averageAirTemperature01m VARCHAR(32) NOT NULL,
       
       airTemperature15m1 VARCHAR(32) NOT NULL,
       airTemperature15m2 VARCHAR(32) NOT NULL,
       airTemperature15m3 VARCHAR(32) NOT NULL,
       averageAirTemperature15m VARCHAR(32) NOT NULL,
       
       tncIndex01m1 VARCHAR(32) NOT NULL,
       tncIndex01m2 VARCHAR(32) NOT NULL,
       tncIndex01m3 VARCHAR(32) NOT NULL,
       averageTncIndex01m VARCHAR(32) NOT NULL,
       
       tncIndex15m1 VARCHAR(32) NOT NULL,
       tncIndex15m2 VARCHAR(32) NOT NULL,
       tncIndex15m3 VARCHAR(32) NOT NULL,
       averageTncIndex15m VARCHAR(32) NOT NULL,

       airVelocity01m1 VARCHAR(32) NOT NULL,
       airVelocity01m2 VARCHAR(32) NOT NULL,
       airVelocity01m3 VARCHAR(32) NOT NULL,
       averageAirVelocity01m VARCHAR(32) NOT NULL,
       
       airVelocity15m1 VARCHAR(32) NOT NULL,
       airVelocity15m2 VARCHAR(32) NOT NULL,
       airVelocity15m3 VARCHAR(32) NOT NULL,
       averageAirVelocity15m VARCHAR(32) NOT NULL,
       
       relativeHumidity1 VARCHAR(32) NOT NULL,
       relativeHumidity2 VARCHAR(32) NOT NULL,
       relativeHumidity3 VARCHAR(32) NOT NULL,
       averageRelativeHumidity VARCHAR(32) NOT NULL,
       
       thermalRadiationIntensity05m1 VARCHAR(32) NOT NULL,
       thermalRadiationIntensity05m2 VARCHAR(32) NOT NULL,
       thermalRadiationIntensity05m3 VARCHAR(32) NOT NULL,
       averageThermalRadiationIntensity05m VARCHAR(32) NOT NULL,
       
       thermalRadiationIntensity1m1 VARCHAR(32) NOT NULL,
       thermalRadiationIntensity1m2 VARCHAR(32) NOT NULL,
       thermalRadiationIntensity1m3 VARCHAR(32) NOT NULL,
       averageThermalRadiationIntensity1m VARCHAR(32) NOT NULL,

       thermalRadiationIntensity15m1 VARCHAR(32) NOT NULL,
       thermalRadiationIntensity15m2 VARCHAR(32) NOT NULL,
       thermalRadiationIntensity15m3 VARCHAR(32) NOT NULL,
       averageThermalRadiationIntensity15m VARCHAR(32) NOT NULL,
       
       thermalRadiationExposureDose1 VARCHAR(32) NOT NULL,
       thermalRadiationExposureDose2 VARCHAR(32) NOT NULL,
       thermalRadiationExposureDose3 VARCHAR(32) NOT NULL,
       averageThermalRadiationExposureDose VARCHAR(32) NOT NULL,
       
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table7
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       
       correctedLevelX1 VARCHAR(32) NOT NULL,
       correctedLevelX2 VARCHAR(32) NOT NULL,
       correctedLevelX3 VARCHAR(32) NOT NULL,
       averageCorrectedLevelX VARCHAR(32) NOT NULL,
       
       correctedLevelY1 VARCHAR(32) NOT NULL,
       correctedLevelY2 VARCHAR(32) NOT NULL,
       correctedLevelY3 VARCHAR(32) NOT NULL,
       averageCorrectedLevelY VARCHAR(32) NOT NULL,
       
       correctedLevelZ1 VARCHAR(32) NOT NULL,
       correctedLevelZ2 VARCHAR(32) NOT NULL,
       correctedLevelZ3 VARCHAR(32) NOT NULL,
       averageCorrectedLevelZ VARCHAR(32) NOT NULL,
       
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table8
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       
       correctedLevelX1 VARCHAR(32) NOT NULL,
       correctedLevelX2 VARCHAR(32) NOT NULL,
       correctedLevelX3 VARCHAR(32) NOT NULL,
       averageCorrectedLevelX VARCHAR(32) NOT NULL,
       
       correctedLevelY1 VARCHAR(32) NOT NULL,
       correctedLevelY2 VARCHAR(32) NOT NULL,
       correctedLevelY3 VARCHAR(32) NOT NULL,
       averageCorrectedLevelY VARCHAR(32) NOT NULL,
       
       correctedLevelZ1 VARCHAR(32) NOT NULL,
       correctedLevelZ2 VARCHAR(32) NOT NULL,
       correctedLevelZ3 VARCHAR(32) NOT NULL,
       averageCorrectedLevelZ VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table9
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       electricField50hzH05 VARCHAR(32) NOT NULL,
       electricField50hzH1 VARCHAR(32) NOT NULL,
       electricField50hzH17 VARCHAR(32) NOT NULL,
       magneticField50hzH05 VARCHAR(32) NOT NULL,
       magneticField50hzH1 VARCHAR(32) NOT NULL,
       magneticField50hzH17 VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table10
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       
       uvAIntensityH05_101 VARCHAR(32) NOT NULL,
       uvAIntensityH05_102 VARCHAR(32) NOT NULL,
       uvAIntensityH05_103 VARCHAR(32) NOT NULL,
       averageUvAIntensityH05_10 VARCHAR(32) NOT NULL,
       
       uvAIntensityH151 VARCHAR(32) NOT NULL,
       uvAIntensityH152 VARCHAR(32) NOT NULL,
       uvAIntensityH153 VARCHAR(32) NOT NULL,
       averageUvAIntensityH15 VARCHAR(32) NOT NULL,
         
       uvBIntensityH05_101 VARCHAR(32) NOT NULL,
       uvBIntensityH05_102 VARCHAR(32) NOT NULL,
       uvBIntensityH05_103 VARCHAR(32) NOT NULL,
       averageUvBIntensityH05_10 VARCHAR(32) NOT NULL,
       
       uvBIntensityH151 VARCHAR(32) NOT NULL,
       uvBIntensityH152 VARCHAR(32) NOT NULL,
       uvBIntensityH153 VARCHAR(32) NOT NULL,
       averageUvBIntensityH15 VARCHAR(32) NOT NULL,
       
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
      CREATE TABLE IF NOT EXISTS $table11
      (id INTEGER PRIMARY KEY,
      organizationName VARCHAR(100) NOT NULL,
      organizationId VARCHAR(100) NOT NULL,
      measurementDate VARCHAR(32) NOT NULL,
      workplace VARCHAR(32) NOT NULL,
      workplaceId VARCHAR(32) NOT NULL,
      parameterName VARCHAR(100) NOT NULL,
      protocolId VARCHAR(32) NOT NULL,
      familyName VARCHAR(32) NOT NULL,
      
      massUpTo1mKg VARCHAR(32) NOT NULL,
      distanceUpTo1mM VARCHAR(32) NOT NULL,
      movementCountUpTo1m VARCHAR(32) NOT NULL,
      
      mass1To5mKg VARCHAR(32) NOT NULL,
      distance1To5mM VARCHAR(32) NOT NULL,
      movementCount1To5m VARCHAR(32) NOT NULL,
      
      massMoreThan5mKg VARCHAR(32) NOT NULL,
      distanceMoreThan5mM VARCHAR(32) NOT NULL,
      movementCountMoreThan5m VARCHAR(32) NOT NULL,
      
      liftingIntermittentMassKg VARCHAR(32) NOT NULL,
      liftingIntermittentMovementCount VARCHAR(32) NOT NULL,
      
      liftingConstantMassKg VARCHAR(32) NOT NULL,
      liftingConstantMovementCount VARCHAR(32) NOT NULL,
      
      liftingFromSurfaceMassKg VARCHAR(32) NOT NULL,
      liftingFromSurfaceMovementCount VARCHAR(32) NOT NULL,
      
      liftingFromFloorMassKg VARCHAR(32) NOT NULL,
      liftingFromFloorMovementCount VARCHAR(32) NOT NULL,
      
      stereotypicalLocalMovementPerOperation VARCHAR(32) NOT NULL,
      stereotypicalLocalOperationCount VARCHAR(32) NOT NULL,
      
      stereotypicalRegionalMovementPerOperation VARCHAR(32) NOT NULL,
      stereotypicalRegionalOperationCount VARCHAR(32) NOT NULL,
      
      staticLoadOneHandMassKg VARCHAR(32) NOT NULL,
      staticLoadOneHandHoldingTimeS VARCHAR(32) NOT NULL,
      staticLoadOneHandOperationCount VARCHAR(32) NOT NULL,
      
      staticLoadTwoHandsMassKg VARCHAR(32) NOT NULL,
      staticLoadTwoHandsHoldingTimeS VARCHAR(32) NOT NULL,
      staticLoadTwoHandsOperationCount VARCHAR(32) NOT NULL,
      
      staticLoadBodyAndLegsMassKg VARCHAR(32) NOT NULL,
      staticLoadBodyAndLegsHoldingTimeS VARCHAR(32) NOT NULL,
      staticLoadBodyAndLegsOperationCount VARCHAR(32) NOT NULL,
      
      freePosturePercentage VARCHAR(32) NOT NULL,
      standingPosturePercentage VARCHAR(32) NOT NULL,
      uncomfortablePosturePercentage VARCHAR(32) NOT NULL,
      fixedPosturePercentage VARCHAR(32) NOT NULL,
      forcedPosturePercentage VARCHAR(32) NOT NULL,
      sittingPosturePercentage VARCHAR(32) NOT NULL,
      
      tiltsPerOperation VARCHAR(32) NOT NULL,
      tiltsOperationCount VARCHAR(32) NOT NULL,
      
      horizontalMovementDistanceKm VARCHAR(32) NOT NULL,
      horizontalMovementDistancePerMoveM VARCHAR(32) NOT NULL,
      horizontalMovementCount VARCHAR(32) NOT NULL,
      
      verticalMovementDistanceKm VARCHAR(32) NOT NULL,
      verticalMovementDistancePerMoveM VARCHAR(32) NOT NULL,
      verticalMovementCount VARCHAR(32) NOT NULL,
      FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
        ''');

      db?.execute('''
      CREATE TABLE IF NOT EXISTS $table12
      (id INTEGER PRIMARY KEY,
      organizationName VARCHAR(100) NOT NULL,
      organizationId VARCHAR(100) NOT NULL,
      measurementDate VARCHAR(32) NOT NULL,
      workplace VARCHAR(32) NOT NULL,
      workplaceId VARCHAR(32) NOT NULL,
      parameterName VARCHAR(100) NOT NULL,
      protocolId VARCHAR(32) NOT NULL,
      familyName VARCHAR(32) NOT NULL,
      signalDensity VARCHAR(32) NOT NULL,
      simultaneousObjectsCount VARCHAR(32) NOT NULL,
      opticalDeviceUsage VARCHAR(32) NOT NULL,
      voiceApparatusLoadHours VARCHAR(32) NOT NULL,
      auditoryAnalyzerLoad VARCHAR(32) NOT NULL,
      focusedObservationDuration VARCHAR(32) NOT NULL,
      monotonyLoads VARCHAR(32) NOT NULL,
      elementsCount VARCHAR(32) NOT NULL,
      monotonyEnvironment VARCHAR(32) NOT NULL,
      activeObservationTime VARCHAR(32) NOT NULL,
      FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
     ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table13
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(100) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       parameterValue VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
   CREATE TABLE IF NOT EXISTS $table14 (
       id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(100) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       concentration1_1 VARCHAR(100) NOT NULL,
       concentration2_1 VARCHAR(100) NOT NULL,
       averageConcentration VARCHAR(100) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table15
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       organizationId VARCHAR(100) NOT NULL,
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(100) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       protocolId VARCHAR(32) NOT NULL,
       familyName VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       parameterValue1 VARCHAR(32) NOT NULL,
       parameterValue2 VARCHAR(32) NOT NULL,
       parameterValue3 VARCHAR(32) NOT NULL,
       averageConcentration VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return db;
  }
}
