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
    this.checkp = false,
    this.checki = false,
    this.group = false,
    this.credit = false,
    this.income = false,
    this.i = const [],
    this.c = const [],
    this.s = const [],
    this.p = const [],
  });

  TextEditingController? selectvalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  AddFinancialandservicesOneModel? addFinancialandservicesOneModelObj;
  bool checka;
  bool checkb;
  bool checkp;
  bool checki;
  bool credit;
  bool group;
  bool income;
  List<CheckBoxList> i;
  List<CheckBoxList> c;
  List<CheckBoxList> s;
  List<CheckBoxList> p;

  @override
  List<Object?> get props => [
        selectvalueoneController,
        selectedDropDownValue,
        addFinancialandservicesOneModelObj,
        i,
        c,
        s,
        p,
        checka,
        checkb,
        checkp,
        checki,
        credit,
        group,
        income,
      ];
  AddFinancialandservicesOneState copyWith({
    TextEditingController? selectvalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    AddFinancialandservicesOneModel? addFinancialandservicesOneModelObj,
    bool? checka,
    bool? checkb,
    bool? checkp,
    bool? checki,
    List<CheckBoxList>? i,
    List<CheckBoxList>? c,
    List<CheckBoxList>? s,
    List<CheckBoxList>? p,
    bool? credit,
    bool? group,
    bool? income,
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
      checkp: checkp ?? this.checkp,
      checki: checki ?? this.checki,
      credit: credit ?? this.credit,
      group: group ?? this.group,
      income: income ?? this.income,
      i: i ?? this.i,
      c: c ?? this.c,
      s: s ?? this.s,
      p: p ?? this.p,
    );
  }
}
