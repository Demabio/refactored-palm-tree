import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationmemberships.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/agency.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/category.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/type.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/watersource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/landpractice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/soiltest.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmlandpractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationwatersources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/membershiptypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/agency.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/category.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/type.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/watersource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/landpractice.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/soiltest.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/landandwatermgmt_screen/models/landandwatermgmt_model.dart';
part 'landandwatermgmt_event.dart';
part 'landandwatermgmt_state.dart';

/// A bloc that manages the state of a Landandwatermgmt according to the event that is dispatched to it.
class LandandwatermgmtBloc
    extends Bloc<LandandwatermgmtEvent, LandandwatermgmtState> {
  LandandwatermgmtBloc(LandandwatermgmtState initialState)
      : super(initialState) {
    on<LandandwatermgmtInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LandandwatermgmtInitialEvent event,
    Emitter<LandandwatermgmtState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmId: 0,
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
          irrigationUse: false,
        );

    FarmerFarm farm = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          gokFertiliser: false,
          farmerFarmId: 0,
          limeUsage: false,
          irrigationArea: 0,
          irrigationUse: false,
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
    List<CheckBoxList>? typemodels = await fetchType();
    List<CheckBoxList>? schememodels = await fetchSchemes();
    List<CheckBoxList>? agmodels = await fetchAgency();

    if (pfProgress.pageOne == 1) {
      List<FarmerLandPractice>? land = await getLandP();
      if (land != null) {
        landmodels = _land(landmodels, land);
      }
      List<FarmerIrrigationWaterSource>? water = await getWater();
      if (water != null) {
        watermodels = _water(watermodels, water);
      }
    }
    if (pfProgress.pageTwo == 1) {
      List<FarmerIrrigationType>? type = await getType();
      if (type != null) {
        typemodels = _type(typemodels, type);
      }
      List<FarmerIrrigationCategory>? scheme = await getCategs();
      if (scheme != null) {
        schememodels = _categ(schememodels, scheme);
      }
      List<FarmerIrrigationAgency>? ag = await getAgency();
      if (ag != null) {
        agmodels = _agency(agmodels, ag);
      }
    }
    emit(state.copyWith(
      u: typemodels,
      p: schememodels,
      b: agmodels,
      pp: landmodels,
      s: watermodels,
      soil: soilTest,
      farmer: farmer,
      farm: farm,
    ));
  }

  Future<List<SelectionPopupModel>> fillCategories() async {
    List<SelectionPopupModel> list = [];
    CropAreaUnitDB areaUnitDB = CropAreaUnitDB();
    await areaUnitDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].areaUnit,
          id: value[i].areaUnitId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchType() async {
    List<CheckBoxList> list = [];
    IrrigationTypeDB farmStructureDB = IrrigationTypeDB();
//        createdBy: int.parse(map['created_by'] ?? "0"),

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].irrigationType,
          id: value[i].irrigationTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>?> memberships() async {
    List<IrrigationMembershipType>? types = [];
    List<SelectionPopupModel>? list = [];

    IrrigationMembershipTypeDB membershipTypeDB = IrrigationMembershipTypeDB();
    types = await membershipTypeDB.fetchAll();
    if (types != null)
      for (var type in types) {
        list.add(SelectionPopupModel(
          title: type.irrigationMembershipType,
          id: type.membershipTypeId,
        ));
      }
    return list;
  }

  Future<List<CheckBoxList>> fetchSchemes() async {
    List<CheckBoxList> list = [];

    List<SelectionPopupModel>? dpds = await memberships();
    //  List<SelectionPopupModel> dpds = [
    //     SelectionPopupModel(title: "Full Member", id: 1),
    //     SelectionPopupModel(title: "Out Grower Member", id: 0),
    //   ];
    IrrigationAgencyDB livestockAgeGroupDB = IrrigationAgencyDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agencyName,
          id: value[i].irrigationAgencyId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
          model: dpds ?? [],
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchAgency() async {
    List<CheckBoxList> list = [];
    IrrigationAgencyDB farmStructureDB = IrrigationAgencyDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agencyName,
          id: value[i].irrigationAgencyId,
        ));
      }
    });
    return list;
  }

  List<CheckBoxList> _type(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationType> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationType> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<CheckBoxList> _categ(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationCategory> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationCategory> feeds = feedss;

    for (var ent in feeds) {
      SelectionPopupModel? drop;
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationCategoryId);
      if (ent.membershipTypeId != 0) {
        int index2 = feedmodels[index]
            .model
            .indexWhere((obj) => obj.id == ent.membershipTypeId);

        drop = index2 >= 0 ? feedmodels[index].model[index2] : drop;
      }

      feedmodels[index].isSelected = true;
      feedmodels[index].var1 = ent.irrigationProjectName ?? "N/A";
      feedmodels[index].male =
          TextEditingController(text: ent.irrigationProjectName);
      feedmodels[index].drop = ent.membershipTypeId == 0 ? null : drop;
    }

    return feedmodels;
  }

  List<CheckBoxList> _agency(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationAgency> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationAgency> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationAgencyId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerIrrigationAgency>?> getAgency() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationAgencyDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationAgencyDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerIrrigationCategory>?> getCategs() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationCategoryDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationCategoryDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerIrrigationType>?> getType() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationTypeDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationTypeDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerIrrigationWaterSource>?> getWater() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationWaterSourceDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationWaterSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<LWProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  Future<FarmerSoilTest?> getSoilTest() async {
    int farmid = PrefUtils().getFarmId();
    FarmerSoilTestDB farmerFishProductionLevelsDB = FarmerSoilTestDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(farmid);
  }

  Future<List<FarmerLandPractice>?> getLandP() async {
    int id = PrefUtils().getFarmId();
    FarmerLandPracticesDB farmerLivestockAgeGroupsDB = FarmerLandPracticesDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
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
}
