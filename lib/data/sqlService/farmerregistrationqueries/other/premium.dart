import 'package:kiamis_app/data/models/farmerregistrationmodels/other/premium.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerPremiumDB {
  final tableName = 'tblfrfarmerpremiums';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "insurance_prem_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "insurance_id" INTEGER NOT NULL,
        "excel_prem_id" INTEGER NOT NULL,
        "authorised_payments_id" INTEGER NOT NULL,
        "season_id" INTEGER NOT NULL,
        "date_premium_paid" DATETIME NOT NULL,
        "amount_paid" REAL NOT NULL,
        "date_created" DATETIME NOT NULL,
        "uploaded_by" VARCHAR(255),
        PRIMARY KEY("insurance_prem_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int insuranceId,
    required int excelPremId,
    required int authorisedPaymentsId,
    required int seasonId,
    required DateTime datePremiumPaid,
    required double amountPaid,
    String? uploadedBy,
  }) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, insurance_id, excel_prem_id, authorised_payments_id, season_id, date_premium_paid, amount_paid, date_created, uploaded_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      insuranceId,
      excelPremId,
      authorisedPaymentsId,
      seasonId,
      datePremiumPaid.toLocal().toIso8601String(),
      amountPaid,
      DateTime.now().toLocal().toIso8601String(),
      uploadedBy,
    ]);
  }

  Future<int> insertPremiums(List<FarmerPremium> premiums) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var premium in premiums) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, insurance_id, excel_prem_id, authorised_payments_id, season_id, date_premium_paid, amount_paid, date_created, uploaded_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          premium.farmerId,
          premium.insuranceId,
          premium.excelPremId,
          premium.authorisedPaymentsId,
          premium.seasonId,
          premium.datePremiumPaid.toLocal().toIso8601String(),
          premium.amountPaid,
          premium.dateCreated.toLocal().toIso8601String(),
          premium.uploadedBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerPremium>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final premiums = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return premiums.map((e) => FarmerPremium.fromSqfliteDatabase(e)).toList();
  }

  // Add more database methods as needed
}
