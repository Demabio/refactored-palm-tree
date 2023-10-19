import 'dart:convert';

import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';

class DataExporter {
  factory DataExporter() {
    return _exporterClient;
  }

  DataExporter._internal();

  static final DataExporter _exporterClient = DataExporter._internal();

  FarmerDB farmerDB = FarmerDB();

  Future<void> test() async {
    List<Farmer>? farmers = await farmerDB.fetchCompleted();

    if (farmers != null) {
      for (Farmer farmer in farmers) {
        var farmerJson = farmer.toJson();
        var farmerjsonstring = jsonEncode(farmerJson);
        var payLoad = {
          'farmer': farmerjsonstring,
        };
      }
    }
  }

  String cropsJson(List<FarmerCrop>? crops) {
    return "";
  }
}
