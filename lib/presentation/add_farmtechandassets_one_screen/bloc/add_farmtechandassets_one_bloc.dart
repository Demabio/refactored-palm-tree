import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmassettypes.dart';
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
import 'package:kiamis_app/presentation/add_farmtechandassets_one_screen/models/add_farmtechandassets_one_model.dart';
part 'add_farmtechandassets_one_event.dart';
part 'add_farmtechandassets_one_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsOne according to the event that is dispatched to it.
class AddFarmtechandassetsOneBloc
    extends Bloc<AddFarmtechandassetsOneEvent, AddFarmtechandassetsOneState> {
  AddFarmtechandassetsOneBloc(AddFarmtechandassetsOneState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<SaveTapEvent>(_saveTap);
    on<CheckOneEvent>(_checkpowers);
    on<CheckTwoEvent>(_checkAssets);
    on<CheckThreeEvent>(_checkStructs);
    on<AddEditEvent>(_addEdit);
    on<DeleteEvent>(_delete);
    on<ClearEvent>(_clear);
    on<GoBackEvent>(_goback);
  }

  _goback(
    GoBackEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    if ((state.checkedA || state.checkedS || state.checkedP) &&
        state.addFarmtechandassetsOneModelObj?.atProgress!.pageOne == 1) {
      event.createFailed?.call();
    } else {
      event.createSuccessful?.call();
    }
  }

  _onInitialize(
    AddFarmtechandassetsOneInitialEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
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
    List<SelectionPopupModel>? a = await fetchLabourSources();
    List<SelectionPopupModel>? b = await fetchOwnerships();

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
        aa = a.firstWhere(
          (model) => model.id == farmer.labourSourceId,
        );
      }

      bb = b.firstWhere(
        (model) => model.id == farmerFishProductionLevel.assetSourceId,
      );
    }
    emit(state.copyWith(
        a: assets,
        p: atypes,
        s: strucs,
        addFarmtechandassetsOneModelObj:
            state.addFarmtechandassetsOneModelObj?.copyWith(
          dropdownItemList: a,
          dropdownItemList1: b,
          selectedDropDownValue: aa,
          selectedDropDownValue1: bb,
          atProgress: pfProgress,
        )));
  }

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  Future<ATProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    ATProgressDB pfProgressDB = ATProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  List<CheckBoxList> _assets(
      List<CheckBoxList> agemodelss, List<FarmerAsset> agess) {
    List<CheckBoxList> agemodels = agemodelss;
    List<FarmerAsset> ages = agess;

    if (ages.isNotEmpty) {
      for (var ent in ages) {
        int index = agemodels.indexWhere((obj) => obj.id == ent.farmAssetId);

        agemodels[index].isSelected = true;
        agemodels[index].var1 = ent.farmerAssetId.toString();
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
    int farmerid = PrefUtils().getFarmId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }

  _clear(
    ClearEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    if (state.addFarmtechandassetsOneModelObj?.atProgress!.pageOne == 0) {
      int id = PrefUtils().getFarmId();
      FarmerPowerSourceDB farmerPowerSourceDB = FarmerPowerSourceDB();
      FarmerStructureDB farmerStructureDB = FarmerStructureDB();
      FarmerAssetsDB farmerAssetsDB = FarmerAssetsDB();

      farmerPowerSourceDB.delete(id).then((value) => print("Deleted: $value"));
      farmerStructureDB.delete(id).then((value) => print("Deleted: $value"));
      farmerAssetsDB.delete(id).then((value) => print("Deleted: $value"));
    }
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();
    int selectedCount =
        state.p.where((enterprise) => enterprise.isSelected).length;

    int selectedCount2 =
        state.a.where((enterprise) => enterprise.isSelected).length;
    int selectedCount3 =
        state.s.where((enterprise) => enterprise.isSelected).length;
    FarmerAssetSourceDB farmerFishProductionLevelsDB = FarmerAssetSourceDB();
    FarmerFarmDB farmerDB = FarmerFarmDB();
    try {
      ATProgressDB atProgressDB = ATProgressDB();
      if (state.addFarmtechandassetsOneModelObj!.atProgress!.pageOne == 0 &&
          selectedCount != 0 &&
          selectedCount2 != 0 &&
          selectedCount3 != 0) {
        int id = await farmerFishProductionLevelsDB.create(
          FarmerAssetSource(
            farmerAssetSource: 0,
            farmerId: farmerid,
            farmerFarmId: farmid,
            assetSourceId: state
                .addFarmtechandassetsOneModelObj!.selectedDropDownValue1!.id!,
            createdBy: userId,
            dateCreated: DateTime.now(),
          ),
        );

        int updatedid = await farmerDB.updateFromFarmAsset(FarmerFarm(
          farmerId: farmerid,
          farmerFarmId: farmid,
          labourSourceId:
              state.addFarmtechandassetsOneModelObj!.selectedDropDownValue?.id,
        ));
        if (id > 0 && updatedid > 0) {
          atProgressDB
              .insert(ATProgress(
                farmId: farmid,
                pageTwo: 1,
                pageOne: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      } else if (selectedCount != 0 &&
          selectedCount2 != 0 &&
          selectedCount3 != 0) {
        farmerFishProductionLevelsDB.delete(farmerid);

        int id = await farmerFishProductionLevelsDB.create(
          FarmerAssetSource(
            farmerAssetSource: 0,
            farmerId: farmerid,
            farmerFarmId: farmid,
            assetSourceId: state
                .addFarmtechandassetsOneModelObj!.selectedDropDownValue1!.id!,
            createdBy: userId,
            dateCreated: DateTime.now(),
          ),
        );
        int updatedid = await farmerDB.updateFromFarmAsset(FarmerFarm(
          farmerId: farmerid,
          farmerFarmId: farmid,
          labourSourceId:
              state.addFarmtechandassetsOneModelObj!.selectedDropDownValue?.id,
        ));
        if (id > 0 && updatedid > 0) {
          atProgressDB
              .update(ATProgress(
                farmId: farmid,
                pageTwo: 1,
                pageOne: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.p.where((enterprise) => enterprise.isSelected).length;

        int selectedCount2 =
            state.a.where((enterprise) => enterprise.isSelected).length;
        int selectedCount3 =
            state.s.where((enterprise) => enterprise.isSelected).length;
        emit(state.copyWith(
          checkedP: selectedCount == 0,
          checkedA: selectedCount2 == 0,
          checkedS: selectedCount3 == 0,
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _checkpowers(
    CheckOneEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    List<FarmerPowerSource>? fishes = await getSources();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchPowerSources();

    feedmodels = fishes != null ? _sources(feedmodels, fishes) : feedmodels;

    if (fishes != null) {
      emit(state.copyWith(p: feedmodels, checkedP: false));
    } else {
      emit(state.copyWith(
        checkedP: true,
        p: feedmodels,
      ));
    }
  }

  _checkAssets(
    CheckTwoEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    List<FarmerAsset>? fishes = await getFAssets();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fillAssets();

    feedmodels = fishes != null ? _assets(feedmodels, fishes) : feedmodels;

    if (fishes != null) {
      emit(state.copyWith(a: feedmodels, checkedA: false));
    } else {
      emit(state.copyWith(
        checkedA: true,
        a: feedmodels,
      ));
    }
  }

  _checkStructs(
    CheckThreeEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    List<FarmerStructure>? fishes = await getStructs();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchFarmStructure();

    feedmodels = fishes != null ? _structs(feedmodels, fishes) : feedmodels;

    if (fishes != null) {
      emit(state.copyWith(s: feedmodels, checkedS: false));
    } else {
      emit(state.copyWith(
        checkedS: true,
        s: feedmodels,
      ));
    }
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      addFarmtechandassetsOneModelObj:
          state.addFarmtechandassetsOneModelObj?.copyWith(
        selectedDropDownValue1:
            state.addFarmtechandassetsOneModelObj?.selectedDropDownValue1,
        selectedDropDownValue: event.value,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      addFarmtechandassetsOneModelObj:
          state.addFarmtechandassetsOneModelObj?.copyWith(
        selectedDropDownValue:
            state.addFarmtechandassetsOneModelObj?.selectedDropDownValue,
        selectedDropDownValue1: event.value,
      ),
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  Future<List<SelectionPopupModel>> fetchOwnerships() async {
    List<SelectionPopupModel> list = [];
    FarmAssetSourceDB farmOwnershipDB = FarmAssetSourceDB();

    await farmOwnershipDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].assetSource,
          id: value[i].assetSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchLabourSources() async {
    List<SelectionPopupModel> list = [];
    LabourSourceDB labourSourceDB = LabourSourceDB();

    await labourSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].labourSource,
          id: value[i].labourSourceId,
        ));
      }
    });
    return list;
  }

  _addEdit(
    AddEditEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) {
    if (event.value! == 1) {
      PrefUtils().setEditId(event.crop!);
      event.createSuccessful!.call();
    } else {
      PrefUtils().setEditId(0);
      event.createSuccessful!.call();
    }
  }

  _delete(
    DeleteEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    if (PrefUtils().getYesNo()) {
      FarmerAssetsDB farmerAssetsDB = FarmerAssetsDB();
      int deleted = await farmerAssetsDB.delete(event.value!);
      if (deleted > 0) {
        List<CheckBoxList>? assets = await fillAssets();

        if (state.addFarmtechandassetsOneModelObj?.atProgress?.pageOne == 1) {
          List<FarmerAsset>? assetss = await getFAssets();
          assets = _assets(assets, assetss!);
        }
        emit(state.copyWith(
          a: assets,
        ));
      }
    }
  }
}
