import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/program.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerProgramDB {
  final tableName = 'tblfrfarmerprogs';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farm_prog_id" INTEGER NOT NULL,
        "program_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        PRIMARY KEY("farm_prog_id")
      );
    """);
  }

  Future<int> create({
    required int programId,
    required int farmerId,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        program_id, farmer_id
      ) VALUES (?, ?)
    ''', [
      programId,
      farmerId,
    ]);
  }

  Future<int> insertPrograms(List<FarmerProgram> programs) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var program in programs) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            program_id, farmer_id
          ) VALUES (?, ?)
        ''', [
          program.programId,
          program.farmerId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerProgram>> fetchAll() async {
    final database = await DatabaseService().database;
    final programs = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return programs.map((e) => FarmerProgram.fromSqfliteDatabase(e)).toList();
  }

  // Add more database methods as needed
}
