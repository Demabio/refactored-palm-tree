// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_five_bloc.dart';

/// Represents the state of AddLandandwatermgmtFive in the application.
class AddLandandwatermgmtFiveState extends Equatable {
  AddLandandwatermgmtFiveState({
    this.furrowvalue = false,
    this.dripvalue = false,
    this.sprinklervalue = false,
    this.centrePivot = false,
    this.bucketIrrigatio = false,
    this.basinIrrigation = false,
    this.floodingvalue = false,
    this.furrowCanal = false,
    this.addLandandwatermgmtFiveModelObj,
  });

  AddLandandwatermgmtFiveModel? addLandandwatermgmtFiveModelObj;

  bool furrowvalue;

  bool dripvalue;

  bool sprinklervalue;

  bool centrePivot;

  bool bucketIrrigatio;

  bool basinIrrigation;

  bool floodingvalue;

  bool furrowCanal;

  @override
  List<Object?> get props => [
        furrowvalue,
        dripvalue,
        sprinklervalue,
        centrePivot,
        bucketIrrigatio,
        basinIrrigation,
        floodingvalue,
        furrowCanal,
        addLandandwatermgmtFiveModelObj,
      ];
  AddLandandwatermgmtFiveState copyWith({
    bool? furrowvalue,
    bool? dripvalue,
    bool? sprinklervalue,
    bool? centrePivot,
    bool? bucketIrrigatio,
    bool? basinIrrigation,
    bool? floodingvalue,
    bool? furrowCanal,
    AddLandandwatermgmtFiveModel? addLandandwatermgmtFiveModelObj,
  }) {
    return AddLandandwatermgmtFiveState(
      furrowvalue: furrowvalue ?? this.furrowvalue,
      dripvalue: dripvalue ?? this.dripvalue,
      sprinklervalue: sprinklervalue ?? this.sprinklervalue,
      centrePivot: centrePivot ?? this.centrePivot,
      bucketIrrigatio: bucketIrrigatio ?? this.bucketIrrigatio,
      basinIrrigation: basinIrrigation ?? this.basinIrrigation,
      floodingvalue: floodingvalue ?? this.floodingvalue,
      furrowCanal: furrowCanal ?? this.furrowCanal,
      addLandandwatermgmtFiveModelObj: addLandandwatermgmtFiveModelObj ??
          this.addLandandwatermgmtFiveModelObj,
    );
  }
}
