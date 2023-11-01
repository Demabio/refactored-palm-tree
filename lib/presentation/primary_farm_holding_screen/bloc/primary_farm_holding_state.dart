// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_bloc.dart';

/// Represents the state of PrimaryFarmHolding in the application.
class PrimaryFarmHoldingState extends Equatable {
  PrimaryFarmHoldingState({
    this.primaryFarmHoldingModelObj,
    this.done = false,
    this.next = false,
    this.next2 = false,
    this.prev = false,
  });

  PrimaryFarmHoldingModel? primaryFarmHoldingModelObj;
  bool done;
  bool next;
  bool next2;
  bool prev;

  @override
  List<Object?> get props => [
        primaryFarmHoldingModelObj,
        done,
        next,
        next2,
        prev,
      ];
  PrimaryFarmHoldingState copyWith({
    PrimaryFarmHoldingModel? primaryFarmHoldingModelObj,
    bool? done,
    bool? next,
    bool? next2,
    bool? prev,
  }) {
    return PrimaryFarmHoldingState(
      primaryFarmHoldingModelObj:
          primaryFarmHoldingModelObj ?? this.primaryFarmHoldingModelObj,
      done: done ?? this.done,
      next: next ?? this.next,
      next2: next2 ?? this.next2,
      prev: prev ?? this.prev,
    );
  }
}
