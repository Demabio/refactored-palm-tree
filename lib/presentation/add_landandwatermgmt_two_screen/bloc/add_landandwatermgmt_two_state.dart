// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_two_bloc.dart';

/// Represents the state of AddLandandwatermgmtTwo in the application.
class AddLandandwatermgmtTwoState extends Equatable {
  AddLandandwatermgmtTwoState({
    this.areavalueoneController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.addLandandwatermgmtTwoModelObj,
    this.checka = false,
    this.checkb = false,
    this.u = const [],
    this.p = const [],
    this.b = const [],
    this.livestock = false,
    this.fish = false,
    this.crop = false,
  });

  TextEditingController? areavalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddLandandwatermgmtTwoModel? addLandandwatermgmtTwoModelObj;
  bool checka;
  bool checkb;
  List<CheckBoxList> u;
  List<CheckBoxList> p;
  List<CheckBoxList> b;
  bool livestock;
  bool fish;
  bool crop;
  @override
  List<Object?> get props => [
        areavalueoneController,
        selectedDropDownValue,
        selectedDropDownValue1,
        addLandandwatermgmtTwoModelObj,
        checkb,
        checka,
        u,
        p,
        b,
        livestock,
        fish,
        crop,
      ];
  AddLandandwatermgmtTwoState copyWith({
    TextEditingController? areavalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    AddLandandwatermgmtTwoModel? addLandandwatermgmtTwoModelObj,
    bool? checka,
    bool? checkb,
    List<CheckBoxList>? u,
    List<CheckBoxList>? p,
    List<CheckBoxList>? b,
    bool? livestock,
    bool? fish,
    bool? crop,
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
      checka: checka ?? this.checka,
      checkb: checkb ?? this.checkb,
      u: u ?? this.u,
      p: p ?? this.p,
      b: b ?? this.b,
      livestock: livestock ?? this.livestock,
      fish: fish ?? this.fish,
      crop: crop ?? this.crop,
    );
  }
}
