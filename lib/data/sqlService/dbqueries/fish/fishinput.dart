import 'package:kiamis_app/data/models/dbModels/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FishInputDB {
  final tableName = 'tbfrfishinput';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "fish_input_id" INTEGER NOT NULL,
        "fish_input" TEXT,
        "description" TEXT,
        "date_created" DATETIME,
        "created_by" INT,
        PRIMARY KEY("fish_input_id")
      );
    """);
  }

  Future<int> createFishInput(FishInput fishInput) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        fish_input, description, date_created, created_by
      ) VALUES (?, ?, ?, ?)
    ''', [
      fishInput.fishInput,
      fishInput.description,
      fishInput.dateCreated?.toIso8601String(),
      fishInput.createdBy,
    ]);
  }

  Future<int> update(FishInput fishInput) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName SET
        fish_input = ?, description = ?, date_created = ?, created_by = ?
      WHERE fish_input_id = ?
    ''', [
      fishInput.fishInput,
      fishInput.description,
      fishInput.dateCreated?.toIso8601String(),
      fishInput.createdBy,
      fishInput.fishInputId,
    ]);
  }

  Future<int> insertFishInputs(List<FishInput> fishInputs) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var fishInput in fishInputs) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            fish_input, description, date_created, created_by
          ) VALUES (?, ?, ?, ?)
        ''', [
          fishInput.fishInput,
          fishInput.description,
          fishInput.dateCreated?.toIso8601String(),
          fishInput.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FishInput>> fetchAll() async {
    final database = await DatabaseService().database;
    final fishInputs = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fishInputs.map((e) => FishInput.fromSqfliteDatabase(e)).toList();
  }

  Future<FishInput> fetchByFishInputId(int fishInputId) async {
    final database = await DatabaseService().database;
    final fishInput = await database.rawQuery('''
      SELECT * FROM $tableName WHERE fish_input_id = ?
    ''', [fishInputId]);

    return FishInput.fromSqfliteDatabase(fishInput.first);
  }

  // Add more database methods as needed
}
