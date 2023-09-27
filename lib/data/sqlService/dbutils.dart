import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBUtils {
  factory DBUtils() {
    return _dbutils;
  }
  DBUtils._internal();

  static final DBUtils _dbutils = DBUtils._internal();

  bool doesFileExist(String filePath) {
    File file = File(filePath);
    return file.existsSync();
  }

  void openFileExplorer() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType
            .custom, // Specify the file types you want to allow (e.g., FileType.any, FileType.image, etc.)
        allowedExtensions: [
          'db'
        ], // Specify the allowed file extensions (e.g., ['db', 'sqlite'])
      );

      if (result != null) {
        String? filePath = result.files.single.path;

        if (filePath != null) {
          // You can use the selected filePath here to import the database.
          // Call your importDatabase function with this filePath.
          // For example: importDatabase(filePath, destinationDatabasePath);
          deleteDatabaseIfExists(
              join(PrefUtils().getDBPath(), 'localdevice.db'));
          importDatabase(filePath, PrefUtils().getDBPath());
        }
      }
    } catch (e) {
      print('Error picking database file: $e');
    }
  }

  Future<void> importDatabase(String importPath, String databasePath) async {
    try {
      // Copy the database file from the import path to the app's data directory
      await File(importPath).copy(databasePath);

      print('Database imported from: $importPath');
    } catch (e) {
      print('Error importing database: $e');
    }
  }

  Future<void> exportDatabase(String databasePath, String exportPath) async {
    try {
      // Open the source database
      final sourceDatabase = await openDatabase(databasePath);

      // Close the source database to ensure it's not locked
      await sourceDatabase.close();

      // Copy the database file to the export path
      await File(databasePath).copy(exportPath);

      print('Database exported to: $exportPath');
    } catch (e) {
      print('Error exporting database: $e');
    }
  }

  Future<void> deleteDatabaseIfExists(String databasePath) async {
    try {
      if (await databaseExists(databasePath)) {
        // Close any open connections to the database
        final sourceDatabase = await openDatabase(databasePath);

        // Close the source database to ensure it's not locked
        await sourceDatabase.close();

        // Delete the database file
        await deleteDatabase(databasePath);
      }
    } catch (e) {
      print('Error deleting database: $e');
    }
  }
}
