import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/agegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/beehivetype.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/feed.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockfeed.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';
import '/core/app_export.dart';
import '../models/chipviewayrshi_item_model.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_one_screen/models/add_reared_livestock_one_model.dart';
part 'add_reared_livestock_one_event.dart';
part 'add_reared_livestock_one_state.dart';

/// A bloc that manages the state of a AddRearedLivestockOne according to the event that is dispatched to it.
class AddRearedLivestockOneBloc
    extends Bloc<AddRearedLivestockOneEvent, AddRearedLivestockOneState> {
  AddRearedLivestockOneBloc(AddRearedLivestockOneState initialState)
      : super(initialState) {
    on<AddRearedLivestockOneInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<ChangeDropDownEventLivestock>(_changeDropDownLiveStock);
    on<ChangeDropDownEventSubCategory>(_changeDropDownSubCategory);
    on<ChangeDropDownEventCategory>(_changeDropDownCategory);
    on<SearchEventLivestock>(_searchLivestock);
    on<ReturnCommonEventLivestock>(_restoreCommonLivestock);
    on<SaveTapEvent>(_saveTap);
    on<AddEditAgeEvent>(_addeditages);
    on<AddEditFeedEvent>(_addeditfeeds);
    on<AddEditBeeEvent>(_addeditbees);

    on<CheckAgeEvent>(_checkages);
    on<CheckFeedEvent>(_checkfeeds);
    on<CheckBeeEvent>(_checkbees);

    on<ChangeDropDown1Event>(_changeDropDownProd);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    // List<ChipviewayrshiItemModel> newList = List<ChipviewayrshiItemModel>.from(
    //     state.addRearedLivestockOneModelObj!.chipviewayrshiItemList);
    // newList[event.index] = newList[event.index].copyWith(
    //   isSelected: event.isSelected,
    // );
    List<SelectionPopupModel> subcategories =
        await fillSubCategory(event.model!.categoryid!);
    List<SelectionPopupModel> livestock =
        await fillLivestock(event.model!.subcategoryid!);

    final updatedState = state.copyWith(
        selectedCategory: SelectionPopupModel(
          title: event.model?.livestockCat ?? "",
          id: event.model?.categoryid,
        ),
        selectedSubCategory: SelectionPopupModel(
          title: event.model?.livestockSubCat ?? "",
          id: event.model?.subcategoryid,
        ),
        selectedLivestock: SelectionPopupModel(
          title: event.model?.ayrshi ?? "",
          id: event.model?.livestockid,
        ),
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
          selectedLivestock: null,
          selectedCategory: null,
          selectedSubCategory: null,
          subcategories: subcategories,
          livestock: livestock,
          search: false,
          selectedDropDownValue1:
              state.addRearedLivestockOneModelObj?.selectedDropDownValue1,
        )
        // addRearedLivestockOneModelObj: state.addRearedLivestockOneModelObj
        //     ?.copyWith(chipviewayrshiItemList: newList),
        );
    emit(updatedState);

    if (state.searchController?.value != null) {
      emit(state.copyWith(searchController: TextEditingController()));
    }
    SelectionPopupModel? categorymodel =
        state.addRearedLivestockOneModelObj?.categories.firstWhere(
      (model) => model.id == event.model!.categoryid,
    );
    SelectionPopupModel? subcategorymodel =
        state.addRearedLivestockOneModelObj?.subcategories.firstWhere(
      (model) => model.id == event.model!.subcategoryid,
    );

    SelectionPopupModel? livestockmodel =
        state.addRearedLivestockOneModelObj?.livestock.firstWhere(
      (model) => model.id == event.model!.livestockid,
    );
    emit(state.copyWith(
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
      selectedCategory: categorymodel,
      selectedSubCategory: subcategorymodel,
      selectedLivestock: livestockmodel,
      selectedDropDownValue1:
          state.addRearedLivestockOneModelObj?.selectedDropDownValue1,
    )));
  }

  _changeDropDownLiveStock(
    ChangeDropDownEventLivestock event,
    Emitter<AddRearedLivestockOneState> emit,
  ) {
    emit(state.copyWith(
      selectedLivestock: event.value,
      addRearedLivestockOneModelObj:
          state.addRearedLivestockOneModelObj?.copyWith(
        selectedLivestock: event.value,
        selectedSubCategory:
            state.addRearedLivestockOneModelObj?.selectedSubCategory,
        selectedCategory: state.addRearedLivestockOneModelObj?.selectedCategory,
        selectedDropDownValue1:
            state.addRearedLivestockOneModelObj?.selectedDropDownValue1,
      ),
    ));
  }

  _changeDropDownCategory(
    ChangeDropDownEventCategory event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedCategory: event.value,
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
          selectedCategory: event.value,
          selectedSubCategory: null,
          selectedLivestock: null,
          selectedDropDownValue1:
              state.addRearedLivestockOneModelObj?.selectedDropDownValue1,
          subcategories: await fillSubCategory(
            event.value.id!,
          ),
        ),
      ),
    );
  }

  _changeDropDownSubCategory(
    ChangeDropDownEventSubCategory event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    emit(state.copyWith(
      selectedSubCategory: event.value,
      addRearedLivestockOneModelObj:
          state.addRearedLivestockOneModelObj?.copyWith(
        selectedSubCategory: event.value,
        selectedLivestock: null,
        selectedCategory: state.addRearedLivestockOneModelObj?.selectedCategory,
        selectedDropDownValue1:
            state.addRearedLivestockOneModelObj?.selectedDropDownValue1,
        livestock: await fillLivestock(
          event.value.id!,
        ),
      ),
    ));
  }

  _changeDropDownProd(
    ChangeDropDown1Event event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    emit(state.copyWith(
      selectedLivestock: event.value,
      addRearedLivestockOneModelObj:
          state.addRearedLivestockOneModelObj?.copyWith(
        selectedLivestock:
            state.addRearedLivestockOneModelObj?.selectedLivestock,
        selectedSubCategory:
            state.addRearedLivestockOneModelObj?.selectedSubCategory,
        selectedCategory: state.addRearedLivestockOneModelObj?.selectedCategory,
        selectedDropDownValue1: event.value,
      ),
    ));
  }

  _searchLivestock(
    SearchEventLivestock event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    emit(state.copyWith(
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
      selectedCategory: state.addRearedLivestockOneModelObj?.selectedCategory,
      selectedSubCategory:
          state.addRearedLivestockOneModelObj?.selectedSubCategory,
      selectedLivestock: state.addRearedLivestockOneModelObj?.selectedLivestock,
      selectedDropDownValue1:
          state.addRearedLivestockOneModelObj?.selectedDropDownValue1,
      search: true,
      searchResults: await searchLivestock(event.value),
    )));
  }

  _restoreCommonLivestock(
    ReturnCommonEventLivestock event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    emit(state.copyWith(
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
      selectedCategory: state.addRearedLivestockOneModelObj?.selectedCategory,
      selectedSubCategory:
          state.addRearedLivestockOneModelObj?.selectedSubCategory,
      selectedLivestock: state.addRearedLivestockOneModelObj?.selectedLivestock,
      selectedDropDownValue1:
          state.addRearedLivestockOneModelObj?.selectedDropDownValue1,
      search: false,
    )));
  }

  List<ChipviewayrshiItemModel> fillChipviewayrshiItemList() {
    return List.generate(4, (index) => ChipviewayrshiItemModel());
  }

  Future<List<ChipviewayrshiItemModel>> fillCommonLivestock() async {
    List<ChipviewayrshiItemModel> list = [];
    state.livestockDB = LivestockDB();
    await state.livestockDB?.fetchAllCommon().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewayrshiItemModel(
          livestockid: value[i].livestockId,
          subcategoryid: value[i].livestockSubCatId,
          categoryid: value[i].livestockCatId,
          ayrshi: value[i].livestock,
          livestockCat: value[i].livestockCat,
          livestockSubCat: value[i].livestockSubCat,
        ));
      }
    });
    return list;
  }

  Future<List<ChipviewayrshiItemModel>> searchLivestock(String value) async {
    List<ChipviewayrshiItemModel> list = [];
    state.livestockDB = LivestockDB();
    await state.livestockDB?.searchLivestock(value).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewayrshiItemModel(
          livestockid: value[i].livestockId,
          subcategoryid: value[i].livestockSubCatId,
          categoryid: value[i].livestockCatId,
          ayrshi: value[i].livestock,
          livestockCat: value[i].livestockCat,
          livestockSubCat: value[i].livestockSubCat,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fillCategories() async {
    List<SelectionPopupModel> list = [];
    state.categoryDB = LivestockCategoryDB();
    await state.categoryDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].livestockCategory,
          id: value[i].livestockCatId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fillLivestock(int subCatId) async {
    List<SelectionPopupModel> list = [];
    state.livestockDB = LivestockDB();
    await state.livestockDB?.fetchAllWhereSubCatId(subCatId).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].livestock,
          id: value[i].livestockId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fillSubCategory(int catId) async {
    List<SelectionPopupModel> list = [];
    state.subcategoryDB = LivestockSubcategoryDB();
    await state.subcategoryDB?.fetchAllWhereCatID(catId).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].livestockSubcategory,
          id: value[i].livestockSubCatId,
        ));
      }
    });
    return list;
  }

  _checkfeeds(
    CheckFeedEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    String feeds = PrefUtils().getFeeds();
    List<FeedsModel>? feedmodels = [];
    if (feeds != "0") {
      List<dynamic> decageGroupMapList = jsonDecode(feeds);

      // Create a list of AgeGroupModel objects from the list of dynamic objects
      List<FeedsModel> feedmodels =
          decageGroupMapList.map((json) => FeedsModel.fromJson(json)).toList();

      emit(state.copyWith(feedsdlist: feedmodels, checkedF: false));
    } else {
      emit(state.copyWith(checkedF: true));
    }
  }

  _checkbees(
    CheckBeeEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    String feeds = PrefUtils().getBee();
    if (feeds != "0") {
      List<dynamic> decageGroupMapList = jsonDecode(feeds);

      // Create a list of AgeGroupModel objects from the list of dynamic objects
      List<FeedsModel> feedmodels =
          decageGroupMapList.map((json) => FeedsModel.fromJson(json)).toList();

      emit(state.copyWith(
        bees: feedmodels,
      ));
    }
  }

  _checkages(
    CheckAgeEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    String ages = PrefUtils().getAgeGroups();
    List<AgeGroupModel>? agemodels = [];
    if (ages != "0") {
      List<dynamic> decageGroupMapList = jsonDecode(ages);

      // Create a list of AgeGroupModel objects from the list of dynamic objects
      agemodels = decageGroupMapList
          .map((json) => AgeGroupModel.fromJson(json))
          .toList();
      emit(state.copyWith(
        ageGroupMapList: agemodels,
      ));
    }
  }

  _addeditfeeds(
    AddEditFeedEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) {
    if (state.feedsdlist!.isNotEmpty) {
      List<Map<String, dynamic>> ageGroupMapList =
          state.feedsdlist!.map((ageGroup) => ageGroup.toJson()).toList();

      // Convert the list of maps to a JSON string
      String jsonString = jsonEncode(ageGroupMapList);
      PrefUtils().setFeeds(jsonString);
    } else {
      PrefUtils().setFeeds("0");
    }
  }

  _addeditbees(
    AddEditBeeEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) {
    if (state.bees!.isNotEmpty) {
      List<Map<String, dynamic>> ageGroupMapList =
          state.bees!.map((ageGroup) => ageGroup.toJson()).toList();

      // Convert the list of maps to a JSON string
      String jsonString = jsonEncode(ageGroupMapList);
      PrefUtils().setBee(jsonString);
    } else {
      PrefUtils().setBee("0");
    }
  }

  _addeditages(
    AddEditAgeEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) {
    if (state.ageGroupMapList!.isNotEmpty) {
      List<Map<String, dynamic>> ageGroupMapList =
          state.ageGroupMapList!.map((ageGroup) => ageGroup.toJson()).toList();

      // Convert the list of maps to a JSON string
      String jsonString = jsonEncode(ageGroupMapList);
      PrefUtils().setAgeGroups(jsonString);
    } else {
      PrefUtils().setAgeGroups("0");
    }
  }

  Future<List<SelectionPopupModel>> fillProduction() async {
    List<SelectionPopupModel> list = [];
    LivestockFarmingSystemDB livestockFarmingSystemDB =
        LivestockFarmingSystemDB();
    await livestockFarmingSystemDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].livestockFarmsystem,
          id: value[i].livestockFarmsystemId,
        ));
      }
    });
    return list;
  }

  List<AgeGroupModel> _ages(
      List<AgeGroupModel> agemodelss, List<FarmerLivestockAgeGroup> agess) {
    List<AgeGroupModel> agemodels = agemodelss;
    List<FarmerLivestockAgeGroup> ages = agess;

    for (var ent in ages) {
      int index =
          agemodels.indexWhere((obj) => obj.ageGroupId == ent.ageGroupId);

      agemodels[index].isSelected = true;
      agemodels[index].males = ent.noOfLivestockMale.toString();
      agemodels[index].females = ent.noOfLivestockFemale.toString();
    }

    return agemodels;
  }

  List<FeedsModel> _feeds(
      List<FeedsModel> feedmodelss, List<FarmerLivestockFeed> feedss) {
    List<FeedsModel> feedmodels = feedmodelss;
    List<FarmerLivestockFeed> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.feedTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<FeedsModel> _bees(
      List<FeedsModel> feedmodelss, List<FarmerLivestockBeehiveType> feedss) {
    List<FeedsModel> feedmodels = feedmodelss;
    List<FarmerLivestockBeehiveType> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.beehivesTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    FarmerLivestockDB farmDB = FarmerLivestockDB();
    try {
      if (state.addRearedLivestockOneModelObj!.lsProgress!.pageOne == 0 &&
          state.feedsdlist!.isNotEmpty) {
        farmDB
            .insertNonNulls(FarmerLivestock(
          farmerFarmId: PrefUtils().getFarmId(),
          farmerId: PrefUtils().getFarmerId(),
          dateCreated: DateTime.now(),
          noOfBeehives:
              int.parse(state.hives?.text == "" ? "0" : state.hives!.text),
          createdBy: userId,
          farmerLivestockId: 0,
        ))
            .then((value) async {
          if (value > 0) {
            farmDB.update(FarmerLivestock(
              farmerFarmId: PrefUtils().getFarmId(),
              farmerId: PrefUtils().getFarmerId(),
              dateCreated: DateTime.now(),
              createdBy: userId,
              farmerLivestockId: value,
              noOfBeehives:
                  int.parse(state.hives?.text == "" ? "0" : state.hives!.text),
              livestockFarmsystemCatId: state
                  .addRearedLivestockOneModelObj!.selectedDropDownValue1!.id,
              livestockId:
                  state.addRearedLivestockOneModelObj!.selectedLivestock!.id,
            ));

            PrefUtils().setLivestockId(value);

            String agegroups = PrefUtils().getAgeGroups();
            if (agegroups != "0") {
              List<dynamic> decageGroupMapList = jsonDecode(agegroups);

              // Create a list of AgeGroupModel objects from the list of dynamic objects
              List<AgeGroupModel> ageGroupList = decageGroupMapList
                  .map((json) => AgeGroupModel.fromJson(json))
                  .toList();

              FarmerLivestockAgeGroupsDB farmerLivestockAgeGroupsDB =
                  FarmerLivestockAgeGroupsDB();
              List<FarmerLivestockAgeGroup> ents = [];

              for (var ent in ageGroupList) {
                if (ent.isSelected) {
                  ents.add(FarmerLivestockAgeGroup(
                    farmerLivestockAgegroupId: 0,
                    farmerLivestockId: value,
                    ageGroupId: ent.ageGroupId!,
                    noOfLivestockMale: int.parse(ent.males!),
                    noOfLivestockFemale: int.parse(ent.females!),
                    createdBy: userId,
                    dateCreated: DateTime.now(),
                  ));
                }
              }

              await farmerLivestockAgeGroupsDB
                  .insertAgeGroups(ents)
                  .then((value) => print("inserted $value"));
            }

            String feeds = PrefUtils().getFeeds();
            if (feeds != "0") {
              List<dynamic> feedsdlist = jsonDecode(feeds);

              List<FeedsModel> feedslist =
                  feedsdlist.map((json) => FeedsModel.fromJson(json)).toList();

              FarmerLivestockFeedsDB farmerLivestockFeedsDB =
                  FarmerLivestockFeedsDB();

              List<FarmerLivestockFeed> feedlist = [];

              for (var ent in feedslist) {
                if (ent.isSelected) {
                  feedlist.add(FarmerLivestockFeed(
                    farmerLivestockId: value,
                    createdBy: userId,
                    dateCreated: DateTime.now(),
                    farmerLivestockFeedId: 0,
                    feedQuantity: 0,
                    feedTypeId: ent.id!,
                  ));
                }
              }

              await farmerLivestockFeedsDB
                  .insertFeeds(feedlist)
                  .then((value) => print("inserted $value"));
            }
            String bees = PrefUtils().getBee();

            if (bees != "0") {
              List<dynamic> beelist = jsonDecode(bees);

              List<FeedsModel> beeslist =
                  beelist.map((json) => FeedsModel.fromJson(json)).toList();

              FarmerLivestockBeehiveTypeDB farmerLivestockBeehiveTypeDB =
                  FarmerLivestockBeehiveTypeDB();

              List<FarmerLivestockBeehiveType> nbeelist = [];

              for (var ent in beeslist) {
                if (ent.isSelected) {
                  nbeelist.add(FarmerLivestockBeehiveType(
                      farmerLivestockId: value,
                      createdBy: userId,
                      dateCreated: DateTime.now(),
                      beehivesTypeId: ent.id!,
                      beehivesFarmerId: 0));
                }
              }

              await farmerLivestockBeehiveTypeDB
                  .insertBeehiveTypes(nbeelist)
                  .then((value) => print("inserted $value"));
            }
            LSProgressDB lsProgressDB = LSProgressDB();
            if (state.addRearedLivestockOneModelObj!.lsProgress!.pageOne == 0) {
              lsProgressDB
                  .insert(LSProgress(
                    livestockId: value,
                    pageOne: 1,
                    pageTwo: 0,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            } else {
              lsProgressDB
                  .update(LSProgress(
                    livestockId: value,
                    pageOne: 1,
                    pageTwo: state
                        .addRearedLivestockOneModelObj!.lsProgress!.pageTwo,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      }
      int farmerLivestockId = PrefUtils().getLivestockId();

      if (state.addRearedLivestockOneModelObj!.lsProgress!.pageOne == 1 &&
          state.feedsdlist!.isNotEmpty) {
        if (farmerLivestockId != 0) {
          farmDB.update(FarmerLivestock(
            farmerFarmId: PrefUtils().getFarmId(),
            farmerId: PrefUtils().getFarmerId(),
            dateCreated: DateTime.now(),
            createdBy: userId,
            farmerLivestockId: PrefUtils().getLivestockId(),
            noOfBeehives:
                int.parse(state.hives?.text == "" ? "0" : state.hives!.text),
            livestockFarmsystemCatId:
                state.addRearedLivestockOneModelObj!.selectedDropDownValue1!.id,
            livestockId:
                state.addRearedLivestockOneModelObj!.selectedLivestock!.id,
          ));

          String agegroups = PrefUtils().getAgeGroups();
          if (agegroups != "0") {
            List<dynamic> decageGroupMapList = jsonDecode(agegroups);

            // Create a list of AgeGroupModel objects from the list of dynamic objects
            List<AgeGroupModel> ageGroupList = decageGroupMapList
                .map((json) => AgeGroupModel.fromJson(json))
                .toList();

            FarmerLivestockAgeGroupsDB farmerLivestockAgeGroupsDB =
                FarmerLivestockAgeGroupsDB();
            List<FarmerLivestockAgeGroup> ents = [];

            for (var ent in ageGroupList) {
              if (ent.isSelected) {
                ents.add(FarmerLivestockAgeGroup(
                  farmerLivestockAgegroupId: 0,
                  farmerLivestockId: PrefUtils().getLivestockId(),
                  ageGroupId: ent.ageGroupId!,
                  noOfLivestockMale: int.parse(ent.males!),
                  noOfLivestockFemale: int.parse(ent.females!),
                  createdBy: userId,
                  dateCreated: DateTime.now(),
                ));
              }
            }
            await farmerLivestockAgeGroupsDB
                .delete(farmerLivestockId)
                .then((value) => print("deleted $value"));
            await farmerLivestockAgeGroupsDB
                .insertAgeGroups(ents)
                .then((value) => print("inserted $value"));
          }

          String feeds = PrefUtils().getFeeds();
          if (feeds != "0") {
            List<dynamic> feedsdlist = jsonDecode(feeds);

            List<FeedsModel> feedslist =
                feedsdlist.map((json) => FeedsModel.fromJson(json)).toList();

            FarmerLivestockFeedsDB farmerLivestockFeedsDB =
                FarmerLivestockFeedsDB();

            List<FarmerLivestockFeed> feedlist = [];

            for (var ent in feedslist) {
              if (ent.isSelected) {
                feedlist.add(FarmerLivestockFeed(
                  farmerLivestockId: PrefUtils().getLivestockId(),
                  createdBy: userId,
                  dateCreated: DateTime.now(),
                  farmerLivestockFeedId: 0,
                  feedQuantity: 0,
                  feedTypeId: ent.id!,
                ));
              }
            }
            await farmerLivestockFeedsDB
                .delete(farmerLivestockId)
                .then((value) => print("deleted $value"));
            await farmerLivestockFeedsDB
                .insertFeeds(feedlist)
                .then((value) => print("inserted $value"));
          }
          String bees = PrefUtils().getBee();

          if (bees != "0") {
            List<dynamic> beelist = jsonDecode(bees);

            List<FeedsModel> beeslist =
                beelist.map((json) => FeedsModel.fromJson(json)).toList();

            FarmerLivestockBeehiveTypeDB farmerLivestockBeehiveTypeDB =
                FarmerLivestockBeehiveTypeDB();

            List<FarmerLivestockBeehiveType> nbeelist = [];

            for (var ent in beeslist) {
              if (ent.isSelected) {
                nbeelist.add(FarmerLivestockBeehiveType(
                    farmerLivestockId: farmerLivestockId,
                    createdBy: userId,
                    dateCreated: DateTime.now(),
                    beehivesTypeId: ent.id!,
                    beehivesFarmerId: 0));
              }
            }

            await farmerLivestockBeehiveTypeDB
                .insertBeehiveTypes(nbeelist)
                .then((value) => print("inserted $value"));
          }
          event.createSuccessful!.call();
        }
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FeedsModel>> fetchFeeds() async {
    List<FeedsModel> list = [];
    LivestockFeedTypeDB livestockFeedTypeDB = LivestockFeedTypeDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockFeedTypeDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(FeedsModel(
          title: value[i].feedType,
          id: value[i].feedTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<FeedsModel>> fetchBees() async {
    List<FeedsModel> list = [];
    LivestockBeehiveTypeDB livestockFeedTypeDB = LivestockBeehiveTypeDB();

    await livestockFeedTypeDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(FeedsModel(
          title: value[i].beehiveType,
          id: value[i].beehiveTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<AgeGroupModel>> fetchAgeGroups() async {
    List<AgeGroupModel> list = [];
    LivestockAgeGroupDB livestockAgeGroupDB = LivestockAgeGroupDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(AgeGroupModel(
          title: value[i].ageGroup,
          ageGroupId: value[i].ageGroupId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
        ));
      }
    });
    return list;
  }

  Future<FarmerLivestock?> getLiv() async {
    int livid = PrefUtils().getLivestockId();
    FarmerLivestockDB farmDB = FarmerLivestockDB();
    return await farmDB.fetchById(livid);
  }

  Future<List<FarmerLivestockAgeGroup>?> getAges() async {
    int livid = PrefUtils().getLivestockId();
    FarmerLivestockAgeGroupsDB farmerLivestockAgeGroupsDB =
        FarmerLivestockAgeGroupsDB();
    return await farmerLivestockAgeGroupsDB.fetchByLive(livid);
  }

  Future<List<FarmerLivestockFeed>?> getFeeds() async {
    int livid = PrefUtils().getLivestockId();
    FarmerLivestockFeedsDB farmerLivestockFeedsDB = FarmerLivestockFeedsDB();
    return await farmerLivestockFeedsDB.fetchAllByLivestock(livid);
  }

  Future<List<FarmerLivestockBeehiveType>?> getBees() async {
    int livid = PrefUtils().getLivestockId();
    FarmerLivestockBeehiveTypeDB farmerLivestockFeedsDB =
        FarmerLivestockBeehiveTypeDB();
    return await farmerLivestockFeedsDB.fetchAllByLivestock(livid);
  }

  Future<LSProgress?> getProgress() async {
    int id = PrefUtils().getLivestockId();
    LSProgressDB lsProgressDB = LSProgressDB();
    return await lsProgressDB.fetchByLivestock(id);
  }

  _onInitialize(
    AddRearedLivestockOneInitialEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    FarmerLivestock livestock = await getLiv() ??
        FarmerLivestock(
          farmerId: 0,
          farmerFarmId: 0,
          farmerLivestockId: 0,
          livestockId: 0,
        );
    LSProgress pfProgress = await getProgress() ??
        LSProgress(
          livestockId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    LivestockDB livestockDB = LivestockDB();

    List<AgeGroupModel>? ageGroupList = [];
    List<FeedsModel>? feedslist = [];
    List<FeedsModel>? beeslist = [];
    TextEditingController at = TextEditingController();
    List<SelectionPopupModel> livestockmodels = [];
    SelectionPopupModel? selectedlivestock;
    List<SelectionPopupModel> categ = await fillCategories();
    SelectionPopupModel? selectedcateg;
    List<SelectionPopupModel> subcateg = [];
    SelectionPopupModel? selectedsubcateg;
    List<SelectionPopupModel> prod = await fillProduction();
    SelectionPopupModel? selectedprod;

    if (pfProgress.pageOne == 1 && livestock.farmerLivestockId != 0) {
      Livestock? lives =
          await livestockDB.fetchByLivestockId(livestock.livestockId!);
      at = TextEditingController(text: livestock.noOfBeehives.toString());

      subcateg = await fillSubCategory(lives!.livestockCatId!);
      livestockmodels = await fillLivestock(lives!.livestockSubCatId);

      selectedcateg = categ.firstWhere(
        (model) => model.id == lives.livestockCatId,
      );

      selectedsubcateg = subcateg.firstWhere(
        (model) => model.id == lives.livestockSubCatId,
      );

      selectedlivestock = livestockmodels.firstWhere(
        (model) => model.id == lives.livestockId,
      );

      selectedprod = prod.firstWhere(
        (model) => model.id == livestock.livestockFarmsystemCatId,
      );
      List<FarmerLivestockAgeGroup>? ages = await getAges();

      List<FarmerLivestockFeed>? feeds = await getFeeds();

      List<FarmerLivestockBeehiveType>? bees = await getBees();

      ageGroupList = await fetchAgeGroups();
      feedslist = await fetchFeeds();
      beeslist = await fetchBees();
      feedslist = _feeds(feedslist, feeds!);
      ageGroupList = _ages(ageGroupList, ages!);
      if (bees != null) {
        beeslist = _bees(beeslist, bees);
      }
    }
    emit(
      state.copyWith(
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
          chipviewayrshiItemList:
              await fillCommonLivestock(), //fillChipviewayrshiItemList(),
          categories: categ,
          dropdownItemList1: prod,
          selectedCategory: selectedcateg,
          selectedLivestock: selectedlivestock,
          selectedSubCategory: selectedsubcateg,
          selectedDropDownValue1: selectedprod,
          subcategories: subcateg,
          livestock: livestockmodels,
          livestockF: livestock,
          lsProgress: pfProgress,
        ),
        searchController: TextEditingController(),
        categoryvalueController: TextEditingController(),
        subcategoryvaluController: TextEditingController(),
        hives: at,
        feedsdlist: feedslist,
        ageGroupMapList: ageGroupList,
        bees: beeslist,
      ),
    );
  }
}
