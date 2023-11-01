// ignore_for_file: must_be_immutable

part of 'livestock_one_bloc.dart';

/// Represents the state of LivestockOne in the application.
class LivestockOneState extends Equatable {
  LivestockOneState({
    this.livestockOneModelObj,
    this.lslist,
    this.done = false,
    this.next = false,
    this.prev = false,
  });
  bool done;
  bool next;
  bool prev;
  LivestockOneModel? livestockOneModelObj;
  List<LSdetailsItemModel>? lslist;
  @override
  List<Object?> get props => [
        livestockOneModelObj,
        lslist,
        done,
        next,
        prev,
      ];
  LivestockOneState copyWith({
    LivestockOneModel? livestockOneModelObj,
    List<LSdetailsItemModel>? lslist,
    bool? done,
    bool? next,
    bool? prev,
  }) {
    return LivestockOneState(
      livestockOneModelObj: livestockOneModelObj ?? this.livestockOneModelObj,
      lslist: lslist ?? this.lslist,
      done: done ?? this.done,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }
}
