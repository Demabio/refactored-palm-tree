// ignore_for_file: must_be_immutable

part of 'landandwatermgmt_bloc.dart';

/// Represents the state of Landandwatermgmt in the application.
class LandandwatermgmtState extends Equatable {
  LandandwatermgmtState({
    this.landandwatermgmtModelObj,
    this.u = const [],
    this.pp = const [],
    this.b = const [],
    this.p = const [],
    this.s = const [],
    this.farmer,
    this.soil,
  });

  LandandwatermgmtModel? landandwatermgmtModelObj;
  List<CheckBoxList> u;
  List<CheckBoxList> p;
  List<CheckBoxList> b;
  List<CheckBoxList> pp;
  List<CheckBoxList> s;

  Farmer? farmer;
  FarmerSoilTest? soil;
  @override
  List<Object?> get props => [
        landandwatermgmtModelObj,
        pp,
        s,
        u,
        p,
        b,
        soil,
        farmer,
      ];
  LandandwatermgmtState copyWith({
    LandandwatermgmtModel? landandwatermgmtModelObj,
    List<CheckBoxList>? u,
    List<CheckBoxList>? p,
    List<CheckBoxList>? b,
    List<CheckBoxList>? pp,
    List<CheckBoxList>? s,
    Farmer? farmer,
    FarmerSoilTest? soil,
  }) {
    return LandandwatermgmtState(
      landandwatermgmtModelObj:
          landandwatermgmtModelObj ?? this.landandwatermgmtModelObj,
      u: u ?? this.u,
      p: p ?? this.p,
      b: b ?? this.b,
      pp: pp ?? this.pp,
      s: s ?? this.s,
      farmer: farmer ?? this.farmer,
    );
  }
}
