// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishinput.dart';

/// This class defines the variables used in the [add_aquaculture_six_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddAquacultureSixModel extends Equatable {
  AddAquacultureSixModel({
    this.models = const [],
    this.count = 0,
    this.aqProgress,
    this.categs,
  });
  List<CheckBoxList> models;

  int count;
  AQProgress? aqProgress;
  List<FarmerFishInput>? categs;
  AddAquacultureSixModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    AQProgress? aqProgress,
    List<FarmerFishInput>? categs,
  }) {
    return AddAquacultureSixModel(
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
