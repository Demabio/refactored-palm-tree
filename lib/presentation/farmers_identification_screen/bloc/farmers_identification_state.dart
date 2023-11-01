// ignore_for_file: must_be_immutable

part of 'farmers_identification_bloc.dart';

/// Represents the state of FarmersIdentification in the application.
class FarmersIdentificationState extends Equatable {
  FarmersIdentificationState({
    this.farmersIdentificationModelObj,
    this.done = false,
    this.next = false,
    this.prev = false,
  });

  FarmersIdentificationModel? farmersIdentificationModelObj;
  bool done;
  bool next;
  bool prev;

  @override
  List<Object?> get props => [
        farmersIdentificationModelObj,
        done,
        next,
        prev,
      ];
  FarmersIdentificationState copyWith({
    FarmersIdentificationModel? farmersIdentificationModelObj,
    bool? done,
    bool? next,
    bool? prev,
  }) {
    return FarmersIdentificationState(
      farmersIdentificationModelObj:
          farmersIdentificationModelObj ?? this.farmersIdentificationModelObj,
      done: done ?? this.done,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }
}
