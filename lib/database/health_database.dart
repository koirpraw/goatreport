import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/health_category.dart';
import '../model/health_tag.dart';

class HealthDatabase {
  static Database? _healthDb;

  HealthDatabase._createInstance();

  static final HealthDatabase db = HealthDatabase._createInstance();
  String tagTable = 'health_tag';
  String tagId = 'tag_id';
  String tagName = "tag_name";
  String tagIcon = "tag_icon";
  String tagStatus = "tag_status";

  String healthCategoryTable = 'health_category';
  String categoryId = 'category_id';
  String categoryName = 'category_name';
  String categoryType = 'category_type';
  String categoryStatus = 'category_status';

  Future<Database?> get database async {
    if (_healthDb == null) {
      _healthDb = await initializeDatabase();
    }
    return _healthDb;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/health.db';
    var myDatabase = await openDatabase(path,
        version: 1, onCreate: _createDb);
        // version: 1, onCreate: _createDb, onUpgrade: _onUpgrade);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $tagTable"
        "($tagId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$tagName TEXT, $tagIcon INTEGER, $tagStatus INTEGER)");

    await db.execute("CREATE TABLE $healthCategoryTable"
        "($categoryId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$tagId INTEGER, $categoryName TEXT, $categoryType TEXT, $categoryStatus INTEGER)");
  }

  // UPGRADE DATABASE TABLES
  // void _onUpgrade(Database db, int oldVersion, int newVersion) async {
  //   if (oldVersion < newVersion) {
  //     await db.execute("DROP TABLE IF EXISTS $tagTable;");
  //     await db.execute("DROP TABLE IF EXISTS $healthCategoryTable;");
  //
  //     await db.execute("CREATE TABLE $tagTable"
  //         "($tagId INTEGER PRIMARY KEY AUTOINCREMENT,"
  //         "$tagName TEXT, $tagIcon INTEGER, $tagStatus INTEGER)");
  //
  //     await db.execute("CREATE TABLE $healthCategoryTable"
  //         "($categoryId INTEGER PRIMARY KEY AUTOINCREMENT,"
  //         "$tagId INTEGER,  $categoryName TEXT, $categoryType TEXT, $categoryStatus INTEGER)");
  //   }
  // }

  close() async {
    var db = await this.database;
    var result = db?.close();
    return result;
  }

  Future<int?> insertHeartTag(HealthTag healthTag) async {
    Database? db = await this.database;
    var result = await db?.insert(tagTable, healthTag.toMap());
    return result;
  }

  Future<int?> deleteHeartTag(int id) async {
    Database? db = await this.database;
    return await db?.delete(tagTable, where: '$tagId = ?', whereArgs: [id]);
  }

  Future<int?> updateHeartTag(HealthTag healthTag) async {
    Database? db = await this.database;
    return await db?.update(tagTable, healthTag.toMap(),
        where: '$tagId = ?', whereArgs: [healthTag.tagId]);
  }
  Future<int?> updateHealthTagStatus(HealthTag healthTag) async {
    Database? db = await this.database;
    return await db?.update(tagTable, healthTag.toMap(),
        where: '$tagId = ?', whereArgs: [healthTag.tagId]);
  }

  Future<List<HealthTag>> getHealthTag() async {
    Database? db = await this.database;
    List<HealthTag> healthDatas = [];
    List<Map<String, dynamic>>? maps =
    await db?.query(tagTable, columns: [tagId, tagName]);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        healthDatas.add(HealthTag.fromMap(element));
      });
    }
    return healthDatas;
  }

  Future<List<HealthTag>> getCustomHealthTag() async {
    Database? db = await this.database;
    List<HealthTag> healthDatas = [];
    List<Map<String, Object?>>? maps = await db?.rawQuery(
        'SELECT * FROM $tagTable Where $tagId > 6');

    // List<Map<String, dynamic>>? maps =
    // await db?.query(tagTable, columns: [tagId, tagName], where: '$tagId < ?', whereArgs: [6]);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        healthDatas.add(HealthTag.fromMap(element));
      });
    }
    return healthDatas;
  }


  Future<int?> insertHealthCategory(HealthCategory healthCategory) async {
    Database? db = await this.database;
    var result = await db?.insert(healthCategoryTable, healthCategory.toMap());
    return result;
  }

  Future<int?> deleteHeartCategory(int id) async {
    Database? db = await this.database;
    return await db
        ?.delete(healthCategoryTable, where: '$tagId = ?', whereArgs: [id]);
  }

  Future<int?> updateHealthCategory(HealthCategory healthCategory) async {
    Database? db = await this.database;
    return await db?.update(healthCategoryTable, healthCategory.toMap(),
        where: '$categoryId = ?', whereArgs: [healthCategory.catId]);
  }

  Future<List<HealthCategory>> getHealthCategory(String id) async {
    Database? db = await this.database;
    List<HealthCategory> healthCategories = [];
    List<Map<String, dynamic>>? maps = await db?.query(healthCategoryTable,
        columns: [tagId, categoryId, categoryName, categoryType, categoryStatus],
        where: '$tagId = ?',
        whereArgs: [id]);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        print(element.toString());
        healthCategories.add(HealthCategory.fromMap(element));
      });
    }
    return healthCategories;
  }

  Future<List<HealthCategory>> getAllCategory() async {
    Database? db = await this.database;
    List<HealthCategory> healthCategories = [];
    List<Map<String, dynamic>>? maps = await db?.query(healthCategoryTable,
        columns: [tagId, categoryId, categoryName, categoryType, categoryStatus]);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        print(element.toString());
        healthCategories.add(HealthCategory.fromMap(element));
      });
    }
    return healthCategories;
  }


  Future<List<HealthCategory>> getAllHealthCategory() async {
    Database? db = await this.database;
    List<HealthCategory> healthCategories = [];
    List<Map<String, dynamic>>? maps = await db?.query(healthCategoryTable,
        columns: [tagId, categoryId, categoryName, categoryType]);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        print(element.toString());
        healthCategories.add(HealthCategory.fromMap(element));
      });
    }
    return healthCategories;
  }

  Future<HealthTag?> getTagIdWithName(String currentHealthTag) async {
    Database? db = await this.database;
    HealthTag? healthTag;
    List<Map<String, dynamic>>? maps = await db?.query(tagTable,
        columns: [tagId, tagName],
        where: '$tagName = ?',
        whereArgs: [currentHealthTag],
        limit: 1);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        healthTag = HealthTag.fromMap(element);
      });
    }
    return healthTag;
  }

  Future<Iterable<HealthTag>> getBuiltInHealthTag() async {
    Database? db = await this.database;
    List<HealthTag> healthDatas = [];
    List<Map<String, dynamic>>? maps =
    await db?.query(tagTable, columns: [tagId, tagName, tagIcon]);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        healthDatas.add(HealthTag.fromMap(element));
      });
    }
    var newDatas = healthDatas.reversed;
    return newDatas;
  }

  Future<HealthTag> getLastItem() async {
    Database? db = await this.database;
    List<HealthTag> healthDatas = [];
    List<Map<String, dynamic>>? maps =
    await db?.query(tagTable, columns: [tagId, tagName, tagIcon], orderBy: "$tagId DESC", limit: 1);
    if (maps != null && maps.length > 0) {
      maps.forEach((element) {
        healthDatas.add(HealthTag.fromMap(element));
      });
    }
    return healthDatas[0];
  }
}
