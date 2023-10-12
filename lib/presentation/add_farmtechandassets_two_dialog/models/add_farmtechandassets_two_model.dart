// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';

/// This class defines the variables used in the [add_farmtechandassets_two_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFarmtechandassetsTwoModel extends Equatable {
  AddFarmtechandassetsTwoModel({
    this.models = const [],
    this.atProgress,
    this.count = 0,
  }) {}

  List<CheckBoxList> models;

  int count;
  ATProgress? atProgress;
  AddFarmtechandassetsTwoModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    ATProgress? atProgress,
  }) {
    return AddFarmtechandassetsTwoModel(
      models: models ?? this.models,
      count: count ?? this.count,
      atProgress: atProgress ?? this.atProgress,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        atProgress,
      ];
}
