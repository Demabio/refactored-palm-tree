import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestocksubcategory.dart';
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
        )
        // addRearedLivestockOneModelObj: state.addRearedLivestockOneModelObj
        //     ?.copyWith(chipviewayrshiItemList: newList),
        );
    emit(updatedState);
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
        livestock: await fillLivestock(
          event.value.id!,
        ),
      ),
    ));
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

  _onInitialize(
    AddRearedLivestockOneInitialEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      categoryvalueController: TextEditingController(),
      subcategoryvaluController: TextEditingController(),
    ));
    emit(
      state.copyWith(
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
          chipviewayrshiItemList:
              await fillCommonLivestock(), //fillChipviewayrshiItemList(),
          categories: await fillCategories(),
        ),
      ),
    );
  }
}
