import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/livestock/livestockfeedtypes.dart';
import '../../database_service.dart';

class LivestockFeedTypeDB {
  final tableName = 'tblfrlivestockfeedtypes';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "feed_type_id" INTEGER NOT NULL,
        "feed_type" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("feed_type_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String feedType,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (feed_type_id, feed_type, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      feedType,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<LivestockFeedType>> fetchAll() async {
    final database = await DatabaseService().database;
    final feedTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return feedTypes
        .map((e) => LivestockFeedType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LivestockFeedType> fetchByFeedTypeId(int feedTypeId) async {
    final database = await DatabaseService().database;
    final feedType = await database.rawQuery('''
      SELECT * FROM $tableName WHERE feed_type_id = ?
    ''', [feedTypeId]);

    return LivestockFeedType.fromSqfliteDatabase(feedType.first);
  }

  // Add more database methods as needed
}
