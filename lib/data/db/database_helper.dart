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
  static const table5 = 'primary_protocol';
  static const table6 = 'microclimate_protocol';
  static const table7 = 'local_vibration_protocol';
  static const table8 = 'general_vibration_protocol';
  static const table9 = 'electromagnetic_field_protocol';
  static const table10 = 'ultraviolet_radiation_protocol'; 
  static const table11 = 'severity_work_process'; // нужно сделать
  static const table12 = 'intensity_work_process'; // нужно сделать

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
       parameterName VARCHAR(100) NOT NULL,
       parameterValue VARCHAR(32) NOT NULL,
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
       airTemperature01m VARCHAR(32) NOT NULL,
       airTemperature15m VARCHAR(32) NOT NULL,
       tncIndex01m VARCHAR(32) NOT NULL,
       tncIndex15m VARCHAR(32) NOT NULL,
       airVelocity01m VARCHAR(32) NOT NULL,
       airVelocity15m VARCHAR(32) NOT NULL,
       relativeHumidity VARCHAR(32) NOT NULL,
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
       correctedLevelX VARCHAR(32) NOT NULL,
       correctedLevelY VARCHAR(32) NOT NULL,
       correctedLevelZ VARCHAR(32) NOT NULL,
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
       correctedLevelX VARCHAR(32) NOT NULL,
       correctedLevelY VARCHAR(32) NOT NULL,
       correctedLevelZ VARCHAR(32) NOT NULL,
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
       uvAIntensityH05_10 VARCHAR(32) NOT NULL,
       uvAIntensityH15 VARCHAR(32) NOT NULL,
       uvBIntensityH05_10 VARCHAR(32) NOT NULL,
       uvBIntensityH15 VARCHAR(32) NOT NULL,
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
    id INTEGER PRIMARY KEY,                      -- Уникальный идентификатор записи
    organizationName VARCHAR(100) NOT NULL,
    organizationId VARCHAR(100) NOT NULL,
    measurementDate VARCHAR(32) NOT NULL,
    workplace VARCHAR(32) NOT NULL,
    workplaceId VARCHAR(32) NOT NULL,
    parameterName VARCHAR(100) NOT NULL,
    
    signal_density DECIMAL(10, 2),              -- Плотность сигналов (световых, звуковых) и сообщений
    simultaneous_objects_count INT,             -- Число производственных объектов, наблюдаемых одновременно
    optical_device_usage DECIMAL(5, 2),         -- Процент времени использования оптических приборов
    voice_apparatus_load_hours DECIMAL(10, 2),  -- Нагрузка на голосовой аппарат (суммарное количество часов в неделю)
    auditory_analyzer_load DECIMAL(10, 2),      -- Нагрузка на слуховой анализатор
    focused_observation_duration DECIMAL(5, 2), -- Длительность сосредоточенного наблюдения (в % от времени смены)
    monotony_loads DECIMAL(5, 2),               -- Уровень монотонности нагрузок
    elements_count INT,                         -- Число элементов (приемов), необходимых для выполнения задания
    monotony_environment DECIMAL(5, 2),         -- Уровень монотонности производственной обстановки
    active_observation_time DECIMAL(10, 2)      -- Время активного наблюдения за ходом производственного процесса
    );
     ''');

    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
    return db;
  }
}
