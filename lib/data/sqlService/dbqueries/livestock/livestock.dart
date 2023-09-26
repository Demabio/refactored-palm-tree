import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/livestock/livestock.dart';
import '../../database_service.dart';

class LivestockDB {
  final tableName = 'tblfrlivestock';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "livestock_id" INTEGER NOT NULL,
        "livestock" VARCHAR(255) NOT NULL,
        "livestock_sub_cat_id" INTEGER NOT NULL,
        "livestock_code" VARCHAR(255) NOT NULL,
        "common_livestock" BOOLEAN NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("livestock_id"),
        FOREIGN KEY("livestock_sub_cat_id") REFERENCES "tblfrlivestocksubcategories"("livestock_sub_cat_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String livestock,
    required int livestockSubcategoryId,
    required String livestockCode,
    required bool commonLivestock,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (livestock_id, livestock, livestock_sub_cat_id, livestock_code, common_livestock, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      id,
      livestock,
      livestockSubcategoryId,
      livestockCode,
      commonLivestock ? 1 : 0,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<Livestock>> fetchAll() async {
    final database = await DatabaseService().database;
    final livestock = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return livestock.map((e) => Livestock.fromSqfliteDatabase(e)).toList();
  }

  Future<Livestock> fetchByLivestockId(int livestockId) async {
    final database = await DatabaseService().database;
    final livestockItem = await database.rawQuery('''
      SELECT * FROM $tableName WHERE livestock_id = ?
    ''', [livestockId]);

    return Livestock.fromSqfliteDatabase(livestockItem.first);
  }

  // Add more database methods as needed
}
