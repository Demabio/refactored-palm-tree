// ignore_for_file: must_be_immutable

part of 'livestock_two_bloc.dart';

/// Represents the state of LivestockTwo in the application.
class LivestockTwoState extends Equatable {
  LivestockTwoState({this.livestockTwoModelObj});

  LivestockTwoModel? livestockTwoModelObj;

  @override
  List<Object?> get props => [
        livestockTwoModelObj,
      ];
  LivestockTwoState copyWith({LivestockTwoModel? livestockTwoModelObj}) {
    return LivestockTwoState(
      livestockTwoModelObj: livestockTwoModelObj ?? this.livestockTwoModelObj,
    );
  }
}
