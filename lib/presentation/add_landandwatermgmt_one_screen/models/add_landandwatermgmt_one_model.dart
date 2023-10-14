// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_landandwatermgmt_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtOneModel extends Equatable {
  AddLandandwatermgmtOneModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.stepped = 0,
    this.stepped2 = 0,
    this.page1 = StepState.indexed,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.lwProgress,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;
  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;
  int stepped;
  int stepped2;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;
  LWProgress? lwProgress;

  AddLandandwatermgmtOneModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? dropdownItemList2,
    int? stepped,
    int? stepped2,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    LWProgress? lwProgress,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
  }) {
    return AddLandandwatermgmtOneModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      stepped: stepped ?? this.stepped,
      stepped2: stepped2 ?? this.stepped2,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      lwProgress: lwProgress ?? this.lwProgress,
      selectedDropDownValue: selectedDropDownValue,
      selectedDropDownValue1: selectedDropDownValue1,
      selectedDropDownValue2: selectedDropDownValue2,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        stepped,
        stepped2,
        page1,
        page2,
        page3,
        page4,
        lwProgress,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
      ];
}
