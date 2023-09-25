// ignore_for_file: must_be_immutable

part of 'livestock_one_bloc.dart';

/// Represents the state of LivestockOne in the application.
class LivestockOneState extends Equatable {
  LivestockOneState({this.livestockOneModelObj});

  LivestockOneModel? livestockOneModelObj;

  @override
  List<Object?> get props => [
        livestockOneModelObj,
      ];
  LivestockOneState copyWith({LivestockOneModel? livestockOneModelObj}) {
    return LivestockOneState(
      livestockOneModelObj: livestockOneModelObj ?? this.livestockOneModelObj,
    );
  }
}
