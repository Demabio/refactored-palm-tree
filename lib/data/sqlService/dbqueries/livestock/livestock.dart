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
        "date_created" DATETIME ,
        "created_by" VARCHAR(255) ,
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

  Future<int> insertLivestocks(List<Livestock> livestocks) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var livestock in livestocks) {
        batch.rawInsert('''
        INSERT INTO $tableName (livestock_id, livestock, livestock_sub_cat_id, livestock_code, common_livestock, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?, ?, ?)
      ''', [
          livestock.livestockId,
          livestock.livestock,
          livestock.livestockSubCatId,
          livestock.livestockCode,
          livestock.commonLivestock ? 1 : 0,
          livestock.dateCreated.toLocal().toIso8601String(),
          livestock.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<Livestock>> fetchAll() async {
    final database = await DatabaseService().database;
    final livestock = await database.rawQuery(''' 
      SELECT tblfrlivestock.*,tblfrlivestocksubcategories.livestock_cat_id,tblfrlivestocksubcategories.livestock_subcategory,tblfrlivestockcategories.livestock_category FROM $tableName 
      LEFT JOIN tblfrlivestocksubcategories ON tblfrlivestock.livestock_sub_cat_id = tblfrlivestocksubcategories.livestock_sub_cat_id
      LEFT JOIN tblfrlivestockcategories ON tblfrlivestocksubcategories.livestock_cat_id = tblfrlivestockcategories.livestock_cat_id    
      ''');

    return livestock
        .map((e) => Livestock.fromSqfliteDatabaseJoined(e))
        .toList();
  }

  Future<List<Livestock>> fetchAllCommon() async {
    final database = await DatabaseService().database;
    final livestock = await database.rawQuery(''' 
      SELECT tblfrlivestock.*,tblfrlivestocksubcategories.livestock_cat_id,tblfrlivestocksubcategories.livestock_subcategory,tblfrlivestockcategories.livestock_category FROM $tableName 
      LEFT JOIN tblfrlivestocksubcategories ON tblfrlivestock.livestock_sub_cat_id = tblfrlivestocksubcategories.livestock_sub_cat_id
      LEFT JOIN tblfrlivestockcategories ON tblfrlivestocksubcategories.livestock_cat_id = tblfrlivestockcategories.livestock_cat_id
      WHERE tblfrlivestock.common_livestock = 1
    ''');

    return livestock
        .map((e) => Livestock.fromSqfliteDatabaseJoined(e))
        .toList();
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
