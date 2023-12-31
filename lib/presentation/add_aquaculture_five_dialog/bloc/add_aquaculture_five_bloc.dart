import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fish.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fish.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/models/chipvieway_item_model.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/models/add_aquaculture_five_model.dart';
part 'add_aquaculture_five_event.dart';
part 'add_aquaculture_five_state.dart';

/// A bloc that manages the state of a AddAquacultureFive according to the event that is dispatched to it.
class AddAquacultureFiveBloc
    extends Bloc<AddAquacultureFiveEvent, AddAquacultureFiveState> {
  AddAquacultureFiveBloc(AddAquacultureFiveState initialState)
      : super(initialState) {
    on<AddAquacultureFiveInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<UpdateChipViewEvent>(_updateChipView);
    on<SearchEventFish>(_searchFish);
    on<ReturnCommonEvent>(_restoreCommon);
    on<AddCBs>(_addAgeGroups);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddAquacultureFiveState> emit,
  ) async {
    // List<ChipviewayrshiItemModel> newList = List<ChipviewayrshiItemModel>.from(
    //     state.addRearedLivestockOneModelObj!.chipviewayrshiItemList);
    // newList[event.index] = newList[event.index].copyWith(
    //   isSelected: event.isSelected,
    // );

    List<SelectionPopupModel> fish = await fetchFish(event.model!.categoryid!);

    final updatedState = state.copyWith(
        selectedDropDownValue: SelectionPopupModel(
          title: event.model?.fishCat ?? "",
          id: event.model?.categoryid,
        ),
        selectedDropDownValue1: SelectionPopupModel(
          title: event.model?.fish ?? "",
          id: event.model?.fishid,
        ),
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
          selectedFish: null,
          selectedCategory: null,
          dropdownItemList1: fish,
          search: false,
          selectedDropDownValue2:
              state.addAquacultureFiveModelObj?.selectedDropDownValue2,
        )
        // addRearedLivestockOneModelObj: state.addRearedLivestockOneModelObj
        //     ?.copyWith(chipviewayrshiItemList: newList),
        );
    emit(updatedState);

    if (state.searchController?.value != null) {
      emit(state.copyWith(searchController: TextEditingController()));
    }
    SelectionPopupModel? categorymodel =
        state.addAquacultureFiveModelObj?.dropdownItemList.firstWhere(
      (model) => model.id == event.model!.categoryid,
    );

    SelectionPopupModel? fishmodel =
        state.addAquacultureFiveModelObj?.dropdownItemList1.firstWhere(
      (model) => model.id == event.model!.fishid,
    );
    emit(state.copyWith(
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
      selectedCategory: categorymodel,
      selectedFish: fishmodel,
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddAquacultureFiveState> emit,
  ) async {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
          selectedCategory: event.value,
          selectedFish: null,
          selectedDropDownValue2:
              state.addAquacultureFiveModelObj?.selectedDropDownValue2,
          dropdownItemList1: await fetchFish(event.value.id!),
        )));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddAquacultureFiveState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue1: event.value,
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
          selectedCategory: state.addAquacultureFiveModelObj?.selectedCategory,
          selectedFish: event.value,
          selectedDropDownValue2:
              state.addAquacultureFiveModelObj?.selectedDropDownValue2,
        )));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddAquacultureFiveState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue2: event.value,
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
          selectedCategory: state.addAquacultureFiveModelObj?.selectedCategory,
          selectedDropDownValue2: event.value,
          selectedFish: state.addAquacultureFiveModelObj?.selectedFish,
        )));
  }

  _searchFish(
    SearchEventFish event,
    Emitter<AddAquacultureFiveState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
      selectedCategory: state.addAquacultureFiveModelObj?.selectedCategory,
      selectedFish: state.addAquacultureFiveModelObj?.selectedFish,
      search: true,
      searchResults: await searchFish(event.value),
    )));
  }

  _restoreCommon(
    ReturnCommonEvent event,
    Emitter<AddAquacultureFiveState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
      selectedCategory: state.addAquacultureFiveModelObj?.selectedCategory,
      selectedFish: state.addAquacultureFiveModelObj?.selectedFish,
      search: false,
    )));
  }

  Future<List<ChipviewayItemModel>> searchFish(String value) async {
    List<ChipviewayItemModel> list = [];
    FishTypeDB fishTypeDB = FishTypeDB();
    await fishTypeDB.searchFish(value).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewayItemModel(
          fishid: value[i].fishTypeId,
          categoryid: value[i].fishCategoryId,
          fish: value[i].fishType,
          fishCat: value[i].fishCategory,
        ));
      }
    });
    return list;
  }

  Future<List<ChipviewayItemModel>> commonFish() async {
    List<ChipviewayItemModel> list = [];
    FishTypeDB fishTypeDB = FishTypeDB();
    await fishTypeDB.fetchCommonFish().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewayItemModel(
          fishid: value[i].fishTypeId,
          categoryid: value[i].fishCategoryId,
          fish: value[i].fishType,
          fishCat: value[i].fishCategory,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchFishCategories() async {
    List<SelectionPopupModel> list = [];
    FishCategoryDB fishCategoryDB = FishCategoryDB();

    await fishCategoryDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].fishCategory,
          id: value[i].fishCategoryId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchFish(int id) async {
    List<SelectionPopupModel> list = [];
    FishTypeDB fishCategoryDB = FishTypeDB();

    await fishCategoryDB.fetchByCategoryId(id).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].fishType,
          id: value[i].fishTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fillProdsystems() async {
    List<SelectionPopupModel> list = [];
    FishProductionTypeDB fishProductionTypeDB = FishProductionTypeDB();
    await fishProductionTypeDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].fishProductionType,
          id: value[i].productionTypeId,
        ));
      }
    });
    return list;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddAquacultureFiveState> emit,
  ) async {
    FarmerFishDB farmerFishDB = FarmerFishDB();
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();

    try {
      if (PrefUtils().getEditId() == 0) {
        await farmerFishDB.create(FarmerFish(
          farmerFishId: 0,
          farmerId: farmerid,
          farmerFarmId: farmid,
          productionTypeId:
              state.addAquacultureFiveModelObj!.selectedDropDownValue2!.id!,
          fishTypeId: state.addAquacultureFiveModelObj!.selectedFish!.id!,
          noOfFingerlings: int.parse(state.numbervalueoneController!.text),
          dateCreated: DateTime.now(),
          createdBy: userId,
          other: state.other?.text == "" ? "Not Applied" : state.other!.text,
        ));
        event.createSuccessful?.call();
      } else {
        await farmerFishDB.update(FarmerFish(
          farmerFishId: PrefUtils().getEditId(),
          farmerId: farmerid,
          farmerFarmId: farmid,
          productionTypeId:
              state.addAquacultureFiveModelObj!.selectedDropDownValue2!.id!,
          fishTypeId: state.addAquacultureFiveModelObj!.selectedFish!.id!,
          noOfFingerlings: int.parse(state.numbervalueoneController!.text),
          dateCreated: DateTime.now(),
          createdBy: userId,
          other: state.other?.text == "" ? "Not Applied" : state.other!.text,
        ));
        event.createSuccessful?.call();
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<FarmerFish?> getFishes(int id) async {
    FarmerFishDB farmerLivestockAgeGroupsDB = FarmerFishDB();
    return await farmerLivestockAgeGroupsDB.fetchById(id);
  }

  Future<CheckBoxList?> _fish(FarmerFish agess) async {
    FishProductionTypeDB fishProductionTypeDB = FishProductionTypeDB();
    FishProductionType? fishProductionType;

    FishCategoryDB categoryDB = FishCategoryDB();
    FishCategory? category;

    FishTypeDB fishTypeDB = FishTypeDB();
    FishType? fish;

    fish = await fishTypeDB.fetchByFishTypeId(agess.fishTypeId);
    fishProductionType = await fishProductionTypeDB
        .fetchByProductionTypeId(agess.productionTypeId!);

    category = await categoryDB.fetchByFishCategoryId(fish!.fishCategoryId);
    // agemodels?.id = agess.fishTypeId;
    // agemodels?.isSelected = true;
    // agemodels?.var2 = fishProductionType.productionTypeId.toString();
    // agemodels?.var1 = category.fishCategoryId.toString();
    // agemodels?.var3 = agess.noOfFingerlings.toString();

    return CheckBoxList(
      id: agess.fishTypeId,
      var1: category.fishCategoryId.toString(),
      var2: fishProductionType.productionTypeId.toString(),
      var3: agess.noOfFingerlings.toString(),
    );
  }

  _onInitialize(
    AddAquacultureFiveInitialEvent event,
    Emitter<AddAquacultureFiveState> emit,
  ) async {
    int edit = PrefUtils().getEditId();
    CheckBoxList? data;
    List<SelectionPopupModel> d1 = await fetchFishCategories();
    List<SelectionPopupModel>? d2;
    List<SelectionPopupModel> d3 = await fillProdsystems();

    SelectionPopupModel? aa;
    TextEditingController a = TextEditingController();
    TextEditingController other = TextEditingController();
    SelectionPopupModel? b;
    SelectionPopupModel? c;

    if (edit != 0) {
      FarmerFish? asset = await getFishes(edit);
      if (asset != null) {
        data = await _fish(asset);
        if (data != null) {
          d2 = await fetchFish(int.parse(data.var1!));

          a = TextEditingController(text: data.var3);
          other = TextEditingController(text: data.var5);
          aa = d1.firstWhere(
            (model) => model.id == int.parse(data!.var1!),
          );
          b = d2.firstWhere(
            (model) => model.id == data!.id,
          );
          c = d3.firstWhere(
            (model) => model.id == int.parse(data!.var2!),
          );
        }
      }
    }
    emit(state.copyWith(
      searchController: TextEditingController(),
      other: other,
      numbervalueoneController: a,
    ));
    emit(state.copyWith(
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
      dropdownItemList: d1,
      dropdownItemList1: d2,
      dropdownItemList2: d3,
      commons: await commonFish(),
      selectedCategory: aa,
      selectedFish: b,
      selectedDropDownValue2: c,
    )));
  }
}
