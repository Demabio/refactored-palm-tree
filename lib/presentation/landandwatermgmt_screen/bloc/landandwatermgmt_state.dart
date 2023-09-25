// ignore_for_file: must_be_immutable

part of 'landandwatermgmt_bloc.dart';

/// Represents the state of Landandwatermgmt in the application.
class LandandwatermgmtState extends Equatable {
  LandandwatermgmtState({this.landandwatermgmtModelObj});

  LandandwatermgmtModel? landandwatermgmtModelObj;

  @override
  List<Object?> get props => [
        landandwatermgmtModelObj,
      ];
  LandandwatermgmtState copyWith(
      {LandandwatermgmtModel? landandwatermgmtModelObj}) {
    return LandandwatermgmtState(
      landandwatermgmtModelObj:
          landandwatermgmtModelObj ?? this.landandwatermgmtModelObj,
    );
  }
}
