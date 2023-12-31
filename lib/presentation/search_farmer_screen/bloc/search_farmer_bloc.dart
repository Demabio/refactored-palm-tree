import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/downloadedfarmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/presentation/search_farmer_screen/models/farm_item_model.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/search_farmer_screen/models/search_farmer_model.dart';
part 'search_farmer_event.dart';
part 'search_farmer_state.dart';

/// A bloc that manages the state of a SearchFarmer according to the event that is dispatched to it.
class SearchFarmerBloc extends Bloc<SearchFarmerEvent, SearchFarmerState> {
  SearchFarmerBloc(SearchFarmerState initialState) : super(initialState) {
    on<SearchFarmerInitialEvent>(_onInitialize);
    on<FarmerSearchEvent>(_searchFarmer);
    on<AddEditEvent>(_addEdit);
    on<DeleteEvent>(_delete);
  }

  Future<Farmer?> getFarmer(String id) async {
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByIDNo(id);
  }

  Future<List<FarmerFarm>?> getFarms(int id) async {
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmer(id);
  }

  Future<Farmer?> getFarmerWard(String id) async {
    DFarmerDB farmerFishProductionLevelsDB = DFarmerDB();
    return await farmerFishProductionLevelsDB.fetchByIDNo(id);
  }

  _searchFarmer(
    FarmerSearchEvent event,
    Emitter<SearchFarmerState> emit,
  ) async {
    Farmer? farmer = await getFarmer(event.idNo!);
    if (farmer == null) {
      Farmer? dfarmers = await getFarmerWard(event.idNo!);
      if (dfarmers == null) {
        PrefUtils().setFarmerId(0);
        PrefUtils().setFarmerName("Not Applied");
        PrefUtils().setBee("0");
        PrefUtils().setAgeGroups("0");
        PrefUtils().setFeeds("0");

        PrefUtils().setFarmerIdNo(event.idNo!);
        PrefUtils().setFound(false);
        PrefUtils().setCropId(0);
        PrefUtils().setFarmId(0);
        PrefUtils().setLivestockId(0);
        List<FdetailsItemModel>? models = [];
        emit(state.copyWith(
          fmodel: models,
        ));
        event.onError?.call();
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
        List<FarmerFarm>? farms = await getFarms(dfarmers.farmerId);
        List<FdetailsItemModel>? models = [];

        if (farms != null) {
          for (var farm in farms) {
            String production =
                "${farm.cropProd! ? "Crop" : ""}, ${farm.livestockProd! ? "Livestock" : ""}, ${farm.fishFarming! ? "Fish" : ""}";

            models.add(FdetailsItemModel(
              id: farm.farmerFarmId,
              prod: production,
              name: farm.farmName,
              landsize: farm.farmSize.toString(),
              x: farm.x.toString(),
              y: farm.y.toString(),
              completed: farm.completed!,
            ));
          }
        }
        emit(state.copyWith(
          fmodel: models,
          name: dfarmers.idNo,
        ));
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
      List<FarmerFarm>? farms = await getFarms(farmer.farmerId);
      List<FdetailsItemModel>? models = [];

      if (farms != null) {
        for (var farm in farms) {
          String production =
              "${farm.cropProd! ? "Crop" : ""}, ${farm.livestockProd! ? "Livestock" : ""}, ${farm.fishFarming! ? "Fish" : ""}";

          models.add(FdetailsItemModel(
            id: farm.farmerFarmId,
            prod: production,
            name: farm.farmName,
            landsize: farm.farmSize.toString(),
            x: farm.x.toString(),
            y: farm.y.toString(),
            completed: farm.completed!,
          ));
        }
      }
      emit(state.copyWith(
        fmodel: models,
        name: farmer.farmerName,
      ));
    }
  }

  _onInitialize(
    SearchFarmerInitialEvent event,
    Emitter<SearchFarmerState> emit,
  ) async {
    PrefUtils().setFound(false);
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
  }

  _addEdit(
    AddEditEvent event,
    Emitter<SearchFarmerState> emit,
  ) {
    if (PrefUtils().getFound()) {
      if (event.value! == 1) {
        PrefUtils().setFarmId(event.crop!);
        event.createSuccessful!.call();
      } else {
        PrefUtils().setFarmId(0);
        event.createSuccessful!.call();
      }
    }
  }

  _delete(
    DeleteEvent event,
    Emitter<SearchFarmerState> emit,
  ) async {
    if (PrefUtils().getYesNo()) {
      FarmerFarmDB farmerLivestockFeedsDB = FarmerFarmDB();
      int del = await farmerLivestockFeedsDB.delete(event.value!);
      if (del > 0) {
        List<FarmerFarm>? farms = await getFarms(PrefUtils().getFarmerId());
        List<FdetailsItemModel>? models = [];

        if (farms != null) {
          for (var farm in farms) {
            String production =
                "${farm.cropProd! ? "Crop" : ""}, ${farm.livestockProd! ? "Livestock" : ""}, ${farm.fishFarming! ? "Fish" : ""}";

            models.add(FdetailsItemModel(
              id: farm.farmerFarmId,
              prod: production,
              name: farm.farmName,
              landsize: farm.farmSize.toString(),
              x: farm.x.toString(),
              y: farm.y.toString(),
            ));
          }
        }

        emit(state.copyWith(
          fmodel: models,
        ));
      }
    }
  }
}
