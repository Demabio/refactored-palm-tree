// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_financialandservices_five_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesFiveModel extends Equatable {
  AddFinancialandservicesFiveModel({
    this.dropdownItemList = const [],
    this.models = const [],
    this.count = 0,
  }) {}

  List<SelectionPopupModel> dropdownItemList;
  List<CheckBoxList> models;

  int count;
  AddFinancialandservicesFiveModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<CheckBoxList>? models,
    int? count,
  }) {
    return AddFinancialandservicesFiveModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      models: models ?? this.models,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        models,
        count,
      ];
}
