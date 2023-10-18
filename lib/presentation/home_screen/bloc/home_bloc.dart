import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/utils/progress_dialog_utils.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
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
    on<DBCheckEvent>(_TcheckDBExists);
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
    PrefUtils().setFound(false);

    emit(state.copyWith(
        searchController: TextEditingController(),
        searchController1: TextEditingController(),
        homeModelObj: state.homeModelObj
            ?.copyWith(userprofileItemList: fillUserprofileItemList())));
  }

  Future<Farmer?> getFarmer(String id) async {
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByIDNo(id);
  }

  _searchFarmer(
    FarmerSearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    Farmer? farmer = await getFarmer(event.idNo!);
    if (farmer == null) {
      PrefUtils().setFarmerId(0);
      PrefUtils().setFarmerName("N/A");
      PrefUtils().setFarmerIdNo("");
      PrefUtils().setFound(false);
      PrefUtils().setCropId(0);
      PrefUtils().setFarmId(0);
      PrefUtils().setLivestockId(0);

      event.onError!.call();
    } else {
      PrefUtils().setFarmerId(farmer.farmerId);
      PrefUtils().setFarmerName(farmer.farmerName);
      PrefUtils().setFarmerIdNo(farmer.idNo!);
      PrefUtils().setFound(true);
      PrefUtils().setCropId(0);
      PrefUtils().setFarmId(0);
      PrefUtils().setLivestockId(0);
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

  Future<void> _TcheckDBExists(
    DBCheckEvent event,
    Emitter<HomeState> emit,
  ) async {
    ////ProgressDialogUtils.showProgressDialog();
    await getDatabasesPath().then((value) async {
      exists = _dbutils.doesFileExist(join(value, 'localdevice.db'));
      if (exists) {
        // ProgressDialogUtils.hideProgressDialog();

        event.onSuccess?.call();
      } else {
        // ProgressDialogUtils.hideProgressDialog();

        event.onError?.call();
      }
    }).onError((error, stackTrace) {
      event.onError?.call();
    });
  }
}
