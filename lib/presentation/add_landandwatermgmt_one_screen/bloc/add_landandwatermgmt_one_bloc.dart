import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/watersource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/landpractice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/soiltest.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmlandpractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationwatersources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/watersource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/landpractice.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/soiltest.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_one_screen/models/add_landandwatermgmt_one_model.dart';
part 'add_landandwatermgmt_one_event.dart';
part 'add_landandwatermgmt_one_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtOne according to the event that is dispatched to it.
class AddLandandwatermgmtOneBloc
    extends Bloc<AddLandandwatermgmtOneEvent, AddLandandwatermgmtOneState> {
  AddLandandwatermgmtOneBloc(AddLandandwatermgmtOneState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<SaveTapEvent>(_saveTap);
    on<NextTapEvent>(_nextTap);

    on<CheckOneEvent>(_checkAssets);
    on<CheckTwoEvent>(_checkIncomes);

    on<ClearEvent>(_clear);
  }

  _onInitialize(
    AddLandandwatermgmtOneInitialEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmerId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    Farmer farmer = await getFarmer() ??
        Farmer(
          farmerId: 0,
          farmerName: "farmerName",
          gokFertiliser: false,
          cooperativeGroup: false,
          limeUsage: false,
          irrigationArea: 0,
        );

    FarmerSoilTest soilTest = await getSoilTest() ??
        FarmerSoilTest(
          farmerSoilseedId: 0,
          farmerId: 0,
          farmerFarmId: 0,
          soilTest: 0,
        );
    List<CheckBoxList>? landmodels = await fetchLandP();
    List<CheckBoxList>? watermodels = await fetchWater();

    List<SelectionPopupModel>? a = fillDropdownItemList();
    SelectionPopupModel? aa;
    SelectionPopupModel? bb;
    SelectionPopupModel? cc;

    if (pfProgress.pageOne == 1) {
      List<FarmerLandPractice>? land = await getLandP();
      if (land != null) {
        landmodels = _land(landmodels, land);
      }
      List<FarmerIrrigationWaterSource>? water = await getWater();
      if (water != null) {
        watermodels = _water(watermodels, water);
      }

      aa = a.firstWhere(
        (model) => model.id == (farmer.gokFertiliser! ? 1 : 0),
      );
      bb = a.firstWhere(
        (model) => model.id == (farmer.limeUsage! ? 1 : 0),
      );
      if (soilTest.soilTest != null) {
        cc = a.firstWhere(
          (model) => model.id == (farmer.gokFertiliser! ? 1 : 0),
        );
      }
    }
    int stepped = 0;
    if (pfProgress.pageTwo == 1) {
      stepped = 2;
    } else if (pfProgress.pageOne == 1) {
      stepped = 1;
    }
    emit(state.copyWith(
        p: landmodels,
        s: watermodels,
        addLandandwatermgmtOneModelObj:
            state.addLandandwatermgmtOneModelObj?.copyWith(
          dropdownItemList: a,
          dropdownItemList1: a,
          dropdownItemList2: a,
          selectedDropDownValue1: bb,
          selectedDropDownValue: aa,
          selectedDropDownValue2: cc,
          stepped2: stepped,
          lwProgress: pfProgress,
        )));
  }

  Future<List<FarmerIrrigationWaterSource>?> getWater() async {
    int id = PrefUtils().getFarmerId();
    FarmerIrrigationWaterSourceDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationWaterSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<LWProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }

  Future<FarmerSoilTest?> getSoilTest() async {
    int farmid = PrefUtils().getFarmId();
    FarmerSoilTestDB farmerFishProductionLevelsDB = FarmerSoilTestDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(farmid);
  }

  Future<List<FarmerLandPractice>?> getLandP() async {
    int id = PrefUtils().getFarmId();
    FarmerLandPracticesDB farmerLivestockAgeGroupsDB = FarmerLandPracticesDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  List<CheckBoxList> _land(
      List<CheckBoxList> feedmodelss, List<FarmerLandPractice> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerLandPractice> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.landPracticeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<CheckBoxList> _water(List<CheckBoxList> feedmodelss,
      List<FarmerIrrigationWaterSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationWaterSource> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationWaterSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<CheckBoxList>> fetchLandP() async {
    List<CheckBoxList> list = [];
    FarmlandPracticeDB farmStructureDB = FarmlandPracticeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].landPracticeName,
          id: value[i].landPracticeId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchWater() async {
    List<CheckBoxList> list = [];
    IrrigationWaterSourceDB farmStructureDB = IrrigationWaterSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].irrigationWaterSource,
          id: value[i].irrigationWaterSourceId,
        ));
      }
    });
    return list;
  }

  _nextTap(
    NextTapEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) async {
    int farmerid = PrefUtils().getFarmerId();
    int selectedCount =
        state.p.where((enterprise) => enterprise.isSelected).length;

    FarmerDB farmerDB = FarmerDB();
    FarmerSoilTestDB farmerSoilTestDB = FarmerSoilTestDB();
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    try {
      LWProgressDB atProgressDB = LWProgressDB();
      if (state.addLandandwatermgmtOneModelObj!.lwProgress!.pageOne == 0 &&
          selectedCount != 0) {
        int id = await farmerDB.updateFromLandWater(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          gokFertiliser:
              state.addLandandwatermgmtOneModelObj!.selectedDropDownValue?.id ==
                  1,
          limeUsage: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ==
              1,
        ));
        int soilid = await farmerSoilTestDB.create(FarmerSoilTest(
          farmerSoilseedId: 0,
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getFarmId(),
          soilTest: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ??
              0,
          createdBy: userId,
          dateCreated: DateTime.now(),
          soilTestYear: 0,
        ));
        //REMEMBER!!!!!!!!
        //   if (id > 0) {
        atProgressDB
            .insert(LWProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addLandandwatermgmtOneModelObj!.lwProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //}
      } else if (selectedCount != 0) {
        int id = await farmerDB.updateFromLandWater(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          gokFertiliser:
              state.addLandandwatermgmtOneModelObj!.selectedDropDownValue?.id ==
                  1,
          limeUsage: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ==
              1,
        ));
        int soilid = await farmerSoilTestDB.update(FarmerSoilTest(
          farmerSoilseedId: 0,
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getFarmId(),
          soilTest: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ??
              0,
        ));
        //  if (id > 0) {
        atProgressDB
            .update(LWProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addLandandwatermgmtOneModelObj!.lwProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //   }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.p.where((enterprise) => enterprise.isSelected).length;

        emit(state.copyWith(
          checka: selectedCount == 0,
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) async {
    int farmerid = PrefUtils().getFarmerId();
    int selectedCount =
        state.p.where((enterprise) => enterprise.isSelected).length;

    FarmerDB farmerDB = FarmerDB();
    FarmerSoilTestDB farmerSoilTestDB = FarmerSoilTestDB();
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    try {
      LWProgressDB atProgressDB = LWProgressDB();
      if (state.addLandandwatermgmtOneModelObj!.lwProgress!.pageOne == 0 &&
          selectedCount != 0) {
        int id = await farmerDB.updateFromLandWater(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          gokFertiliser:
              state.addLandandwatermgmtOneModelObj!.selectedDropDownValue?.id ==
                  1,
          limeUsage: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ==
              1,
        ));
        int soilid = await farmerSoilTestDB.create(FarmerSoilTest(
          farmerSoilseedId: 0,
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getFarmId(),
          soilTest: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ??
              0,
          createdBy: userId,
          dateCreated: DateTime.now(),
          soilTestYear: 0,
        ));
        //REMEMBER!!!!!!!!
        //   if (id > 0) {
        atProgressDB
            .insert(LWProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addLandandwatermgmtOneModelObj!.lwProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //}
      } else if (selectedCount != 0) {
        int id = await farmerDB.updateFromLandWater(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          gokFertiliser:
              state.addLandandwatermgmtOneModelObj!.selectedDropDownValue?.id ==
                  1,
          limeUsage: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ==
              1,
        ));
        int soilid = await farmerSoilTestDB.update(FarmerSoilTest(
          farmerSoilseedId: 0,
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getFarmId(),
          soilTest: state
                  .addLandandwatermgmtOneModelObj!.selectedDropDownValue2?.id ??
              0,
        ));
        //  if (id > 0) {
        atProgressDB
            .update(LWProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addLandandwatermgmtOneModelObj!.lwProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //   }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.p.where((enterprise) => enterprise.isSelected).length;

        emit(state.copyWith(
          checka: selectedCount == 0,
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _checkAssets(
    CheckOneEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) async {
    List<FarmerLandPractice>? fishes = await getLandP();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchLandP();

    feedmodels = fishes != null ? _land(feedmodels, fishes) : feedmodels;
    fishes != null
        ? emit(state.copyWith(p: feedmodels, checka: false))
        : emit(state.copyWith(checka: true));

    // if (fishes.isNotEmpty) {
    // } else {
    // }
  }

  _checkIncomes(
    CheckTwoEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) async {
    List<FarmerIrrigationWaterSource>? fishes = await getWater();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchWater();

    feedmodels =
        fishes != null ? feedmodels = _water(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(s: feedmodels))
        : emit(state.copyWith(s: feedmodels));
  }

  _clear(
    ClearEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) async {
    if (state.addLandandwatermgmtOneModelObj?.lwProgress!.pageOne == 0) {
      int farmerid = PrefUtils().getFarmerId();
      FarmerIrrigationWaterSourceDB farmerIrrigationWaterSourceDB =
          FarmerIrrigationWaterSourceDB();
      FarmerLandPracticesDB farmerLandPracticesDB = FarmerLandPracticesDB();

      farmerIrrigationWaterSourceDB
          .delete(farmerid)
          .then((value) => print("Deleted: $value"));
      farmerLandPracticesDB
          .delete(farmerid)
          .then((value) => print("Deleted: $value"));
    }
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      addLandandwatermgmtOneModelObj:
          state.addLandandwatermgmtOneModelObj?.copyWith(
        selectedDropDownValue: event.value,
        selectedDropDownValue1:
            state.addLandandwatermgmtOneModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.addLandandwatermgmtOneModelObj?.selectedDropDownValue2,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      addLandandwatermgmtOneModelObj:
          state.addLandandwatermgmtOneModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedDropDownValue:
            state.addLandandwatermgmtOneModelObj?.selectedDropDownValue,
        selectedDropDownValue2:
            state.addLandandwatermgmtOneModelObj?.selectedDropDownValue2,
      ),
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      addLandandwatermgmtOneModelObj:
          state.addLandandwatermgmtOneModelObj?.copyWith(
        selectedDropDownValue2: event.value,
        selectedDropDownValue1:
            state.addLandandwatermgmtOneModelObj?.selectedDropDownValue1,
        selectedDropDownValue:
            state.addLandandwatermgmtOneModelObj?.selectedDropDownValue,
      ),
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }
}
