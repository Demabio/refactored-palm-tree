// ignore_for_file: must_be_immutable

part of 'add_crop_two_bloc.dart';

/// Represents the state of AddCropTwo in the application.
class AddCropTwoState extends Equatable {
  AddCropTwoState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.addCropTwoModelObj,
    this.checkedP = false,
    this.checkedA = false,
    this.checkedS = false,
    this.a = const [],
    this.p = const [],
    this.s = const [],
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  List<CheckBoxList> p;
  List<CheckBoxList> a;
  List<CheckBoxList> s;
  bool checkedP;
  bool checkedA;
  bool checkedS;
  AddCropTwoModel? addCropTwoModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        addCropTwoModelObj,
        checkedP,
        checkedA,
        checkedS,
        a,
        p,
        s,
      ];
  AddCropTwoState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    AddCropTwoModel? addCropTwoModelObj,
    bool? checkedP,
    bool? checkedA,
    bool? checkedS,
    List<CheckBoxList>? p,
    List<CheckBoxList>? a,
    List<CheckBoxList>? s,
  }) {
    return AddCropTwoState(
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
      addCropTwoModelObj: addCropTwoModelObj ?? this.addCropTwoModelObj,
      checkedP: checkedP ?? this.checkedP,
      checkedA: checkedA ?? this.checkedA,
      checkedS: checkedS ?? this.checkedS,
      p: p ?? this.p,
      a: a ?? this.a,
      s: s ?? this.s,
    );
  }
}
