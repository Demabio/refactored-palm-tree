// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';

/// This class defines the variables used in the [add_landandwatermgmt_five_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtFiveModel extends Equatable {
  AddLandandwatermgmtFiveModel({
    this.models = const [],
    this.count = 0,
    this.fsProgress,
  }) {}
  List<CheckBoxList> models;
  LWProgress? fsProgress;

  int count;
  AddLandandwatermgmtFiveModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    LWProgress? fsProgress,
  }) {
    return AddLandandwatermgmtFiveModel(
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
