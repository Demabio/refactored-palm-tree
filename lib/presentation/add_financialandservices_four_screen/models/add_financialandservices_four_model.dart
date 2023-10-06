// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/models/irrigationprojetmodel.dart';

/// This class defines the variables used in the [add_financialandservices_four_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesFourModel extends Equatable {
  AddFinancialandservicesFourModel({
    this.dropdownItemList = const [],
    this.ageGroupmModels = const [],
    this.count = 0,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<IrrigationProjectModel> ageGroupmModels;

  int count;
  AddFinancialandservicesFourModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<IrrigationProjectModel>? ageGroupmModels,
    int? count,
  }) {
    return AddFinancialandservicesFourModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      ageGroupmModels: ageGroupmModels ?? this.ageGroupmModels,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        ageGroupmModels,
        count,
      ];
}
