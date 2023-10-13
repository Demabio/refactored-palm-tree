// ignore_for_file: must_be_immutable

part of 'add_financialandservices_one_bloc.dart';

/// Represents the state of AddFinancialandservicesOne in the application.
class AddFinancialandservicesOneState extends Equatable {
  AddFinancialandservicesOneState({
    this.selectvalueoneController,
    this.selectedDropDownValue,
    this.addFinancialandservicesOneModelObj,
    this.checka = false,
    this.checkb = false,
    this.i = const [],
    this.c = const [],
    this.s = const [],
  });

  TextEditingController? selectvalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  AddFinancialandservicesOneModel? addFinancialandservicesOneModelObj;
  bool checka;
  bool checkb;
  List<CheckBoxList> i;
  List<CheckBoxList> c;
  List<CheckBoxList> s;
  @override
  List<Object?> get props => [
        selectvalueoneController,
        selectedDropDownValue,
        addFinancialandservicesOneModelObj,
        i,
        c,
        s,
        checka,
        checkb,
      ];
  AddFinancialandservicesOneState copyWith({
    TextEditingController? selectvalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    AddFinancialandservicesOneModel? addFinancialandservicesOneModelObj,
    bool? checka,
    bool? checkb,
    List<CheckBoxList>? i,
    List<CheckBoxList>? c,
    List<CheckBoxList>? s,
  }) {
    return AddFinancialandservicesOneState(
      selectvalueoneController:
          selectvalueoneController ?? this.selectvalueoneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      addFinancialandservicesOneModelObj: addFinancialandservicesOneModelObj ??
          this.addFinancialandservicesOneModelObj,
      checka: checka ?? this.checka,
      checkb: checkb ?? this.checkb,
      i: i ?? this.i,
      c: c ?? this.c,
      s: s ?? this.s,
    );
  }
}
