// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/laboursource.dart';

/// This class defines the variables used in the [add_farmtechandassets_two_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFarmtechandassetsFiveModel extends Equatable {
  AddFarmtechandassetsFiveModel({
    this.models = const [],
    this.atProgress,
    this.count = 0,
    this.categs,
  });

  List<CheckBoxList> models;
  List<FarmerLabourSource>? categs;
  int count;
  ATProgress? atProgress;
  AddFarmtechandassetsFiveModel copyWith({
    List<CheckBoxList>? models,
    List<FarmerLabourSource>? categs,
    int? count,
    ATProgress? atProgress,
  }) {
    return AddFarmtechandassetsFiveModel(
      models: models ?? this.models,
      count: count ?? this.count,
      atProgress: atProgress ?? this.atProgress,
      categs: categs ?? this.categs,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        atProgress,
        categs,
      ];
}
