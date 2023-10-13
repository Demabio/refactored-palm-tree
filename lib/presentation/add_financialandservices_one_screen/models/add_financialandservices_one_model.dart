// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_financialandservices_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesOneModel extends Equatable {
  AddFinancialandservicesOneModel({
    this.dropdownItemList = const [],
    this.stepped = 0,
    this.stepped2 = 0,
    this.page1 = StepState.indexed,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.fsProgress,
    this.selectedDropDownValue,
  }) {}
  int stepped;
  int stepped2;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;

  List<SelectionPopupModel> dropdownItemList;
  FSProgress? fsProgress;
  SelectionPopupModel? selectedDropDownValue;

  AddFinancialandservicesOneModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    int? stepped,
    int? stepped2,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    FSProgress? fsProgress,
    SelectionPopupModel? selectedDropDownValue,
  }) {
    return AddFinancialandservicesOneModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      stepped: stepped ?? this.stepped,
      stepped2: stepped2 ?? this.stepped2,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      fsProgress: fsProgress ?? this.fsProgress,
      selectedDropDownValue: selectedDropDownValue,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        stepped,
        stepped2,
        page1,
        page2,
        page3,
        page4,
        fsProgress,
        selectedDropDownValue,
      ];
}
