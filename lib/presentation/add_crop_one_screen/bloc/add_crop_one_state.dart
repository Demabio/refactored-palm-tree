// ignore_for_file: must_be_immutable

part of 'add_crop_one_bloc.dart';

/// Represents the state of AddCropOne in the application.
class AddCropOneState extends Equatable {
  AddCropOneState({
    this.searchController,
    this.areavalueoneController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.addCropOneModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? areavalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  AddCropOneModel? addCropOneModelObj;

  @override
  List<Object?> get props => [
        searchController,
        areavalueoneController,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        addCropOneModelObj,
      ];
  AddCropOneState copyWith({
    TextEditingController? searchController,
    TextEditingController? areavalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    AddCropOneModel? addCropOneModelObj,
  }) {
    return AddCropOneState(
      searchController: searchController ?? this.searchController,
      areavalueoneController:
          areavalueoneController ?? this.areavalueoneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      addCropOneModelObj: addCropOneModelObj ?? this.addCropOneModelObj,
    );
  }
}
