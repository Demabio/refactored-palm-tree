// ignore_for_file: must_be_immutable

part of 'add_farm_holding_bloc.dart';

/// Represents the state of AddFarmHolding in the application.
class AddFarmHoldingState extends Equatable {
  AddFarmHoldingState({this.addFarmHoldingModelObj});

  AddFarmHoldingModel? addFarmHoldingModelObj;

  @override
  List<Object?> get props => [
        addFarmHoldingModelObj,
      ];
  AddFarmHoldingState copyWith({AddFarmHoldingModel? addFarmHoldingModelObj}) {
    return AddFarmHoldingState(
      addFarmHoldingModelObj:
          addFarmHoldingModelObj ?? this.addFarmHoldingModelObj,
    );
  }
}
