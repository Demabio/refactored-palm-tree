// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

/// This class defines the variables used in the [add_landandwatermgmt_five_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtFiveModel extends Equatable {
  AddLandandwatermgmtFiveModel({
    this.models = const [],
    this.count = 0,
  }) {}
  List<CheckBoxList> models;

  int count;
  AddLandandwatermgmtFiveModel copyWith({
    List<CheckBoxList>? models,
    int? count,
  }) {
    return AddLandandwatermgmtFiveModel(
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
