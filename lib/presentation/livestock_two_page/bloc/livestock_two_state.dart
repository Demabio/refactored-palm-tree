// ignore_for_file: must_be_immutable

part of 'livestock_two_bloc.dart';

/// Represents the state of LivestockTwo in the application.
class LivestockTwoState extends Equatable {
  LivestockTwoState({
    this.livestockTwoModelObj,
    this.done = false,
    this.next = false,
    this.prev = false,
  });

  LivestockTwoModel? livestockTwoModelObj;
  bool done;
  bool next;
  bool prev;
  @override
  List<Object?> get props => [
        livestockTwoModelObj,
        done,
        next,
        prev,
      ];
  LivestockTwoState copyWith({
    LivestockTwoModel? livestockTwoModelObj,
    bool? done,
    bool? next,
    bool? prev,
  }) {
    return LivestockTwoState(
      livestockTwoModelObj: livestockTwoModelObj ?? this.livestockTwoModelObj,
      done: done ?? this.done,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }
}
