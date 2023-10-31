// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_financialandservices_four_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesFourModel extends Equatable {
  AddFinancialandservicesFourModel({
    this.dropdownItemList = const [],
    this.ageGroupmModels = const [],
    this.count = 0,
    this.fsProgress,
    this.groups,
  });

  List<SelectionPopupModel> dropdownItemList;
  FSProgress? fsProgress;

  List<CheckBoxList> ageGroupmModels;
  List<FarmerCooperativeGroup>? groups;
  int count;
  AddFinancialandservicesFourModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<CheckBoxList>? ageGroupmModels,
    FSProgress? fsProgress,
    int? count,
    List<FarmerCooperativeGroup>? groups,
  }) {
    return AddFinancialandservicesFourModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      ageGroupmModels: ageGroupmModels ?? this.ageGroupmModels,
      count: count ?? this.count,
      fsProgress: fsProgress ?? this.fsProgress,
      groups: groups ?? this.groups,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        ageGroupmModels,
        count,
        fsProgress,
        groups,
      ];
}
