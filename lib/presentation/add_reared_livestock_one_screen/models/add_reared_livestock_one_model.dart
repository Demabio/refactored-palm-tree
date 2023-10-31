// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/agegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/beehivetype.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/feed.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestocksystem.dart';
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
    this.search = false,
    this.searchResults,
    this.searchController,
    this.ageGroup,
    this.beehive,
    this.feeds,
    this.livestockF,
    this.lsProgress,
    this.system,
    this.selectedDropDownValue1,
  });

  TextEditingController? searchController;

  List<ChipviewayrshiItemModel> chipviewayrshiItemList;

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> livestock;

  List<SelectionPopupModel> categories;

  List<SelectionPopupModel> subcategories;

  SelectionPopupModel? selectedLivestock;

  SelectionPopupModel? selectedCategory;

  SelectionPopupModel? selectedSubCategory;

  List<ChipviewayrshiItemModel>? searchResults;

  bool search;

  LSProgress? lsProgress;
  FarmerLivestock? livestockF;
  FarmerLivestockAgeGroup? ageGroup;
  FarmerLivestockFeed? feeds;
  FarmerLivestockBeehiveType? beehive;
  FarmerLivestockFarmSystem? system;
  SelectionPopupModel? selectedDropDownValue1;

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
    List<ChipviewayrshiItemModel>? searchResults,
    bool? search,
    TextEditingController? searchController,
    LSProgress? lsProgress,
    FarmerLivestock? livestockF,
    FarmerLivestockAgeGroup? ageGroup,
    FarmerLivestockFeed? feeds,
    FarmerLivestockBeehiveType? beehive,
    FarmerLivestockFarmSystem? system,
    SelectionPopupModel? selectedDropDownValue1,
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
      selectedCategory: selectedCategory,
      selectedSubCategory: selectedSubCategory,
      search: search ?? this.search,
      searchResults: searchResults ?? this.searchResults,
      searchController: searchController ?? this.searchController,
      lsProgress: lsProgress ?? this.lsProgress,
      livestockF: livestockF ?? this.livestockF,
      ageGroup: ageGroup ?? this.ageGroup,
      feeds: feeds ?? this.feeds,
      beehive: beehive ?? this.beehive,
      system: system ?? this.system,
      selectedDropDownValue1: selectedDropDownValue1,
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
        search,
        searchResults,
        searchController,
        lsProgress,
        livestockF,
        ageGroup,
        feeds,
        beehive,
        system,
        selectedDropDownValue1,
      ];
}
