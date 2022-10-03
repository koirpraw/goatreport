import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../model/health_model.dart';

class DatabaseHelper {
  static Database? _healthDb;

  DatabaseHelper._createInstance();

  static final DatabaseHelper db = DatabaseHelper._createInstance();
  String tableName = 'health';
  String colId = 'id';
  String colUser = 'user_id';
  String colType = "health_type";
  String colName = "health_name";
  String colUnit = 'health_unit';
  String colValue = 'health_value';
  String colDate = 'date';
  String colIsSynced = 'is_sync';

  Future<Database?> get database async {
    if (_healthDb == null) {
      _healthDb = await initializeDatabase();
    }
    return _healthDb;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/healthdata.db';
    var myDatabase = await openDatabase(path,
        version: 1, onCreate: _createDb, onUpgrade: _onUpgrade);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $tableName"
        "($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$colName TEXT, $colType TEXT, $colUnit TEXT, $colValue TEXT, $colDate TEXT, $colIsSynced TEXT, $colUser TEXT)");
  }

  // UPGRADE DATABASE TABLES
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute("DROP TABLE IF EXISTS $tableName;");
      await db.execute("CREATE TABLE $tableName"
          "($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$colName TEXT, $colType TEXT, $colUnit TEXT, $colValue TEXT, $colDate TEXT, $colIsSynced Text, $colUser TEXT)");
    }
  }

  closeDB() async {
    var db = await database;
    var result = db?.close();
    return result;
  }

  Future<int?> insertHealthData(HealthModel healthModel) async {
    Database? db = await database;
    var result = await db?.insert(tableName, healthModel.toMap());
    return result;
  }

  Future<int?> delete(int id) async {
    Database? db = await database;
    var result =
        await db?.delete(tableName, where: '$colId = ?', whereArgs: [id]);
    return result;
  }

  Future<int?> update(HealthModel healthModel) async {
    Database? db = await database;
    var result = await db?.update(tableName, healthModel.toMap(),
        where: '$colId = ?', whereArgs: [healthModel.id]);
    return result;
  }

  void UpdateLastItem(HealthModel healthModel) async {
    Database? db = await database;
    var result = await db?.update(tableName, healthModel.toMap(),
        where: '$colId = ?', whereArgs: [healthModel.id]);
  }

  Future<HealthModel> getLastHealthData(String type) async {
    Database? db = await this.database;
    List<HealthModel> healthDatas = [];
    List<Map<String, Object?>>? maps = await db
        ?.rawQuery('SELECT * FROM $tableName ORDER BY $colId DESC LIMIT 1');

    if (maps != null && maps.isNotEmpty) {
      for (var element in maps) {
        if (kDebugMode) {
          print(element.toString());
        }
        healthDatas.add(HealthModel.fromMap(element));
      }
    }
    return healthDatas[0];
  }

  Future<List<HealthModel>?> getHealthData(String type) async {
    Database? db = await database;
    List<HealthModel> healthDatas = [];
  List<Map<String, Object?>>? maps = await db?.query(tableName,columns: [colType,colValue,colUnit,colDate],
    where:'$colType =?',
    whereArgs: [type],
  );
  if(maps != null && maps.isNotEmpty){
    for (var element in maps) {
      healthDatas.add(HealthModel.fromMap(element));
    }
  }
  return healthDatas;
  }

  Future<List<HealthModel>?> getHealthDataWithDate(
      DateTime startDate, DateTime endDate, String name) async {
    Database? db = await database;
    List<HealthModel> healthDatas = [];
    List<Map<String, dynamic>>? maps = await db?.rawQuery(
      // "SELECT * FROM $healthTable WHERE $colName = '$name'");
        "SELECT * FROM $tableName WHERE $colName = '$name' AND $colDate BETWEEN '${startDate}' AND '${endDate}'");
    if (maps != null && maps.isNotEmpty) {
      var newMaps = maps.where((element) => DateTime(element['date']).isAfter(startDate));

      for (var element in maps) {
        healthDatas.add(HealthModel.fromMap(element));
      }
    }
    return healthDatas;
  }

  // Future<List<HealthModel>?> getHealthDataWithDateAndType(
  //     DateTime startDate, DateTime endDate, String name, String type) async {
  //   Database? db = await database;
  //   List<HealthModel> healthDatas = [];
  //   List<Map<String, dynamic>>? maps = await db?.rawQuery(
  //     // "SELECT * FROM $healthTable WHERE $colName = '$name'");
  //       "SELECT * FROM $tableName WHERE $colName = '$name' AND $colType = '$type' AND $colDate BETWEEN '$startDate' AND '$endDate'");
  //   if (maps != null && maps.isNotEmpty) {
  //     var newMaps = maps.where((element) => DateTime(element['date']).isAfter(startDate));
  //
  //     for (var element in maps) {
  //       healthDatas.add(HealthModel.fromMap(element));
  //     }
  //   }
  //   return healthDatas;
  // }


  Future<List<HealthModel>?> getDataToBeDelete(dateTime, today) async {
    Database? db = await database;
    List<HealthModel> healthDatas = [];
    // List<Map<String, dynamic>>? maps = await db?.query(healthTable,
    //     columns: [colType,colName, colValue, colUnit, colDate],
    // where: '$colDate = ?',
    // whereArgs: );
    List<Map<String, dynamic>>? maps = await db?.rawQuery(
        "SELECT * FROM $tableName WHERE $colDate >= '$dateTime' AND $colDate <= '$today'");
    if (maps != null && maps.isNotEmpty) {
      for (var element in maps) {
        if (kDebugMode) {
          print(element.toString());
        }
        healthDatas.add(HealthModel.fromMap(element));
      }
    }
    return healthDatas;
  }

  Future<List<HealthModel>?> getDataToBeSync() async {
    Database? db = await database;
    List<HealthModel> healthDatas = [];
    List<Map<String, dynamic>>? maps = await db
        ?.rawQuery('SELECT * FROM $tableName WHERE $colIsSynced = false');
    if (maps != null && maps.isNotEmpty) {
      for (var element in maps) {
        healthDatas.add(HealthModel.fromMap(element));
      }
    }
    return healthDatas;
  }

}
