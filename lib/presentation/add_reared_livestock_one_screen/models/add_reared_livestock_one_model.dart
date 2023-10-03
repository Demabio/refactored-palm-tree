// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'chipviewayrshi_item_model.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_reared_livestock_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddRearedLivestockOneModel extends Equatable {
  AddRearedLivestockOneModel({
    this.chipviewayrshiItemList = const [],
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.livestock = const [],
    this.categories = const [],
    this.subcategories = const [],
    this.selectedCategory,
    this.selectedLivestock,
    this.selectedSubCategory,
  }) {}

  List<ChipviewayrshiItemModel> chipviewayrshiItemList;

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> livestock;

  List<SelectionPopupModel> categories;

  List<SelectionPopupModel> subcategories;

  SelectionPopupModel? selectedLivestock;

  SelectionPopupModel? selectedCategory;

  SelectionPopupModel? selectedSubCategory;

  AddRearedLivestockOneModel copyWith({
    List<ChipviewayrshiItemModel>? chipviewayrshiItemList,
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? livestock,
    List<SelectionPopupModel>? categories,
    List<SelectionPopupModel>? subcategories,
    SelectionPopupModel? selectedLivestock,
    SelectionPopupModel? selectedCategory,
    SelectionPopupModel? selectedSubCategory,
  }) {
    return AddRearedLivestockOneModel(
      chipviewayrshiItemList:
          chipviewayrshiItemList ?? this.chipviewayrshiItemList,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      livestock: livestock ?? this.livestock,
      categories: categories ?? this.categories,
      subcategories: subcategories ?? this.subcategories,
      selectedLivestock: selectedLivestock,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubCategory: selectedSubCategory,
    );
  }

  @override
  List<Object?> get props => [
        chipviewayrshiItemList,
        dropdownItemList,
        dropdownItemList1,
        livestock,
        categories,
        subcategories,
        selectedCategory,
        selectedLivestock,
        selectedSubCategory,
      ];
}
