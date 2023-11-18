import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassets.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/downloadedfarmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/sqlService/dbutils.dart';
import '/core/app_export.dart';
import '../models/userprofile_item_model.dart';
import 'package:kiamis_app/presentation/home_screen/models/home_model.dart';
import 'package:path/path.dart';

part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<DBCheckEvent>(_tcheckDBExists);
    on<FarmerSearchEvent>(_searchFarmer);
    on<LoadGraphs>(_loadgraphs);
  }

  DBUtils _dbutils = DBUtils();

  bool exists = false;

  List<UserprofileItemModel> fillUserprofileItemList() {
    return List.generate(6, (index) => UserprofileItemModel());
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    FarmerDB farmerDB = FarmerDB();
    FarmerFarmDB farmerFarmDB = FarmerFarmDB();

    await farmerFarmDB.checkPosted();
    int? allfarmers = await farmerDB.getFarmersCount();
    int? savedfarmers = await farmerDB.getSaved();
    int? verfarmers = await farmerDB.getApproved();
    int? rejfarmers = await farmerDB.getUnapproved();
    int? submitted = await farmerDB.getSubmitted();

    // int? unverfarmers = await farmerDB.getUnverified();
    int? iprs = 0;
    // await farmerDB.getFarmersCount();

    PrefUtils().setFound(false);

    emit(state.copyWith(
        searchController: TextEditingController(),
        searchController1: TextEditingController(),
        a: savedfarmers,
        b: verfarmers,
        c: submitted,
        d: rejfarmers,
        e: iprs,
        f: allfarmers,
        homeModelObj: state.homeModelObj
            ?.copyWith(userprofileItemList: fillUserprofileItemList())));
  }

  Future<Farmer?> getFarmer(String id) async {
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByIDNo(id);
  }

  Future<Farmer?> getFarmerWard(String id) async {
    DFarmerDB farmerFishProductionLevelsDB = DFarmerDB();
    return await farmerFishProductionLevelsDB.fetchByIDNo(id);
  }

  _searchFarmer(
    FarmerSearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    Farmer? farmer = await getFarmer(event.idNo!);
    if (farmer == null) {
      Farmer? dfarmers = await getFarmerWard(event.idNo!);
      if (dfarmers == null) {
        PrefUtils().setFarmerId(0);
        PrefUtils().setFarmerName("Not Applied");
        PrefUtils().setFarmerIdNo(event.idNo!);
        PrefUtils().setFound(false);
        PrefUtils().setCropId(0);
        PrefUtils().setFarmId(0);
        PrefUtils().setLivestockId(0);
        PrefUtils().setBee("0");
        PrefUtils().setAgeGroups("0");
        PrefUtils().setFeeds("0");
        event.onError!.call();
      } else {
        PrefUtils().setFarmerId(dfarmers.farmerId);
        PrefUtils().setFarmerName(dfarmers.farmerName);
        PrefUtils().setFarmerIdNo(dfarmers.idNo!);
        PrefUtils().setFound(true);
        PrefUtils().setCropId(0);
        PrefUtils().setFarmId(0);
        PrefUtils().setLivestockId(0);
        PrefUtils().setBee("0");
        PrefUtils().setAgeGroups("0");
        PrefUtils().setFeeds("0");
        event.onSuccess!.call();
      }
    } else {
      PrefUtils().setFarmerId(farmer.farmerId);
      PrefUtils().setFarmerName(farmer.farmerName);
      PrefUtils().setFarmerIdNo(farmer.idNo!);
      PrefUtils().setFound(true);
      PrefUtils().setCropId(0);
      PrefUtils().setFarmId(0);
      PrefUtils().setLivestockId(0);
      PrefUtils().setBee("0");
      PrefUtils().setAgeGroups("0");
      PrefUtils().setFeeds("0");
      event.onSuccess!.call();
    }
  }

  _loadgraphs(
    LoadGraphs event,
    Emitter<HomeState> emit,
  ) async {
    FarmerDB farmerDB = FarmerDB();

    List<Map<String, Object?>>? bdata =
        await farmerDB.getApprovedAndRejectedCountsForLast6Months();

    emit(state.copyWith(bardata: bdata));
  }

  Future<void> _tcheckDBExists(
    DBCheckEvent event,
    Emitter<HomeState> emit,
  ) async {
    ////ProgressDialogUtils.showProgressDialog();
    await getDatabasesPath().then((value) async {
      exists = _dbutils.doesFileExist(join(value, 'localdevice.db'));
      if (exists) {
        CropDB cropDB = CropDB();
        LivestockDB livestockDB = LivestockDB();
        FishTypeDB fishTypeDB = FishTypeDB();
        FarmAssetDB farmAssetDB = FarmAssetDB();

        int crops = await cropDB.getCount() ?? 0;
        int assets = await farmAssetDB.getCount() ?? 0;
        int lives = await livestockDB.getCount() ?? 0;
        int fishes = await fishTypeDB.getCount() ?? 0;

        if (crops == 0 && assets == 0 && lives == 0 && fishes == 0) {
          event.onError!.call();
          return;
        }

        main();
        event.onSuccess?.call();
      } else {
        // ProgressDialogUtils.hideProgressDialog();

        event.onError?.call();
      }
    }).onError((error, stackTrace) {
      event.onError?.call();
    });
  }

  Future<void> main() async {
    final databasesPath = await getDatabasesPath();
    print("Databases path: $databasesPath");

    final files = Directory(databasesPath).listSync();
    for (var file in files) {
      print("File: ${file.path}");
    }
  }
}
