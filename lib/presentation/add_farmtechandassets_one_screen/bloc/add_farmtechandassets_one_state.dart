// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_one_bloc.dart';

/// Represents the state of AddFarmtechandassetsOne in the application.
class AddFarmtechandassetsOneState extends Equatable {
  AddFarmtechandassetsOneState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.addFarmtechandassetsOneModelObj,
    this.checkedP = false,
    this.checkedA = false,
    this.checkedS = false,
    this.a = const [],
    this.p = const [],
    this.s = const [],
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddFarmtechandassetsOneModel? addFarmtechandassetsOneModelObj;

  bool checkedP;
  bool checkedA;
  bool checkedS;
  List<CheckBoxList> p;
  List<CheckBoxList> a;
  List<CheckBoxList> s;
  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        addFarmtechandassetsOneModelObj,
        checkedP,
        checkedA,
        checkedS,
        a,
        p,
        s,
      ];
  AddFarmtechandassetsOneState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    AddFarmtechandassetsOneModel? addFarmtechandassetsOneModelObj,
    bool? checkedP,
    bool? checkedA,
    bool? checkedS,
    List<CheckBoxList>? p,
    List<CheckBoxList>? a,
    List<CheckBoxList>? s,
  }) {
    return AddFarmtechandassetsOneState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      addFarmtechandassetsOneModelObj: addFarmtechandassetsOneModelObj ??
          this.addFarmtechandassetsOneModelObj,
      checkedP: checkedP ?? this.checkedP,
      checkedA: checkedA ?? this.checkedA,
      checkedS: checkedS ?? this.checkedS,
      p: p ?? this.p,
      a: a ?? this.a,
      s: s ?? this.s,
    );
  }
}
