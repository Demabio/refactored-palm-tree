// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_crop_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddCropTwoModel extends Equatable {
  AddCropTwoModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.dropdownItemList3 = const [],
    this.dropdownItemList4 = const [],
    this.stepped = 1,
    this.page1 = StepState.complete,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.crop,
    this.caProgressDB,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.stepped2 = 0,
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

  CAProgress? caProgressDB;
  FarmerCrop? crop;
  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;
  int stepped2;

  AddCropTwoModel copyWith({
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
    CAProgress? caProgressDB,
    FarmerCrop? crop,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    int? stepped2,
  }) {
    return AddCropTwoModel(
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
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      selectedDropDownValue3:
          selectedDropDownValue3 ?? this.selectedDropDownValue3,
      selectedDropDownValue4:
          selectedDropDownValue4 ?? this.selectedDropDownValue4,
      stepped2: stepped2 ?? this.stepped2,
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
        caProgressDB,
        crop,
        stepped2,
      ];
}
