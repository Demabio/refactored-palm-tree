// ignore_for_file: must_be_immutable

part of 'financialandservices_bloc.dart';

/// Represents the state of Financialandservices in the application.
class FinancialandservicesState extends Equatable {
  FinancialandservicesState({
    this.financialandservicesModelObj,
    this.p = const [],
    this.e = const [],
    this.m = const [],
    this.i = const [],
    this.c = const [],
    this.s = const [],
    this.farm,
    this.f,
    this.done = false,
  });

  FinancialandservicesModel? financialandservicesModelObj;
  List<CheckBoxList> p;
  List<CheckBoxList> e;
  List<CheckBoxList> m;
  List<CheckBoxList> i;
  List<CheckBoxList> c;
  List<CheckBoxList> s;
  bool done;

  Farmer? farm;
  FarmerFarm? f;
  @override
  List<Object?> get props => [
        financialandservicesModelObj,
        p,
        e,
        m,
        i,
        c,
        done,
        s,
        farm,
        f,
      ];
  FinancialandservicesState copyWith({
    FinancialandservicesModel? financialandservicesModelObj,
    List<CheckBoxList>? p,
    List<CheckBoxList>? e,
    List<CheckBoxList>? m,
    List<CheckBoxList>? i,
    List<CheckBoxList>? c,
    List<CheckBoxList>? s,
    Farmer? farm,
    bool? done,
    FarmerFarm? f,
  }) {
    return FinancialandservicesState(
      financialandservicesModelObj:
          financialandservicesModelObj ?? this.financialandservicesModelObj,
      p: p ?? this.p,
      e: e ?? this.e,
      m: m ?? this.m,
      i: i ?? this.i,
      c: c ?? this.c,
      s: s ?? this.s,
      farm: farm ?? this.farm,
      done: done ?? this.done,
      f: f ?? this.f,
    );
  }
}
