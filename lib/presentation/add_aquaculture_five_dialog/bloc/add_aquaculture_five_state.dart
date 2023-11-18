// ignore_for_file: must_be_immutable

part of 'add_aquaculture_five_bloc.dart';

/// Represents the state of AddAquacultureFive in the application.
class AddAquacultureFiveState extends Equatable {
  AddAquacultureFiveState({
    this.searchController,
    this.numbervalueoneController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.addAquacultureFiveModelObj,
    this.other,
  });

  TextEditingController? searchController;

  TextEditingController? other;

  TextEditingController? numbervalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  AddAquacultureFiveModel? addAquacultureFiveModelObj;

  @override
  List<Object?> get props => [
        searchController,
        numbervalueoneController,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        addAquacultureFiveModelObj,
        other,
      ];
  AddAquacultureFiveState copyWith({
    TextEditingController? searchController,
    TextEditingController? numbervalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    AddAquacultureFiveModel? addAquacultureFiveModelObj,
    TextEditingController? other,
  }) {
    return AddAquacultureFiveState(
      searchController: searchController ?? this.searchController,
      numbervalueoneController:
          numbervalueoneController ?? this.numbervalueoneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      addAquacultureFiveModelObj:
          addAquacultureFiveModelObj ?? this.addAquacultureFiveModelObj,
      other: other ?? this.other,
    );
  }
}
