import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    final dbPathJoin = path.join(dbPath, "places.db");
    print("Dbpath: $dbPathJoin");
    return await openDatabase(dbPathJoin, onCreate: (db, version) async {
      print('Printing db:$db');
      await db.execute(
          "create table user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT);");
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DBHelper.database();
    database.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final database = await DBHelper.database();
    // print("Database:$database");
    return database.query(table);
  }
}
