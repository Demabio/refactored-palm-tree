// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';

/// This class defines the variables used in the [add_financialandservices_eight_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesEightModel extends Equatable {
  AddFinancialandservicesEightModel({
    this.models = const [],
    this.count = 0,
    this.fsProgress,
  });
  List<CheckBoxList> models;
  FSProgress? fsProgress;

  int count;
  AddFinancialandservicesEightModel copyWith({
    List<CheckBoxList>? models,
    int? count,
    FSProgress? fsProgress,
  }) {
    return AddFinancialandservicesEightModel(
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
