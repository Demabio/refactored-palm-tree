// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';

/// This class defines the variables used in the [add_aquaculture_three_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddAquacultureThreeModel extends Equatable {
  AddAquacultureThreeModel({
    this.models = const [],
    this.count = 0,
    this.aqProgress,
    this.categs,
  });
  List<CheckBoxList> models;
  List<FarmerFishCategory>? categs;
  int count;
  AQProgress? aqProgress;

  AddAquacultureThreeModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    AQProgress? aqProgress,
    List<FarmerFishCategory>? categs,
  }) {
    return AddAquacultureThreeModel(
      models: models ?? this.models,
      count: count ?? this.count,
      aqProgress: aqProgress ?? this.aqProgress,
      categs: categs ?? this.categs,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        aqProgress,
        categs,
      ];
}
