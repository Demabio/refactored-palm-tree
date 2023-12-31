// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [farmers_identification_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmersIdentificationTwoModel extends Equatable {
  FarmersIdentificationTwoModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.stepped = 0,
    this.stepped2 = 0,
    this.page1 = StepState.complete,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.fiProgress,
    this.farmer,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
  });

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  int stepped;
  int stepped2;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;
  FIProgress? fiProgress;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  Farmer? farmer;
  FarmersIdentificationTwoModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    int? stepped,
    int? stepped2,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    FIProgress? fiProgress,
    Farmer? farmer,
  }) {
    return FarmersIdentificationTwoModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      stepped: stepped ?? this.stepped,
      stepped2: stepped2 ?? this.stepped2,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      farmer: farmer ?? this.farmer,
      fiProgress: fiProgress ?? this.fiProgress,
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
        fiProgress,
        farmer,
        selectedDropDownValue,
        selectedDropDownValue1,
      ];
}
