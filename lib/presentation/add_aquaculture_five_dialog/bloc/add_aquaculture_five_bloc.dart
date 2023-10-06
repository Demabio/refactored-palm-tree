import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
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
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddAquacultureFiveState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddAquacultureFiveState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddAquacultureFiveState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
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

  List<SelectionPopupModel> fillDropdownItemList2() {
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

  Future<List<ChipviewayItemModel>> searchFish(String value) async {
    List<ChipviewayItemModel> list = [];
    FishTypeDB fishTypeDB = FishTypeDB();
    await fishTypeDB?.searchFish(value).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewayItemModel(
          fishid: value[i].fishTypeId,
          categoryid: value[i].fishCategoryId,
          fish: value[i].fishType,
        ));
      }
    });
    return list;
  }

  Future<List<ChipviewayItemModel>> commonFish() async {
    List<ChipviewayItemModel> list = [];
    FishTypeDB fishTypeDB = FishTypeDB();
    await fishTypeDB?.fetchCommonFish().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewayItemModel(
          fishid: value[i].fishTypeId,
          categoryid: value[i].fishCategoryId,
          fish: value[i].fishType,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchFishCategories() async {
    List<SelectionPopupModel> list = [];
    FishCategoryDB fishCategoryDB = FishCategoryDB();
    TextEditingController stored = TextEditingController();

    await fishCategoryDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].fishCategory,
          id: value[i].fishCategoryId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchFish() async {
    List<SelectionPopupModel> list = [];
    FishTypeDB fishCategoryDB = FishTypeDB();
    TextEditingController stored = TextEditingController();

    await fishCategoryDB?.fetchAllJoined().then((value) {
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
    await fishProductionTypeDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].fishProductionType,
          id: value[i].productionTypeId,
        ));
      }
    });
    return list;
  }

  _onInitialize(
    AddAquacultureFiveInitialEvent event,
    Emitter<AddAquacultureFiveState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      numbervalueoneController: TextEditingController(),
    ));
    emit(state.copyWith(
        addAquacultureFiveModelObj: state.addAquacultureFiveModelObj?.copyWith(
      dropdownItemList: await fetchFishCategories(),
      dropdownItemList1: await fetchFish(),
      dropdownItemList2: await fillProdsystems(),
      commons: await commonFish(),
    )));
  }
}
