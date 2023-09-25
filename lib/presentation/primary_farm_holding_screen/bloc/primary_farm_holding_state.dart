// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_bloc.dart';

/// Represents the state of PrimaryFarmHolding in the application.
class PrimaryFarmHoldingState extends Equatable {
  PrimaryFarmHoldingState({this.primaryFarmHoldingModelObj});

  PrimaryFarmHoldingModel? primaryFarmHoldingModelObj;

  @override
  List<Object?> get props => [
        primaryFarmHoldingModelObj,
      ];
  PrimaryFarmHoldingState copyWith(
      {PrimaryFarmHoldingModel? primaryFarmHoldingModelObj}) {
    return PrimaryFarmHoldingState(
      primaryFarmHoldingModelObj:
          primaryFarmHoldingModelObj ?? this.primaryFarmHoldingModelObj,
    );
  }
}
