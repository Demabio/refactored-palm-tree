// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/watersource.dart';

/// This class defines the variables used in the [add_landandwatermgmt_four_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtFourModel extends Equatable {
  AddLandandwatermgmtFourModel({
    this.models = const [],
    this.count = 0,
    this.lwProgress,
    this.water,
  });
  List<CheckBoxList> models;
  LWProgress? lwProgress;
  List<FarmerIrrigationWaterSource>? water;
  int count;
  AddLandandwatermgmtFourModel copyWith({
    List<CheckBoxList>? models,
    LWProgress? lwProgress,
    int? count,
    List<FarmerIrrigationWaterSource>? water,
  }) {
    return AddLandandwatermgmtFourModel(
      models: models ?? this.models,
      count: count ?? this.count,
      lwProgress: lwProgress ?? this.lwProgress,
      water: water ?? this.water,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        lwProgress,
        water,
      ];
}
