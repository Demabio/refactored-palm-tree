import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/feed.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLivestockFeedsDB {
  final tableName = 'tblfrfarmerslivestockfeeds';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_livestockfeed_id" INTEGER NOT NULL,
        "farmer_livestock_id" INTEGER NOT NULL,
        "feed_type_id" INTEGER NOT NULL,
        "feed_quantity" REAL,
        "date_created" DATETIME,
        "created_by" VARCHAR(255),
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_livestockfeed_id")
      );
    """);
  }

  Future<int> create({
    required int farmerLivestockId,
    required int feedTypeId,
    required double feedQuantity,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_livestock_id, feed_type_id, feed_quantity, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerLivestockId,
      feedTypeId,
      feedQuantity,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFeeds(List<FarmerLivestockFeed> feeds) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var feed in feeds) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_livestock_id, feed_type_id, feed_quantity, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          feed.farmerLivestockId,
          feed.feedTypeId,
          feed.feedQuantity,
          DateTime.now().toLocal().toIso8601String(),
          feed.createdBy,
          0,
          feed.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertFeeds(List<FarmerLivestockFeed> feeds) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var feed in feeds) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1,  date_created = ? WHERE farmer_livestock_id = ? AND feed_type_id = ?
        ''', [
          feed.dateCreated.toLocal().toIso8601String(),
          feed.farmerLivestockId,
          feed.feedTypeId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLivestockFeed>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return feeds
        .map((e) => FarmerLivestockFeed.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerLivestockFeed>> fetchAllByLivestock(int id) async {
    final database = await FarmerDatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_livestock_id = ?  AND active = 1
    ''', [id]);

    return feeds
        .map((e) => FarmerLivestockFeed.fromSqfliteDatabase(e))
        .toList();
  }
    Future<List<FarmerLivestockFeed>> fetchAllByLivestockAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_livestock_id = ? 
    ''', [id]);

    return feeds
        .map((e) => FarmerLivestockFeed.fromSqfliteDatabase(e))
        .toList();
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_livestock_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
