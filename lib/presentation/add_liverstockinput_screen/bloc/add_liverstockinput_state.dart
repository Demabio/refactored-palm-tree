// ignore_for_file: must_be_immutable

part of 'add_liverstockinput_bloc.dart';

/// Represents the state of AddLiverstockinput in the application.
class AddLiverstockinputState extends Equatable {
  AddLiverstockinputState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.selectedDropDownValue5,
    this.selectedDropDownValue6,
    this.selectedDropDownValue7,
    this.addLiverstockinputModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  SelectionPopupModel? selectedDropDownValue5;

  SelectionPopupModel? selectedDropDownValue6;

  SelectionPopupModel? selectedDropDownValue7;

  AddLiverstockinputModel? addLiverstockinputModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        selectedDropDownValue5,
        selectedDropDownValue6,
        selectedDropDownValue7,
        addLiverstockinputModelObj,
      ];
  AddLiverstockinputState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    SelectionPopupModel? selectedDropDownValue5,
    SelectionPopupModel? selectedDropDownValue6,
    SelectionPopupModel? selectedDropDownValue7,
    AddLiverstockinputModel? addLiverstockinputModelObj,
  }) {
    return AddLiverstockinputState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      selectedDropDownValue3:
          selectedDropDownValue3 ?? this.selectedDropDownValue3,
      selectedDropDownValue4:
          selectedDropDownValue4 ?? this.selectedDropDownValue4,
      selectedDropDownValue5:
          selectedDropDownValue5 ?? this.selectedDropDownValue5,
      selectedDropDownValue6:
          selectedDropDownValue6 ?? this.selectedDropDownValue6,
      selectedDropDownValue7:
          selectedDropDownValue7 ?? this.selectedDropDownValue7,
      addLiverstockinputModelObj:
          addLiverstockinputModelObj ?? this.addLiverstockinputModelObj,
    );
  }
}
