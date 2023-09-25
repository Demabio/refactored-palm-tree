// ignore_for_file: must_be_immutable

part of 'add_financialandservices_two_bloc.dart';

/// Represents the state of AddFinancialandservicesTwo in the application.
class AddFinancialandservicesTwoState extends Equatable {
  AddFinancialandservicesTwoState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.selectedDropDownValue5,
    this.addFinancialandservicesTwoModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  SelectionPopupModel? selectedDropDownValue5;

  AddFinancialandservicesTwoModel? addFinancialandservicesTwoModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        selectedDropDownValue5,
        addFinancialandservicesTwoModelObj,
      ];
  AddFinancialandservicesTwoState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    SelectionPopupModel? selectedDropDownValue5,
    AddFinancialandservicesTwoModel? addFinancialandservicesTwoModelObj,
  }) {
    return AddFinancialandservicesTwoState(
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
      addFinancialandservicesTwoModelObj: addFinancialandservicesTwoModelObj ??
          this.addFinancialandservicesTwoModelObj,
    );
  }
}
