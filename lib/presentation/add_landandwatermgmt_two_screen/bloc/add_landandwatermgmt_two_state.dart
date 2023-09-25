// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_two_bloc.dart';

/// Represents the state of AddLandandwatermgmtTwo in the application.
class AddLandandwatermgmtTwoState extends Equatable {
  AddLandandwatermgmtTwoState({
    this.areavalueoneController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.addLandandwatermgmtTwoModelObj,
  });

  TextEditingController? areavalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddLandandwatermgmtTwoModel? addLandandwatermgmtTwoModelObj;

  @override
  List<Object?> get props => [
        areavalueoneController,
        selectedDropDownValue,
        selectedDropDownValue1,
        addLandandwatermgmtTwoModelObj,
      ];
  AddLandandwatermgmtTwoState copyWith({
    TextEditingController? areavalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    AddLandandwatermgmtTwoModel? addLandandwatermgmtTwoModelObj,
  }) {
    return AddLandandwatermgmtTwoState(
      areavalueoneController:
          areavalueoneController ?? this.areavalueoneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      addLandandwatermgmtTwoModelObj:
          addLandandwatermgmtTwoModelObj ?? this.addLandandwatermgmtTwoModelObj,
    );
  }
}
