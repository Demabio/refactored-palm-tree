// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';

/// This class defines the variables used in the [primary_farm_holding_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PrimaryFarmHoldingTwoModel extends Equatable {
  PrimaryFarmHoldingTwoModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.enterprises = const [],
    this.dropdownItemList2 = const [],
    this.dropdownItemList3 = const [],
    this.dropdownItemList4 = const [],
    this.stepped = 1,
    this.page1 = StepState.complete,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.count = 0,
    this.farm,
    this.pfProgress,
    this.stepped2 = 0,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.enterprisesF = false,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
  });

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;

  List<SelectionPopupModel> dropdownItemList3;

  List<SelectionPopupModel> dropdownItemList4;
  int stepped;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;

  List<EnterpriseModel> enterprises;

  int count;
  FarmerFarm? farm;

  PFProgress? pfProgress;
  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;
  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  bool enterprisesF;
  int stepped2;
  PrimaryFarmHoldingTwoModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? dropdownItemList2,
    List<SelectionPopupModel>? dropdownItemList3,
    List<SelectionPopupModel>? dropdownItemList4,
    int? stepped,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    List<EnterpriseModel>? enterprises,
    int? count,
    FarmerFarm? farm,
    PFProgress? pfProgress,
    int? stepped2,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    bool? enterprisesF,
  }) {
    return PrimaryFarmHoldingTwoModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      dropdownItemList3: dropdownItemList3 ?? this.dropdownItemList3,
      dropdownItemList4: dropdownItemList4 ?? this.dropdownItemList4,
      stepped: stepped ?? this.stepped,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      enterprises: enterprises ?? this.enterprises,
      count: count ?? this.count,
      farm: farm ?? this.farm,
      pfProgress: pfProgress ?? this.pfProgress,
      stepped2: stepped2 ?? this.stepped2,
      selectedDropDownValue: selectedDropDownValue,
      selectedDropDownValue1: selectedDropDownValue1,
      enterprisesF: enterprisesF ?? this.enterprisesF,
      selectedDropDownValue2: selectedDropDownValue2,
      selectedDropDownValue3: selectedDropDownValue3,
      selectedDropDownValue4: selectedDropDownValue4,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        stepped,
        page1,
        page2,
        page3,
        page4,
        enterprises,
        count,
        pfProgress,
        farm,
        stepped2,
        selectedDropDownValue,
        selectedDropDownValue1,
        enterprisesF,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
      ];
}
