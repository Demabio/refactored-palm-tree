// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'chipviewalbert_item_model.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_crop_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddCropOneModel extends Equatable {
  AddCropOneModel({
    this.chipviewalbertItemList = const [],
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.stepped = 0,
    this.page1 = StepState.indexed,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
  }) {}

  List<ChipviewalbertItemModel> chipviewalbertItemList;

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;

  int stepped;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;

  AddCropOneModel copyWith({
    List<ChipviewalbertItemModel>? chipviewalbertItemList,
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? dropdownItemList2,
    int? stepped,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
  }) {
    return AddCropOneModel(
      chipviewalbertItemList:
          chipviewalbertItemList ?? this.chipviewalbertItemList,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      stepped: stepped ?? this.stepped,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
    );
  }

  @override
  List<Object?> get props => [
        chipviewalbertItemList,
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        stepped,
        page1,
        page2,
        page3,
        page4,
      ];
}
