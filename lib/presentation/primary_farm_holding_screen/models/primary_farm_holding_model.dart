// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';

/// This class defines the variables used in the [primary_farm_holding_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PrimaryFarmHoldingModel extends Equatable {
  PrimaryFarmHoldingModel({
    this.farm,
    this.pfProgress,
    this.enterprises = const [],
  }) {}
  FarmerFarm? farm;

  PFProgress? pfProgress;
  List<EnterpriseModel> enterprises;

  PrimaryFarmHoldingModel copyWith({
    FarmerFarm? farm,
    PFProgress? pfProgress,
    List<EnterpriseModel>? enterprises,
  }) {
    return PrimaryFarmHoldingModel(
      farm: farm ?? this.farm,
      pfProgress: pfProgress ?? this.pfProgress,
      enterprises: enterprises ?? this.enterprises,
    );
  }

  @override
  List<Object?> get props => [
        pfProgress,
        farm,
        enterprises,
      ];
}
