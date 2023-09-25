// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_two_bloc.dart';

/// Represents the state of AddRearedLivestockTwo in the application.
class AddRearedLivestockTwoState extends Equatable {
  AddRearedLivestockTwoState({
    this.searchController,
    this.selectController,
    this.selectoneController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.addRearedLivestockTwoModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? selectController;

  TextEditingController? selectoneController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddRearedLivestockTwoModel? addRearedLivestockTwoModelObj;

  @override
  List<Object?> get props => [
        searchController,
        selectController,
        selectoneController,
        selectedDropDownValue,
        selectedDropDownValue1,
        addRearedLivestockTwoModelObj,
      ];
  AddRearedLivestockTwoState copyWith({
    TextEditingController? searchController,
    TextEditingController? selectController,
    TextEditingController? selectoneController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    AddRearedLivestockTwoModel? addRearedLivestockTwoModelObj,
  }) {
    return AddRearedLivestockTwoState(
      searchController: searchController ?? this.searchController,
      selectController: selectController ?? this.selectController,
      selectoneController: selectoneController ?? this.selectoneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      addRearedLivestockTwoModelObj:
          addRearedLivestockTwoModelObj ?? this.addRearedLivestockTwoModelObj,
    );
  }
}
