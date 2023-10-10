// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'farm_item_model.dart';

/// This class defines the variables used in the [add_farm_holding_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFarmHoldingModel extends Equatable {
  AddFarmHoldingModel({
    this.farms = const [],
  }) {}
  List<FarmdetailsItemModel> farms;

  AddFarmHoldingModel copyWith({
    List<FarmdetailsItemModel>? farms,
  }) {
    return AddFarmHoldingModel(
      farms: farms ?? this.farms,
    );
  }

  @override
  List<Object?> get props => [
        farms,
      ];
}
