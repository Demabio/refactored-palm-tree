// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_farmtechandassets_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFarmtechandassetsOneModel extends Equatable {
  AddFarmtechandassetsOneModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.atProgress,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;
  ATProgress? atProgress;

  AddFarmtechandassetsOneModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    ATProgress? atProgress,
  }) {
    return AddFarmtechandassetsOneModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      selectedDropDownValue: selectedDropDownValue,
      selectedDropDownValue1: selectedDropDownValue1,
      atProgress: atProgress ?? this.atProgress,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        atProgress,
        selectedDropDownValue,
        selectedDropDownValue1,
      ];
}
