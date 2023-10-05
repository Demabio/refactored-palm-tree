// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [farmers_identification_four_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmersIdentificationFourModel extends Equatable {
  FarmersIdentificationFourModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.dropdownItemList3 = const [],
    this.dropdownItemList4 = const [],
    this.stepped = 3,
    this.page1 = StepState.complete,
    this.page2 = StepState.complete,
    this.page3 = StepState.complete,
    this.page4 = StepState.indexed,
    this.isFarmer = false,
  }) {}

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

  bool isFarmer;

  FarmersIdentificationFourModel copyWith({
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
    bool? isFarmer,
  }) {
    return FarmersIdentificationFourModel(
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
      isFarmer: isFarmer ?? this.isFarmer,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        dropdownItemList3,
        dropdownItemList4,
        stepped,
        page1,
        page2,
        page3,
        page4,
        isFarmer,
      ];
}
