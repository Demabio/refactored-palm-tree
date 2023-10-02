import 'package:kiamis_app/data/models/dbModels/other/registrationstatus.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmersRegistrationStatusDB {
  final tableName = 'tblfrfarmersregistrationstatus';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "registration_status_id" INTEGER NOT NULL,
        "registration_status" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("registration_status_id")
      );
    """);
  }

  Future<int> create({
    required String registrationStatus,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (registration_status, description) 
      VALUES (?, ?)
    ''', [
      registrationStatus,
      description,
    ]);
  }

  Future<int> insertRegistrationStatuses(
      List<FarmersRegistrationStatus> statuses) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var status in statuses) {
        batch.rawInsert('''
          INSERT INTO $tableName (registration_status, description) 
          VALUES (?, ?)
        ''', [status.registrationStatus, status.description]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmersRegistrationStatus>> fetchAll() async {
    final database = await DatabaseService().database;
    final statuses = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return statuses
        .map((e) => FarmersRegistrationStatus.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
