// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_landandwatermgmt_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLandandwatermgmtTwoModel extends Equatable {
  AddLandandwatermgmtTwoModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.stepped = 1,
    this.stepped2 = 1,
    this.page1 = StepState.complete,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.lwProgress,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  int stepped;
  int stepped2;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;
  LWProgress? lwProgress;
  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddLandandwatermgmtTwoModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    int? stepped,
    int? stepped2,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    LWProgress? lwProgress,
  }) {
    return AddLandandwatermgmtTwoModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      stepped: stepped ?? this.stepped,
      stepped2: stepped2 ?? this.stepped2,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      lwProgress: lwProgress ?? this.lwProgress,
      selectedDropDownValue: selectedDropDownValue,
      selectedDropDownValue1: selectedDropDownValue1,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        stepped,
        stepped2,
        page1,
        page2,
        page3,
        page4,
        selectedDropDownValue,
        selectedDropDownValue1,
        lwProgress,
      ];
}
