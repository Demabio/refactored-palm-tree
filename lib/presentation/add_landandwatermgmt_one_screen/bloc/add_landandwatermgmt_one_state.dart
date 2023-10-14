// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_one_bloc.dart';

/// Represents the state of AddLandandwatermgmtOne in the application.
class AddLandandwatermgmtOneState extends Equatable {
  AddLandandwatermgmtOneState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.addLandandwatermgmtOneModelObj,
    this.checka = false,
    this.p = const [],
    this.s = const [],
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  AddLandandwatermgmtOneModel? addLandandwatermgmtOneModelObj;

  bool checka;
  List<CheckBoxList> p;
  List<CheckBoxList> s;
  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        addLandandwatermgmtOneModelObj,
        checka,
        p,
        s,
      ];
  AddLandandwatermgmtOneState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    AddLandandwatermgmtOneModel? addLandandwatermgmtOneModelObj,
    bool? checka,
    List<CheckBoxList>? p,
    List<CheckBoxList>? s,
  }) {
    return AddLandandwatermgmtOneState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      addLandandwatermgmtOneModelObj:
          addLandandwatermgmtOneModelObj ?? this.addLandandwatermgmtOneModelObj,
      checka: checka ?? this.checka,
      p: p ?? this.p,
      s: s ?? this.s,
    );
  }
}
