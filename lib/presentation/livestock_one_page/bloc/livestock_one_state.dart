// ignore_for_file: must_be_immutable

part of 'livestock_one_bloc.dart';

/// Represents the state of LivestockOne in the application.
class LivestockOneState extends Equatable {
  LivestockOneState({
    this.livestockOneModelObj,
    this.lslist,
  });

  LivestockOneModel? livestockOneModelObj;
  List<LSdetailsItemModel>? lslist;
  @override
  List<Object?> get props => [
        livestockOneModelObj,
        lslist,
      ];
  LivestockOneState copyWith({
    LivestockOneModel? livestockOneModelObj,
    List<LSdetailsItemModel>? lslist,
  }) {
    return LivestockOneState(
      livestockOneModelObj: livestockOneModelObj ?? this.livestockOneModelObj,
      lslist: lslist ?? this.lslist,
    );
  }
}
