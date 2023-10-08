// ignore_for_file: must_be_immutable

import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [farmers_identification_three_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmersIdentificationThreeModel extends Equatable {
  FarmersIdentificationThreeModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.stepped = 2,
    this.page1 = StepState.complete,
    this.page2 = StepState.complete,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.fiProgress,
    this.farmer,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;

  int stepped;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;
  FIProgress? fiProgress;

  Farmer? farmer;
  FarmersIdentificationThreeModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? dropdownItemList2,
    int? stepped,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    FIProgress? fiProgress,
    Farmer? farmer,
  }) {
    return FarmersIdentificationThreeModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      stepped: stepped ?? this.stepped,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      farmer: farmer ?? this.farmer,
      fiProgress: fiProgress ?? this.fiProgress,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        stepped,
        page1,
        page2,
        page3,
        page4,
        fiProgress,
        farmer,
      ];
}
