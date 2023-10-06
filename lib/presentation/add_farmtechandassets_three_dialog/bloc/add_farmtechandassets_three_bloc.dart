import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassets.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassettypes.dart';
import '../models/chipvieway_item_model.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_three_dialog/models/add_farmtechandassets_three_model.dart';
part 'add_farmtechandassets_three_event.dart';
part 'add_farmtechandassets_three_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsThree according to the event that is dispatched to it.
class AddFarmtechandassetsThreeBloc extends Bloc<AddFarmtechandassetsThreeEvent,
    AddFarmtechandassetsThreeState> {
  AddFarmtechandassetsThreeBloc(AddFarmtechandassetsThreeState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsThreeInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<UpdateChipViewEvent>(_updateChipView);
    on<SearchEventFish>(_searchFish);
    on<ReturnCommonEvent>(_restoreCommon);
  }
  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) async {
    // List<ChipviewayrshiItemModel> newList = List<ChipviewayrshiItemModel>.from(
    //     state.addRearedLivestockOneModelObj!.chipviewayrshiItemList);
    // newList[event.index] = newList[event.index].copyWith(
    //   isSelected: event.isSelected,
    // );

    List<SelectionPopupModel> fish = await fillAssets(event.model!.categoryid!);

    final updatedState = state.copyWith(
        selectedDropDownValue: SelectionPopupModel(
          title: event.model?.namecat ?? "",
          id: event.model?.categoryid,
        ),
        selectedDropDownValue1: SelectionPopupModel(
          title: event.model?.name ?? "",
          id: event.model?.nameid,
        ),
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
          selected: null,
          selectedCategory: null,
          dropdownItemList1: fish,
          search: false,
        )
        // addRearedLivestockOneModelObj: state.addRearedLivestockOneModelObj
        //     ?.copyWith(chipviewayrshiItemList: newList),
        );
    emit(updatedState);

    if (state.searchController?.value != null) {
      emit(state.copyWith(searchController: TextEditingController()));
    }
    SelectionPopupModel? categorymodel =
        state.addFarmtechandassetsThreeModelObj?.dropdownItemList.firstWhere(
      (model) => model.id == event.model!.categoryid,
    );

    SelectionPopupModel? model =
        state.addFarmtechandassetsThreeModelObj?.dropdownItemList1.firstWhere(
      (model) => model.id == event.model!.nameid,
    );
    emit(state.copyWith(
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
      selectedCategory: categorymodel,
      selected: model,
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedDropDownValue: event.value,
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
          selectedCategory: event.value,
          selected: null,
          dropdownItemList1: await fillAssets(event.value.id!),
        ),
      ),
    );
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue1: event.value,
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
          selectedCategory:
              state.addFarmtechandassetsThreeModelObj?.selectedCategory,
          selected: event.value,
        )));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddFarmtechandassetsThreeState> emit,
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
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  _searchFish(
    SearchEventFish event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
      selectedCategory:
          state.addFarmtechandassetsThreeModelObj?.selectedCategory,
      selected: state.addFarmtechandassetsThreeModelObj?.selected,
      search: true,
      searchResults: await searchAsset(event.value),
    )));
  }

  _restoreCommon(
    ReturnCommonEvent event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
      selectedCategory:
          state.addFarmtechandassetsThreeModelObj?.selectedCategory,
      selected: state.addFarmtechandassetsThreeModelObj?.selected,
      search: false,
    )));
  }

  Future<List<ChipviewayItemModel>> searchAsset(String value) async {
    List<ChipviewayItemModel> list = [];
    FarmAssetDB farmAssetDB = FarmAssetDB();
    await farmAssetDB.searchAsset(value).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewayItemModel(
          nameid: value[i].farmAssetId,
          categoryid: value[i].assetTypeId,
          name: value[i].asset,
          namecat: value[i].assetType,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fillAssetTypes() async {
    List<SelectionPopupModel> list = [];
    FarmAssetTypeDB farmAssetTypeDB = FarmAssetTypeDB();
    await farmAssetTypeDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].assetName,
          id: value[i].assetTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fillAssets(int id) async {
    List<SelectionPopupModel> list = [];
    FarmAssetDB farmAssetDB = FarmAssetDB();
    await farmAssetDB.fetchAllByTypeId(id).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].asset,
          id: value[i].farmAssetId,
        ));
      }
    });
    return list;
  }

  _onInitialize(
    AddFarmtechandassetsThreeInitialEvent event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      usableConditionController: TextEditingController(),
    ));
    emit(state.copyWith(
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
      dropdownItemList: await fillAssetTypes(),
      dropdownItemList2: fillDropdownItemList2(),
    )));
  }
}
