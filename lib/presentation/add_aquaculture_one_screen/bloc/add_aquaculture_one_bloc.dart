import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fish.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionuom.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/productionsystem.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_one_screen/models/add_aquaculture_one_model.dart';
part 'add_aquaculture_one_event.dart';
part 'add_aquaculture_one_state.dart';

/// A bloc that manages the state of a AddAquacultureOne according to the event that is dispatched to it.
class AddAquacultureOneBloc
    extends Bloc<AddAquacultureOneEvent, AddAquacultureOneState> {
  AddAquacultureOneBloc(AddAquacultureOneState initialState)
      : super(initialState) {
    on<AddAquacultureOneInitialEvent>(_onInitialize);
    on<SaveTapEvent>(_saveTap);
    on<NextTapEvent>(_nextTap);
    on<CheckOneEvent>(_checkcategs);
    on<CheckThreeEvent>(_checkfishes);
    on<CheckTwoEvent>(_checkProds);
    on<ClearEvent>(_clear);
  }

  _nextTap(
    NextTapEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();

    int selectedCount =
        state.aquatypes.where((enterprise) => enterprise.isSelected).length;
    int selectedCount2 =
        state.fish.where((enterprise) => enterprise.isSelected).length;
    int selectedCount3 =
        state.prodsyss.where((enterprise) => enterprise.isSelected).length;
    try {
      AQProgressDB aqProgressDB = AQProgressDB();
      if (state.addAquacultureOneModelObj!.aqProgress!.pageOne == 0 &&
          selectedCount != 0 &&
          selectedCount2 != 0 &&
          selectedCount3 != 0) {
        aqProgressDB
            .insert(AQProgress(
              farmId: farmid,
              pageOne: 1,
              pageTwo: 0,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
      } else if (selectedCount != 0 &&
          selectedCount2 != 0 &&
          selectedCount3 != 0) {
        aqProgressDB
            .update(AQProgress(
              farmId: farmid,
              pageOne: 1,
              pageTwo: state.addAquacultureOneModelObj!.aqProgress!.pageTwo,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
      } else {
        emit(state.copyWith(
          checkedA: selectedCount == 0,
          checkedF: selectedCount2 == 0,
          checkedP: selectedCount3 == 0,
        ));
        event.createFailed!.call();
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();

    int selectedCount =
        state.aquatypes.where((enterprise) => enterprise.isSelected).length;
    int selectedCount2 =
        state.fish.where((enterprise) => enterprise.isSelected).length;
    int selectedCount3 =
        state.prodsyss.where((enterprise) => enterprise.isSelected).length;
    try {
      AQProgressDB aqProgressDB = AQProgressDB();
      if (state.addAquacultureOneModelObj!.aqProgress!.pageOne == 0 &&
          selectedCount != 0 &&
          selectedCount2 != 0 &&
          selectedCount3 != 0) {
        aqProgressDB
            .insert(AQProgress(
              farmId: farmid,
              pageOne: 1,
              pageTwo: 0,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
      } else if (selectedCount != 0 &&
          selectedCount2 != 0 &&
          selectedCount3 != 0) {
        aqProgressDB
            .update(AQProgress(
              farmId: farmid,
              pageOne: 1,
              pageTwo: state.addAquacultureOneModelObj!.aqProgress!.pageTwo,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
      } else {
        emit(state.copyWith(
          checkedA: selectedCount == 0,
          checkedF: selectedCount2 == 0,
          checkedP: selectedCount3 == 0,
        ));
        event.createFailed!.call();
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _checkfishes(
    CheckThreeEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) async {
    List<FarmerFish>? fishes = await getFishes();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchFish();

    feedmodels = await _fish(feedmodels, fishes!);

    if (fishes.isNotEmpty) {
      emit(state.copyWith(fish: feedmodels, checkedF: false));
    } else {
      emit(state.copyWith(checkedF: true));
    }
  }

  _checkProds(
    CheckTwoEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) async {
    List<FarmerFishProductionSystem>? prods = await getProdSyss();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fillProdsystems();

    feedmodels = _systems(feedmodels, prods!);

    if (prods.isNotEmpty) {
      emit(state.copyWith(prodsyss: feedmodels, checkedP: false));
    } else {
      emit(state.copyWith(checkedP: true));
    }
  }

  _checkcategs(
    CheckOneEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) async {
    List<FarmerFishCategory>? fishes = await getCategs();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchFish();

    feedmodels = _types(feedmodels, fishes!);

    if (fishes.isNotEmpty) {
      emit(state.copyWith(aquatypes: feedmodels, checkedA: false));
    } else {
      emit(state.copyWith(checkedA: true));
    }
  }

  _clear(
    ClearEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) async {
    if (state.addAquacultureOneModelObj?.aqProgress!.pageOne == 0) {
      int id = PrefUtils().getFarmId();
      FarmerFishDB farmerFishDB = FarmerFishDB();
      FarmerFishCategoryDB farmerFishCategoryDB = FarmerFishCategoryDB();
      FarmerFishProductionSystemDB farmerFishProductionSystemDB =
          FarmerFishProductionSystemDB();

      farmerFishDB.delete(id).then((value) => print("Deleted: $value"));
      farmerFishCategoryDB.delete(id).then((value) => print("Deleted: $value"));
      farmerFishProductionSystemDB
          .delete(id)
          .then((value) => print("Deleted: $value"));
    }
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

  Future<AQProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    AQProgressDB pfProgressDB = AQProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  _onInitialize(
    AddAquacultureOneInitialEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) async {
    AQProgress pfProgress = await getProgress() ??
        AQProgress(
          farmId: PrefUtils().getFarmId(),
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? atypes = [];
    List<CheckBoxList>? fish = [];
    List<CheckBoxList>? prods = [];

    // FishCategoryDB fishCategoryDB = FishCategoryDB();
    // FishTypeDB fishTypeDB = FishTypeDB();
    // FishProductionTypeDB fishProductionTypeDB = FishProductionTypeDB();

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
        fish: fish,
        aquatypes: atypes,
        prodsyss: prods,
        addAquacultureOneModelObj: state.addAquacultureOneModelObj?.copyWith(
          aqProgress: pfProgress,
        )));
  }
}
