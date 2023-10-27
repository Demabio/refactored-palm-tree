import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/downloadedfarmer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FarmerWardDatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialise();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'ward.db';
    final path = await getDatabasesPath();
    PrefUtils().setDBPath(path);
    return join(path, name);
  }

  Future<Database> _initialise() async {
    final path = await fullPath;
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async {
    //Farmer Registration
    await DFarmerDB().createTable(database);
  }
}
