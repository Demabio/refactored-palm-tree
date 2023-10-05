// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

/// This class defines the variables used in the [add_aquaculture_six_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddAquacultureSixModel extends Equatable {
  AddAquacultureSixModel({
    this.models = const [],
    this.count = 0,
  }) {}
  List<CheckBoxList> models;

  int count;
  AddAquacultureSixModel copyWith({
    List<CheckBoxList>? models,
    int? count,
  }) {
    return AddAquacultureSixModel(
      models: models ?? this.models,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
      ];
}
