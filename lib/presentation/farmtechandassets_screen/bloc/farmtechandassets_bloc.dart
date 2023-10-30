import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmassetsource.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmassettypes.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmstructures.dart';
import 'package:kiamis_app/data/models/dbModels/other/laboursource.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/asset.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/assetsource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/farmstructure.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/powersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassets.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassetsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassettypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmpowersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmstructures.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/assets.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/assetsource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/powersource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/structure.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmtechandassets_screen/models/farmtechandassets_model.dart';
part 'farmtechandassets_event.dart';
part 'farmtechandassets_state.dart';

/// A bloc that manages the state of a Farmtechandassets according to the event that is dispatched to it.
class FarmtechandassetsBloc
    extends Bloc<FarmtechandassetsEvent, FarmtechandassetsState> {
  FarmtechandassetsBloc(FarmtechandassetsState initialState)
      : super(initialState) {
    on<FarmtechandassetsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FarmtechandassetsInitialEvent event,
    Emitter<FarmtechandassetsState> emit,
  ) async {
    ATProgress pfProgress = await getProgress() ??
        ATProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    FarmerAssetSource farmerFishProductionLevel = await getAssetSource() ??
        FarmerAssetSource(
          farmerAssetSource: 0,
          farmerId: 0,
          farmerFarmId: 0,
          assetSourceId: 0,
        );
    FarmerFarm farmer = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
          labourSourceId: 0,
        );

    FarmAssetSource? assetSource;
    LabourSource? labour;

    SelectionPopupModel? aa;
    SelectionPopupModel? bb;
    List<CheckBoxList>? atypes = await fetchPowerSources();
    List<CheckBoxList>? assets = await fillAssets();
    List<CheckBoxList>? strucs = await fetchFarmStructure();

    if (pfProgress.pageOne == 1) {
      List<FarmerPowerSource>? categs = await getSources();
      atypes = _sources(atypes, categs!);

      List<FarmerAsset>? assetss = await getFAssets();
      assets = _assets(assets, assetss!);
      List<FarmerStructure>? structss = await getStructs();

      strucs = _structs(strucs, structss!);
      if (farmer.labourSourceId != 0) {
        labour = await fetchLabourSources(farmer.labourSourceId!);
      }

      assetSource =
          await fetchAssetSources(farmerFishProductionLevel.assetSourceId);
    }

    emit(state.copyWith(
      a: assets,
      p: atypes,
      s: strucs,
      farm: labour,
      farmStructure: assetSource,
    ));
  }

  Future<FarmAssetSource?> fetchAssetSources(int id) async {
    FarmAssetSourceDB labourSourceDB = FarmAssetSourceDB();

    return await labourSourceDB.fetchByAssetSourceId(id);
  }

  Future<LabourSource?> fetchLabourSources(int id) async {
    LabourSourceDB labourSourceDB = LabourSourceDB();

    return await labourSourceDB.fetchByLabourSourceId(id);
  }

  Future<ATProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    ATProgressDB pfProgressDB = ATProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  List<CheckBoxList> _assets(
      List<CheckBoxList> agemodelss, List<FarmerAsset> agess) {
    List<CheckBoxList> agemodels = agemodelss;
    List<FarmerAsset> ages = agess;

    if (ages.isNotEmpty) {
      for (var ent in ages) {
        int index = agemodels.indexWhere((obj) => obj.id == ent.farmAssetId);

        agemodels[index].isSelected = true;
        agemodels[index].var2 = ent.qty.toString();
        agemodels[index].var3 = ent.usableCondition == 1 ? "Yes" : "No";
      }
    }

    return agemodels;
  }

  List<CheckBoxList> _sources(
      List<CheckBoxList> feedmodelss, List<FarmerPowerSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerPowerSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.powerSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<CheckBoxList> _structs(
      List<CheckBoxList> feedmodelss, List<FarmerStructure> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerStructure> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.farmStructureId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<CheckBoxList>> fetchPowerSources() async {
    List<CheckBoxList> list = [];
    FarmPowerSourceDB powerSourceDB = FarmPowerSourceDB();

    await powerSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].powerSource,
          id: value[i].powerSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fillAssets() async {
    List<CheckBoxList> list = [];

    FarmAssetDB farmAssetDB = FarmAssetDB();
    await farmAssetDB.fetchAll().then((value) async {
      for (int i = 0; i < value.length; i++) {
        FarmAssetType? type = await getAssetTypeById(value[i].assetTypeId);

        list.add(CheckBoxList(
          title: value[i].asset,
          id: value[i].farmAssetId,
          var1: type?.assetName,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fillAssetTypes() async {
    List<CheckBoxList> list = [];
    FarmAssetTypeDB farmAssetTypeDB = FarmAssetTypeDB();
    await farmAssetTypeDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].assetName,
          id: value[i].assetTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    FarmStructureDB farmStructureDB = FarmStructureDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].structureName,
          id: value[i].farmStructureId,
        ));
      }
    });
    return list;
  }

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  Future<FarmAssetType?> getAssetTypeById(int id) async {
    FarmAssetTypeDB farmerFishProductionLevelsDB = FarmAssetTypeDB();
    return await farmerFishProductionLevelsDB.fetchByAssetTypeId(id);
  }

  Future<List<FarmerAsset>?> getFAssets() async {
    int id = PrefUtils().getFarmId();
    FarmerAssetsDB farmerLivestockAgeGroupsDB = FarmerAssetsDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerPowerSource>?> getSources() async {
    int id = PrefUtils().getFarmId();
    FarmerPowerSourceDB farmerLivestockAgeGroupsDB = FarmerPowerSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerStructure>?> getStructs() async {
    int id = PrefUtils().getFarmId();
    FarmerStructureDB farmerLivestockAgeGroupsDB = FarmerStructureDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<FarmerAssetSource?> getAssetSource() async {
    int id = PrefUtils().getFarmId();
    FarmerAssetSourceDB farmerFishProductionLevelsDB = FarmerAssetSourceDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(id);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }
}
