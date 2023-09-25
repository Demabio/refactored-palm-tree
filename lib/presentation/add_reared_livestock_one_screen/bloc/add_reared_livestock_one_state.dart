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
  });

  TextEditingController? searchController;

  TextEditingController? categoryvalueController;

  TextEditingController? subcategoryvaluController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddRearedLivestockOneModel? addRearedLivestockOneModelObj;

  @override
  List<Object?> get props => [
        searchController,
        categoryvalueController,
        subcategoryvaluController,
        selectedDropDownValue,
        selectedDropDownValue1,
        addRearedLivestockOneModelObj,
      ];
  AddRearedLivestockOneState copyWith({
    TextEditingController? searchController,
    TextEditingController? categoryvalueController,
    TextEditingController? subcategoryvaluController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    AddRearedLivestockOneModel? addRearedLivestockOneModelObj,
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
    );
  }
}
