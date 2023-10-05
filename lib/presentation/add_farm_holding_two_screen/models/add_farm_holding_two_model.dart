// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';

/// This class defines the variables used in the [add_farm_holding_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFarmHoldingTwoModel extends Equatable {
  AddFarmHoldingTwoModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.stepped = 1,
    this.page1 = StepState.complete,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.count = 0,
    this.enterprises = const [],
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;
  int stepped;

  StepState? page1;

  StepState? page2;

  StepState? page3;
  int count;
  List<EnterpriseModel> enterprises;

  StepState? page4;
  AddFarmHoldingTwoModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    int? stepped,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    List<EnterpriseModel>? enterprises,
    int? count,
  }) {
    return AddFarmHoldingTwoModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      stepped: stepped ?? this.stepped,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      enterprises: enterprises ?? this.enterprises,
      count: count ?? this.count,
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
      ];
}
