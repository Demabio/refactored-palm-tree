// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/models/chipvieway_item_model.dart';

/// This class defines the variables used in the [add_aquaculture_five_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddAquacultureFiveModel extends Equatable {
  AddAquacultureFiveModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.searchResults = const [],
    this.commons = const [],
    this.selectedCategory,
    this.selectedFish,
    this.search = false,
    this.aqProgress,
    this.selectedDropDownValue2,
  });

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;

  SelectionPopupModel? selectedFish;

  SelectionPopupModel? selectedCategory;

  SelectionPopupModel? selectedDropDownValue2;

  List<ChipviewayItemModel> searchResults;

  List<ChipviewayItemModel> commons;

  bool search;
  AQProgress? aqProgress;

  AddAquacultureFiveModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? dropdownItemList2,
    SelectionPopupModel? selectedFish,
    SelectionPopupModel? selectedCategory,
    List<ChipviewayItemModel>? searchResults,
    SelectionPopupModel? selectedDropDownValue2,
    List<ChipviewayItemModel>? commons,
    bool? search,
    AQProgress? aqProgress,
  }) {
    return AddAquacultureFiveModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      selectedCategory: selectedCategory,
      selectedFish: selectedFish,
      searchResults: searchResults ?? this.searchResults,
      commons: commons ?? this.commons,
      search: search ?? this.search,
      aqProgress: aqProgress ?? this.aqProgress,
      selectedDropDownValue2: selectedDropDownValue2,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        selectedCategory,
        selectedFish,
        searchResults,
        commons,
        search,
        aqProgress,
        selectedDropDownValue2,
      ];
}
