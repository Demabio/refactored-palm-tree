// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_three_dialog/models/chipvieway_item_model.dart';

/// This class defines the variables used in the [add_farmtechandassets_three_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFarmtechandassetsThreeModel extends Equatable {
  AddFarmtechandassetsThreeModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.searchResults = const [],
    this.commons = const [],
    this.selectedCategory,
    this.selected,
    this.search = false,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;

  List<ChipviewayItemModel> searchResults;

  List<ChipviewayItemModel> commons;

  bool search;

  SelectionPopupModel? selected;

  SelectionPopupModel? selectedCategory;

  AddFarmtechandassetsThreeModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? dropdownItemList2,
    SelectionPopupModel? selected,
    SelectionPopupModel? selectedCategory,
    List<ChipviewayItemModel>? searchResults,
    List<ChipviewayItemModel>? commons,
    bool? search,
  }) {
    return AddFarmtechandassetsThreeModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      selectedCategory: selectedCategory,
      selected: selected,
      searchResults: searchResults ?? this.searchResults,
      commons: commons ?? this.commons,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        selectedCategory,
        selected,
        searchResults,
        commons,
        search,
      ];
}
