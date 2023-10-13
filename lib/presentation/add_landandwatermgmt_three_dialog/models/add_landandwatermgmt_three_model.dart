// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';

/// This class defines the variables used in the [add_landandwatermgmt_three_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtThreeModel extends Equatable {
  AddLandandwatermgmtThreeModel({
    this.models = const [],
    this.count = 0,
    this.fsProgress,
  }) {}
  List<CheckBoxList> models;

  int count;
  LWProgress? fsProgress;
  AddLandandwatermgmtThreeModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    LWProgress? fsProgress,
  }) {
    return AddLandandwatermgmtThreeModel(
      models: models ?? this.models,
      count: count ?? this.count,
      fsProgress: fsProgress ?? this.fsProgress,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        fsProgress,
      ];
}
