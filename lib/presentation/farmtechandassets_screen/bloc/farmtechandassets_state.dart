// ignore_for_file: must_be_immutable

part of 'farmtechandassets_bloc.dart';

/// Represents the state of Farmtechandassets in the application.
class FarmtechandassetsState extends Equatable {
  FarmtechandassetsState({
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
  });

  FarmtechandassetsModel? farmtechandassetsModelObj;
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
      ];
  FarmtechandassetsState copyWith({
    FarmtechandassetsModel? farmtechandassetsModelObj,
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
  }) {
    return FarmtechandassetsState(
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
    );
  }
}
