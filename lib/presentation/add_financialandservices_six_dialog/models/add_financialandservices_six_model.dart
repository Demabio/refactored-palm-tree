// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

/// This class defines the variables used in the [add_financialandservices_six_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesSixModel extends Equatable {
  AddFinancialandservicesSixModel({
    this.models = const [],
    this.count = 0,
  }) {}
  List<CheckBoxList> models;

  int count;
  AddFinancialandservicesSixModel copyWith({
    List<CheckBoxList>? models,
    int? count,
  }) {
    return AddFinancialandservicesSixModel(
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
