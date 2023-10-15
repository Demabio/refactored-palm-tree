import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmassets.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmassettypes.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/asset.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassets.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassettypes.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/assets.dart';
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
    on<AddCBs>(_addAgeGroups);
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
          selectedDropDownValue2:
              state.addFarmtechandassetsThreeModelObj?.selectedDropDownValue2,
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
          selectedDropDownValue2:
              state.addFarmtechandassetsThreeModelObj?.selectedDropDownValue2,
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
          selectedDropDownValue2:
              state.addFarmtechandassetsThreeModelObj?.selectedDropDownValue2,
        )));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      addFarmtechandassetsThreeModelObj:
          state.addFarmtechandassetsThreeModelObj?.copyWith(
        selectedCategory:
            state.addFarmtechandassetsThreeModelObj?.selectedCategory,
        selectedDropDownValue2: event.value,
        selected: state.addFarmtechandassetsThreeModelObj?.selected,
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

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) {
    FarmerAssetsDB farmerFishDB = FarmerAssetsDB();
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();

    try {
      farmerFishDB.create(FarmerAsset(
        farmerAssetId: 0,
        farmerId: farmerid,
        farmerFarmId: farmid,
        farmAssetId: state.addFarmtechandassetsThreeModelObj!.selected!.id!,
        usableCondition: state
            .addFarmtechandassetsThreeModelObj!.selectedDropDownValue2!.id!,
        qty: int.parse(state.usableConditionController!.text),
        dateCreated: DateTime.now(),
        createdBy: userId,
      ));
      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<FarmerAsset?> getFAsset(int id) async {
    FarmerAssetsDB farmerLivestockAgeGroupsDB = FarmerAssetsDB();
    return await farmerLivestockAgeGroupsDB.fetchById(id);
  }

  Future<CheckBoxList?> _assets(FarmerAsset agess) async {
    CheckBoxList? agemodels;
    FarmerAsset ages = agess;
    FarmAssetDB farmAssetDB = FarmAssetDB();
    FarmAsset? asset = await farmAssetDB.fetchByFarmAssetId(ages.farmAssetId);
    FarmAssetType? assettype =
        asset != null ? await getAssetTypeById(asset.assetTypeId) : null;
    agemodels?.isSelected = true;
    agemodels?.var2 = agess.qty.toString();
    agemodels?.var3 = agess.usableCondition.toString();
    agemodels?.var4 = assettype?.assetTypeId.toString();
    agemodels?.id = ages.farmAssetId;
    return agemodels;
  }

  Future<FarmAssetType?> getAssetTypeById(int id) async {
    FarmAssetTypeDB farmerFishProductionLevelsDB = FarmAssetTypeDB();
    return await farmerFishProductionLevelsDB.fetchByAssetTypeId(id);
  }

  _onInitialize(
    AddFarmtechandassetsThreeInitialEvent event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) async {
    int edit = PrefUtils().getEditId();
    CheckBoxList? data;
    List<SelectionPopupModel> d1 = await fillAssetTypes();
    List<SelectionPopupModel> d2 = fillDropdownItemList2();
    List<SelectionPopupModel>? d3;
    SelectionPopupModel? aa;
    SelectionPopupModel? bb;
    SelectionPopupModel? cc;
    TextEditingController? at;
    if (edit != 0) {
      FarmerAsset? asset = await getFAsset(edit);
      if (asset != null) {
        data = await _assets(asset);
        if (data != null) {
          at = TextEditingController(text: data.var2);
          d3 = await fillAssets(int.parse(data.var4!));
          aa = d1.firstWhere(
            (model) => model.id == int.parse(data!.var4!),
          );

          bb = d2.firstWhere(
            (model) => model.id == int.parse(data!.var3!),
          );

          cc = d3.firstWhere(
            (model) => model.id == asset.farmAssetId,
          );
        }
      }
    }
    emit(state.copyWith(
      searchController: TextEditingController(),
      usableConditionController: at,
    ));
    emit(state.copyWith(
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
      dropdownItemList: d1,
      dropdownItemList2: d2,
      dropdownItemList1: d3,
      selectedCategory: aa,
      selected: cc,
      selectedDropDownValue2: bb,
    )));
  }
}
