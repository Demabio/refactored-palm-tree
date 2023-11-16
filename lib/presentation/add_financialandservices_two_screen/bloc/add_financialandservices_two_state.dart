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
    this.selectedDropDownValue6,
    this.addFinancialandservicesTwoModelObj,
    this.p = const [],
    this.e = const [],
    this.m = const [],
    this.checka = false,
    this.checkb = false,
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  SelectionPopupModel? selectedDropDownValue5;

  SelectionPopupModel? selectedDropDownValue6;

  AddFinancialandservicesTwoModel? addFinancialandservicesTwoModelObj;
  List<CheckBoxList> p;
  List<CheckBoxList> e;
  List<CheckBoxList> m;
  bool checka;
  bool checkb;
  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        selectedDropDownValue5,
        selectedDropDownValue6,
        p,
        e,
        m,
        addFinancialandservicesTwoModelObj,
        checka,
        checkb,
      ];
  AddFinancialandservicesTwoState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    SelectionPopupModel? selectedDropDownValue5,
    SelectionPopupModel? selectedDropDownValue6,
    List<CheckBoxList>? p,
    List<CheckBoxList>? e,
    List<CheckBoxList>? m,
    bool? checka,
    bool? checkb,
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
      selectedDropDownValue6:
          selectedDropDownValue6 ?? this.selectedDropDownValue6,
      p: p ?? this.p,
      e: e ?? this.e,
      m: m ?? this.m,
      checka: checka ?? this.checka,
      checkb: checkb ?? this.checkb,
      addFinancialandservicesTwoModelObj: addFinancialandservicesTwoModelObj ??
          this.addFinancialandservicesTwoModelObj,
    );
  }
}
