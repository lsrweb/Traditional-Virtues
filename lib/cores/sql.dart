import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteUtil {
  static Database? _database;

  // 初始化数据库
  static Future<Database> initDB(String dbName, String createTableQuery) async {
    WidgetsFlutterBinding.ensureInitialized();
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(createTableQuery);
      },
    );
    return _database!;
  }

  // 获取数据库实例
  static Future<Database> get database async {
    if (_database != null) return _database!;
    throw Exception("Database is not initialized. Call initDB first.");
  }

  // 插入数据
  static Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  // 更新数据
  static Future<int> update(String table, Map<String, dynamic> data,
      String whereClause, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.update(table, data,
        where: whereClause, whereArgs: whereArgs);
  }

  // 删除数据
  static Future<int> delete(
      String table, String whereClause, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.delete(table, where: whereClause, whereArgs: whereArgs);
  }

  // 查询数据
  static Future<List<Map<String, dynamic>>> query(String table,
      {String? whereClause, List<dynamic>? whereArgs}) async {
    final db = await database;
    return await db.query(table, where: whereClause, whereArgs: whereArgs);
  }

  // 删除数据库
  static Future<void> deleteDatabase(String dbName) async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);
    await databaseFactory.deleteDatabase(path);
  }
}
