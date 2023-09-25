// ignore_for_file: must_be_immutable

part of 'add_aquaculture_two_bloc.dart';

/// Represents the state of AddAquacultureTwo in the application.
class AddAquacultureTwoState extends Equatable {
  AddAquacultureTwoState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.addAquacultureTwoModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  AddAquacultureTwoModel? addAquacultureTwoModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        addAquacultureTwoModelObj,
      ];
  AddAquacultureTwoState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    AddAquacultureTwoModel? addAquacultureTwoModelObj,
  }) {
    return AddAquacultureTwoState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      addAquacultureTwoModelObj:
          addAquacultureTwoModelObj ?? this.addAquacultureTwoModelObj,
    );
  }
}
