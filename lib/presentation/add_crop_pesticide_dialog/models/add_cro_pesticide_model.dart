// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';

/// This class defines the variables used in the [add_landandwatermgmt_three_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddCropPesticideModel extends Equatable {
  AddCropPesticideModel({
    this.models = const [],
    this.count = 0,
    this.caProgressDB,
  }) {}
  List<CheckBoxList> models;

  int count;
  CAProgress? caProgressDB;
  AddCropPesticideModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    CAProgress? caProgressDB,
  }) {
    return AddCropPesticideModel(
      models: models ?? this.models,
      count: count ?? this.count,
      caProgressDB: caProgressDB ?? this.caProgressDB,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        caProgressDB,
      ];
}
