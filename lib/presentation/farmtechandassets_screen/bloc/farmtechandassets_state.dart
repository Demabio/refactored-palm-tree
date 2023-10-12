// ignore_for_file: must_be_immutable

part of 'farmtechandassets_bloc.dart';

/// Represents the state of Farmtechandassets in the application.
class FarmtechandassetsState extends Equatable {
  FarmtechandassetsState({
    this.farmtechandassetsModelObj,
    this.a = const [],
    this.p = const [],
    this.s = const [],
    this.farm,
    this.farmStructure,
  });

  FarmtechandassetsModel? farmtechandassetsModelObj;
  List<CheckBoxList> p;
  List<CheckBoxList> a;
  List<CheckBoxList> s;
  LabourSource? farm;
  FarmAssetSource? farmStructure;
  @override
  List<Object?> get props => [
        farmtechandassetsModelObj,
        a,
        p,
        s,
        farm,
        farmStructure,
      ];
  FarmtechandassetsState copyWith({
    FarmtechandassetsModel? farmtechandassetsModelObj,
    List<CheckBoxList>? p,
    List<CheckBoxList>? a,
    List<CheckBoxList>? s,
    LabourSource? farm,
    FarmAssetSource? farmStructure,
  }) {
    return FarmtechandassetsState(
      farmtechandassetsModelObj:
          farmtechandassetsModelObj ?? this.farmtechandassetsModelObj,
      p: p ?? this.p,
      a: a ?? this.a,
      s: s ?? this.s,
      farmStructure: farmStructure ?? this.farmStructure,
      farm: farm ?? this.farm,
    );
  }
}
