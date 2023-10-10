// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [primary_farm_holding_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PrimaryFarmHoldingOneModel extends Equatable {
  PrimaryFarmHoldingOneModel({
    this.dropdownItemList = const [],
    this.stepped = 0,
    this.page1 = StepState.indexed,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.farm,
    this.pfProgress,
    this.stepped2 = 0,
    this.selectedDropDownValue,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  int stepped;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;

  FarmerFarm? farm;

  PFProgress? pfProgress;
  int stepped2;
  SelectionPopupModel? selectedDropDownValue;

  PrimaryFarmHoldingOneModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    int? stepped,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    FarmerFarm? farm,
    PFProgress? pfProgress,
    int? stepped2,
    SelectionPopupModel? selectedDropDownValue,
  }) {
    return PrimaryFarmHoldingOneModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      stepped: stepped ?? this.stepped,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      farm: farm ?? this.farm,
      pfProgress: pfProgress ?? this.pfProgress,
      stepped2: stepped2 ?? this.stepped2,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        stepped,
        page1,
        page2,
        page3,
        page4,
        pfProgress,
        farm,
        stepped2,
        selectedDropDownValue,
      ];
}
