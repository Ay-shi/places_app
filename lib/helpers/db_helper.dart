import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> db() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbPath, "places.db"), version: 1,
        onCreate: (sql.Database db, int version) async {
      return await db.execute(
          "CREATE TABLE user_places(id TEXT PRIMARY KEY,title Text,image Text)");
    });
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    // final dbPath = await sql.getDatabasesPath();
    // final sqlDb = await sql.openDatabase(path.join(dbPath, "places.db"),
    //     version: 1, onCreate: (sql.Database db, int version) async {
    //   return await db.execute(
    //       "CREATE TABLE user_places(id TEXT PRIMARY KEY,title Text,image Text)");
    // });
    final dbase = await DBHelper.db();
    dbase.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final dbase = await DBHelper.db();
    return await dbase.query(table);
  }
}
