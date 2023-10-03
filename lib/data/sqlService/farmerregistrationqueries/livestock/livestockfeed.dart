import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/feed.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLivestockFeedsDB {
  final tableName = 'tblfrfarmerslivestockfeeds';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_livestockfeed_id" INTEGER NOT NULL,
        "farmer_livestock_id" INTEGER NOT NULL,
        "feed_type_id" INTEGER NOT NULL,
        "feed_quantity" REAL NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
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
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_livestock_id, feed_type_id, feed_quantity, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerLivestockId,
      feedTypeId,
      feedQuantity,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFeeds(List<FarmerLivestockFeed> feeds) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var feed in feeds) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_livestock_id, feed_type_id, feed_quantity, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          feed.farmerLivestockId,
          feed.feedTypeId,
          feed.feedQuantity,
          feed.dateCreated.toLocal().toIso8601String(),
          feed.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLivestockFeed>> fetchAll() async {
    final database = await DatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return feeds
        .map((e) => FarmerLivestockFeed.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}