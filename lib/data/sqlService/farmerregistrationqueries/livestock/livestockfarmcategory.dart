import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockfarmcategory.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class LivestockFarmSystemCategoryDB {
  final tableName = 'tblfrlivestockfarmsystemcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "livestock_farmsystem_cat_id" INTEGER NOT NULL,
        "livestock_cat_id" INTEGER NOT NULL,
        "livestock_farmsystem_id" INTEGER NOT NULL,
        "livestock_farmsys_cat_code" VARCHAR(25),
        "date_created" DATETIME ,
        "created_by" VARCHAR(255),
        PRIMARY KEY("livestock_farmsystem_cat_id")
      );
    """);
  }

  Future<int> create(LivestockFarmSystemCategory farmSystemCategory) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        livestock_cat_id, livestock_farmsystem_id, livestock_farmsys_cat_code,
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmSystemCategory.livestockCatId,
      farmSystemCategory.livestockFarmsystemId,
      farmSystemCategory.livestockFarmsysCatCode,
      DateTime.now().toLocal().toIso8601String(),
      farmSystemCategory.createdBy,
    ]);
  }

  Future<int> insertCategories(
      List<LivestockFarmSystemCategory> categories) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var category in categories) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            livestock_cat_id, livestock_farmsystem_id, livestock_farmsys_cat_code,
            date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          category.livestockCatId,
          category.livestockFarmsystemId,
          category.livestockFarmsysCatCode,
          category.dateCreated.toLocal().toIso8601String(),
          category.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<LivestockFarmSystemCategory>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final categories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return categories
        .map((e) => LivestockFarmSystemCategory.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
