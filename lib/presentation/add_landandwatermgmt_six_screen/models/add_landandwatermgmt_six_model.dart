// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_landandwatermgmt_six_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtSixModel extends Equatable {
  AddLandandwatermgmtSixModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.ageGroupmModels = const [],
    this.count = 0,
    this.lwProgress,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<CheckBoxList> ageGroupmModels;

  int count;
  LWProgress? lwProgress;

  AddLandandwatermgmtSixModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<CheckBoxList>? ageGroupmModels,
    int? count,
    LWProgress? lwProgress,
  }) {
    return AddLandandwatermgmtSixModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      ageGroupmModels: ageGroupmModels ?? this.ageGroupmModels,
      count: count ?? this.count,
      lwProgress: lwProgress ?? this.lwProgress,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        ageGroupmModels,
        count,
        lwProgress,
      ];
}
