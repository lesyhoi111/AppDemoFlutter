import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE task(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        liked BOOLEAN,
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbtask.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(String title, bool? liked) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'liked': liked};
    final id = await db.insert('task', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getListItems() async {
    final db = await SQLHelper.db();
    return db.query('task', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('task', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String title, bool? liked) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'liked': liked,
    };

    final result =
        await db.update('task', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      db.delete('task', where: "id=?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }
}
