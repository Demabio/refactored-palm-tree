// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Represents the state of Farmtechandassets in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.farmtechandassetsModelObj,
    this.a = const [],
    this.p = const [],
    this.s = const [],
    this.l = const [],
    this.farm,
    this.farmStructure,
    this.next = false,
    this.next2 = false,
    this.prev = false,
    this.done = false,
    this.county,
    this.subCounty,
    this.sublocation,
    this.ward,
    this.eAN,
    this.mobile,
    this.idNo,
    this.name,
    this.status,
  });

  ProfileModel? farmtechandassetsModelObj;
  List<CheckBoxList> p;
  List<CheckBoxList> a;
  List<CheckBoxList> s;
  List<CheckBoxList> l;

  LabourSource? farm;
  FarmAssetSource? farmStructure;
  bool next;
  bool next2;
  bool prev;
  bool done;
  String? name;
  String? eAN;
  String? mobile;
  String? ward;
  String? county;
  String? subCounty;
  String? sublocation;
  String? idNo;
  String? status;
  @override
  List<Object?> get props => [
        farmtechandassetsModelObj,
        a,
        p,
        s,
        l,
        farm,
        farmStructure,
        next,
        next2,
        prev,
        done,
        county,
        subCounty,
        sublocation,
        ward,
        eAN,
        mobile,
        idNo,
        name,
        status,
      ];
  ProfileState copyWith({
    ProfileModel? farmtechandassetsModelObj,
    List<CheckBoxList>? p,
    List<CheckBoxList>? a,
    List<CheckBoxList>? s,
    List<CheckBoxList>? l,
    LabourSource? farm,
    FarmAssetSource? farmStructure,
    bool? next,
    bool? next2,
    bool? prev,
    bool? done,
    String? county,
    String? subCounty,
    String? sublocation,
    String? ward,
    String? eAN,
    String? mobile,
    String? idNo,
    String? name,
    String? status,
  }) {
    return ProfileState(
      farmtechandassetsModelObj:
          farmtechandassetsModelObj ?? this.farmtechandassetsModelObj,
      p: p ?? this.p,
      a: a ?? this.a,
      s: s ?? this.s,
      l: l ?? this.l,
      farmStructure: farmStructure ?? this.farmStructure,
      farm: farm ?? this.farm,
      next: next ?? this.next,
      next2: next2 ?? this.next2,
      prev: prev ?? this.prev,
      done: done ?? this.done,
      county: county ?? this.county,
      subCounty: subCounty ?? this.subCounty,
      sublocation: sublocation ?? this.sublocation,
      ward: ward ?? this.ward,
      eAN: eAN ?? this.eAN,
      mobile: mobile ?? this.mobile,
      idNo: idNo ?? this.idNo,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }
}
