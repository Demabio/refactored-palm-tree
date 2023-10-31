// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/creditservice.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_financialandservices_five_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesFiveModel extends Equatable {
  AddFinancialandservicesFiveModel({
    this.dropdownItemList = const [],
    this.models = const [],
    this.count = 0,
    this.fsProgress,
    this.categs,
  });

  List<SelectionPopupModel> dropdownItemList;
  List<CheckBoxList> models;
  FSProgress? fsProgress;
  List<FarmerCreditService>? categs;
  int count;
  AddFinancialandservicesFiveModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<CheckBoxList>? models,
    FSProgress? fsProgress,
    int? count,
    List<FarmerCreditService>? categs,
  }) {
    return AddFinancialandservicesFiveModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      models: models ?? this.models,
      count: count ?? this.count,
      fsProgress: fsProgress ?? this.fsProgress,
      categs: categs ?? this.categs,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        models,
        count,
        fsProgress,
        categs,
      ];
}
