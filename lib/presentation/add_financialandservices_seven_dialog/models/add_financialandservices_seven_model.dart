// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';

/// This class defines the variables used in the [add_financialandservices_seven_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesSevenModel extends Equatable {
  AddFinancialandservicesSevenModel({
    this.models = const [],
    this.count = 0,
    this.fsProgress,
  });
  List<CheckBoxList> models;
  FSProgress? fsProgress;

  int count;
  AddFinancialandservicesSevenModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    FSProgress? fsProgress,
  }) {
    return AddFinancialandservicesSevenModel(
      models: models ?? this.models,
      count: count ?? this.count,
      fsProgress: fsProgress ?? this.fsProgress,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
        fsProgress,
      ];
}
