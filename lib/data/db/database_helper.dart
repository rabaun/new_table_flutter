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
       departmentName VARCHAR(32) NOT NULL,
       workplaceName VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table4
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
       workplace VARCHAR(100) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       protocolName VARCHAR(32) NOT NULL,
       FOREIGN KEY (organizationName) REFERENCES $table2(organizationName));
      ''');

      db?.execute('''
       CREATE TABLE IF NOT EXISTS $table5
       (id INTEGER PRIMARY KEY,
       organizationName VARCHAR(100) NOT NULL,
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
       measurementDate VARCHAR(32) NOT NULL,
       workplace VARCHAR(32) NOT NULL,
       workplaceId VARCHAR(32) NOT NULL,
       parameterName VARCHAR(100) NOT NULL,
       uvAIntensityH05-10 VARCHAR(32) NOT NULL,
       uvAIntensityH15 VARCHAR(32) NOT NULL,
       uvBIntensityH05-10 VARCHAR(32) NOT NULL,
       uvBIntensityH15 VARCHAR(32) NOT NULL,
       uvCIntensityH05-10 VARCHAR(32) NOT NULL,
       uvCIntensityH15 VARCHAR(32) NOT NULL,
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
