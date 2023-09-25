import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'logindb.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialise();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'localdevice.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialise() async {
    final path = await fullPath;
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await LoginDB().createTable(database);
}
