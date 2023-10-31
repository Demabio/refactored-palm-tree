// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/farmstructure.dart';

/// This class defines the variables used in the [add_farmtechandassets_four_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFarmtechandassetsFourModel extends Equatable {
  AddFarmtechandassetsFourModel({
    this.models = const [],
    this.count = 0,
    this.atProgress,
    this.categs,
  });
  List<CheckBoxList> models;

  ATProgress? atProgress;
  List<FarmerStructure>? categs;
  int count;
  AddFarmtechandassetsFourModel copyWith({
    List<CheckBoxList>? models,
    ATProgress? atProgress,
    int? count,
    List<FarmerStructure>? categs,
  }) {
    return AddFarmtechandassetsFourModel(
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
