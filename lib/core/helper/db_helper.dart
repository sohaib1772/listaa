import 'package:flutter/foundation.dart';
import 'package:listaa/core/constants/sql_strings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;
  Future<Database?> get getInstance async {
    if (_db == null) {
      _db = await instance();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database?> instance() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'listaa.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        for (final table in SqlStrings.createAllTables) {
          await db.execute(table);
        }
        debugPrint('Text Database has been created successfully');
      },
    );
    return database;
  }

  Future<List<Map<String, dynamic>>> inquiry(
    String sqlTxt, {
    List<dynamic>? arguments,
  }) async {
    Database? db = await getInstance;
    // Get the records
    List<Map<String, dynamic>> list = await db!.rawQuery(sqlTxt, arguments);
    return list;
  }

  Future<int> insert(String sqlTxt, List<dynamic> arguments) async {
    Database? db = await getInstance;
    // Insert some record
    int count = await db!.rawInsert(sqlTxt, arguments);
    return count;
  }

  Future<int> update(String sqlTxt, List<dynamic> arguments) async {
    Database? db = await getInstance;
    // Update some record
    int count = await db!.rawUpdate(sqlTxt, arguments);
    return count;
  }

  Future<int> delete(String sqlTxt, List<dynamic> arguments) async {
    Database? db = await getInstance;
    // Delete some record
    int count = await db!.rawDelete(sqlTxt, arguments);
    return count;
  }
}
