// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';

/// This class defines the variables used in the [add_landandwatermgmt_seven_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtSevenModel extends Equatable {
  AddLandandwatermgmtSevenModel({
    this.models = const [],
    this.count = 0,
    this.lwProgress,
  }) {}
  List<CheckBoxList> models;

  int count;
  LWProgress? lwProgress;

  AddLandandwatermgmtSevenModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    LWProgress? lwProgress,
  }) {
    return AddLandandwatermgmtSevenModel(
      models: models ?? this.models,
      count: count ?? this.count,
      lwProgress: lwProgress ?? this.lwProgress,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        lwProgress,
      ];
}
