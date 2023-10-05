// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [primary_farm_holding_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PrimaryFarmHoldingTwoModel extends Equatable {
  PrimaryFarmHoldingTwoModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.stepped = 3,
    this.page1 = StepState.complete,
    this.page2 = StepState.complete,
    this.page3 = StepState.complete,
    this.page4 = StepState.indexed,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  int stepped;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;

  PrimaryFarmHoldingTwoModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    int? stepped,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
  }) {
    return PrimaryFarmHoldingTwoModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      stepped: stepped ?? this.stepped,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
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
      ];
}
