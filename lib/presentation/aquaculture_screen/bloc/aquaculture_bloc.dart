import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishproductionlevels.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fish.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishinput.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionlevel.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionlevels.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionuom.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/productionlevel.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/productionsystem.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/aquaculture_screen/models/aquaculture_model.dart';
part 'aquaculture_event.dart';
part 'aquaculture_state.dart';

/// A bloc that manages the state of a Aquaculture according to the event that is dispatched to it.
class AquacultureBloc extends Bloc<AquacultureEvent, AquacultureState> {
  AquacultureBloc(AquacultureState initialState) : super(initialState) {
    on<AquacultureInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AquacultureInitialEvent event,
    Emitter<AquacultureState> emit,
  ) async {
    AQProgress pfProgress = await getProgress() ??
        AQProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? fishinputs = [];
    List<CheckBoxList>? atypes = [];
    List<CheckBoxList>? fish = [];
    List<CheckBoxList>? prods = [];
    FarmerFishProductionLevel farmerFishProductionLevel =
        await getProdlevel() ??
            FarmerFishProductionLevel(
              farmerProductionLevelId: 0,
              farmerId: 0,
              farmerFarmId: 0,
              productionLevelId: 0,
              fertilizerInPonds: false,
              espBenefit: 0,
            );
    FishProductionLevel? fishProductionLevel;

    if (pfProgress.pageTwo == 1 &&
        farmerFishProductionLevel.productionLevelId != 0) {
      List<FarmerFishInput>? fishes = await getFishInputs();
      fishProductionLevel =
          await getProdlevelByid(farmerFishProductionLevel.productionLevelId);
      fishinputs = await fetchFishInputs();

      fishinputs = _inputs(fishinputs, fishes!);
    }
    if (pfProgress.pageOne == 1) {
      List<FarmerFish>? fishes = await getFishes();

      List<FarmerFishCategory>? categs = await getCategs();

      List<FarmerFishProductionSystem>? prodsyss = await getProdSyss();

      atypes = await fetchCategs();
      fish = await fetchFish();
      prods = await fillProdsystems();

      atypes = _types(atypes, categs!);
      fish = await _fish(fish, fishes!);
      prods = _systems(prods, prodsyss!);
    }
    emit(state.copyWith(
      farmerFishProductionLevel: farmerFishProductionLevel,
      aquatypes: atypes,
      fish: fish,
      prodsyss: prods,
      level: fishProductionLevel?.productionLevel,
    ));
  }

  Future<AQProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    AQProgressDB pfProgressDB = AQProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  Future<FarmerFishProductionLevel?> getProdlevel() async {
    int farmerid = PrefUtils().getFarmId();
    FarmerFishProductionLevelsDB farmerFishProductionLevelsDB =
        FarmerFishProductionLevelsDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(farmerid);
  }

  Future<List<FarmerFishInput>?> getFishInputs() async {
    int id = PrefUtils().getFarmId();
    FarmerFishInputDB farmerLivestockAgeGroupsDB = FarmerFishInputDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<CheckBoxList>> fetchFishInputs() async {
    List<CheckBoxList> list = [];
    FishInputDB fishCategoryDB = FishInputDB();

    await fishCategoryDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishInput,
          id: value[i].fishInputId,
        ));
      }
    });
    return list;
  }

  List<CheckBoxList> _inputs(
      List<CheckBoxList> feedmodelss, List<FarmerFishInput> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFishInput> feeds = feedss;
    if (feeds.isNotEmpty) {
      for (var ent in feeds) {
        int index = feedmodels.indexWhere((obj) => obj.id == ent.fishInputId);

        feedmodels[index].isSelected = true;
      }
    }
    return feedmodels;
  }

  Future<List<CheckBoxList>> fetchCategs() async {
    List<CheckBoxList> list = [];
    FishCategoryDB fishCategoryDB = FishCategoryDB();

    await fishCategoryDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishCategory,
          id: value[i].fishCategoryId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fillUOMs() async {
    List<CheckBoxList> list = [];
    FishProductionUnitOfMeasureDB fishProductionUnitOfMeasureDB =
        FishProductionUnitOfMeasureDB();
    await fishProductionUnitOfMeasureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].unitOfMeasure,
          id: value[i].unitOfMeasureId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fillProdsystems() async {
    List<CheckBoxList> list = [];
    FishProductionTypeDB fishProductionTypeDB = FishProductionTypeDB();
    await fishProductionTypeDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishProductionType,
          id: value[i].productionTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchFish() async {
    List<CheckBoxList> list = [];
    FishTypeDB fishCategoryDB = FishTypeDB();

    await fishCategoryDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishType,
          id: value[i].fishTypeId,
          subcategoryid: value[i].fishCategoryId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> _fish(
      List<CheckBoxList> agemodelss, List<FarmerFish> agess) async {
    List<CheckBoxList> agemodels = agemodelss;
    List<FarmerFish> ages = agess;
    FishProductionTypeDB fishProductionTypeDB = FishProductionTypeDB();
    FishProductionType? fishProductionType;

    FishCategoryDB categoryDB = FishCategoryDB();
    FishCategory? category;
    if (ages.isNotEmpty) {
      for (var ent in ages) {
        int index = agemodels.indexWhere((obj) => obj.id == ent.fishTypeId);
        fishProductionType = await fishProductionTypeDB
            .fetchByProductionTypeId(ent.productionTypeId!);

        category = await categoryDB
            .fetchByFishCategoryId(agemodels[index].subcategoryid!);
        agemodels[index].isSelected = true;
        agemodels[index].var2 = fishProductionType.fishProductionType;
        agemodels[index].var1 = category.fishCategory;
        agemodels[index].var3 = ent.noOfFingerlings.toString();
      }
    }

    return agemodels;
  }

  List<CheckBoxList> _systems(
      List<CheckBoxList> feedmodelss, List<FarmerFishProductionSystem> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFishProductionSystem> feeds = feedss;

    if (feeds.isNotEmpty) {
      for (var ent in feeds) {
        int index =
            feedmodels.indexWhere((obj) => obj.id == ent.productionTypeId);

        feedmodels[index].isSelected = true;
        feedmodels[index].var1 = ent.noOfActiveUnits.toString();
        feedmodels[index].var2 = ent.activeArea.toString();
        feedmodels[index].var3 = ent.noOfInactiveUnits.toString();
        feedmodels[index].var4 = ent.inactiveArea.toString();
      }
    }

    return feedmodels;
  }

  List<CheckBoxList> _types(
      List<CheckBoxList> feedmodelss, List<FarmerFishCategory> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFishCategory> feeds = feedss;
    if (feeds.isNotEmpty) {
      for (var ent in feeds) {
        int index =
            feedmodels.indexWhere((obj) => obj.id == ent.fishCategoryId);

        feedmodels[index].isSelected = true;
      }
    }

    return feedmodels;
  }

  Future<List<FarmerFish>?> getFishes() async {
    int id = PrefUtils().getFarmId();
    FarmerFishDB farmerLivestockAgeGroupsDB = FarmerFishDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerFishCategory>?> getCategs() async {
    int id = PrefUtils().getFarmId();
    FarmerFishCategoryDB farmerLivestockAgeGroupsDB = FarmerFishCategoryDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerFishProductionSystem>?> getProdSyss() async {
    int id = PrefUtils().getFarmId();
    FarmerFishProductionSystemDB farmerLivestockAgeGroupsDB =
        FarmerFishProductionSystemDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<FishProductionLevel?> getProdlevelByid(int id) async {
    FishProductionLevelDB farmerLivestockAgeGroupsDB = FishProductionLevelDB();
    return await farmerLivestockAgeGroupsDB.fetchByProductionLevelId(id);
  }
}
