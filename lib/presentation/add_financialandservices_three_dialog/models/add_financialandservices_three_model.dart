// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

/// This class defines the variables used in the [add_financialandservices_three_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesThreeModel extends Equatable {
  AddFinancialandservicesThreeModel({
    this.models = const [],
    this.count = 0,
  }) {}
  List<CheckBoxList> models;

  int count;
  AddFinancialandservicesThreeModel copyWith({
    List<CheckBoxList>? models,
    int? count,
  }) {
    return AddFinancialandservicesThreeModel(
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
