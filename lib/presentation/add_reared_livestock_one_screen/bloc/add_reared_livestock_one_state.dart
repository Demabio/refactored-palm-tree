// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_one_bloc.dart';

/// Represents the state of AddRearedLivestockOne in the application.
class AddRearedLivestockOneState extends Equatable {
  AddRearedLivestockOneState({
    this.searchController,
    this.categoryvalueController,
    this.subcategoryvaluController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.addRearedLivestockOneModelObj,
    this.selectedCategory,
    this.selectedLivestock,
    this.selectedSubCategory,
    this.categories,
    this.livestock,
    this.subcategories,
    this.categoryDB,
    this.livestockDB,
    this.subcategoryDB,
  });

  TextEditingController? searchController;

  TextEditingController? categoryvalueController;

  TextEditingController? subcategoryvaluController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedLivestock;

  SelectionPopupModel? selectedCategory;

  SelectionPopupModel? selectedSubCategory;

  List<Livestock>? livestock;

  List<LivestockCategory>? categories;

  List<LivestockSubcategory>? subcategories;

  LivestockDB? livestockDB;

  LivestockCategoryDB? categoryDB;

  LivestockSubcategoryDB? subcategoryDB;

  AddRearedLivestockOneModel? addRearedLivestockOneModelObj;

  @override
  List<Object?> get props => [
        searchController,
        categoryvalueController,
        subcategoryvaluController,
        selectedDropDownValue,
        selectedDropDownValue1,
        addRearedLivestockOneModelObj,
        selectedLivestock,
        selectedCategory,
        selectedSubCategory,
        livestock,
        categories,
        subcategories,
        categoryDB,
        livestockDB,
        subcategoryDB,
      ];
  AddRearedLivestockOneState copyWith({
    TextEditingController? searchController,
    TextEditingController? categoryvalueController,
    TextEditingController? subcategoryvaluController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    AddRearedLivestockOneModel? addRearedLivestockOneModelObj,
    SelectionPopupModel? selectedLivestock,
    SelectionPopupModel? selectedCategory,
    SelectionPopupModel? selectedSubCategory,
    List<Livestock>? livestock,
    List<LivestockCategory>? categories,
    List<LivestockSubcategory>? subcategories,
    LivestockDB? livestockDB,
    LivestockCategoryDB? categoryDB,
    LivestockSubcategoryDB? subcategoryDB,
  }) {
    return AddRearedLivestockOneState(
      searchController: searchController ?? this.searchController,
      categoryvalueController:
          categoryvalueController ?? this.categoryvalueController,
      subcategoryvaluController:
          subcategoryvaluController ?? this.subcategoryvaluController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      addRearedLivestockOneModelObj:
          addRearedLivestockOneModelObj ?? this.addRearedLivestockOneModelObj,
      selectedLivestock: selectedLivestock ?? this.selectedLivestock,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
      livestock: livestock ?? this.livestock,
      categories: categories ?? this.categories,
      subcategories: subcategories ?? this.subcategories,
      livestockDB: livestockDB ?? this.livestockDB,
      categoryDB: categoryDB ?? this.categoryDB,
      subcategoryDB: subcategoryDB ?? this.subcategoryDB,
    );
  }
}
