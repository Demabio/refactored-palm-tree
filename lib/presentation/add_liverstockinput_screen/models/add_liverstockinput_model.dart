// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockservice.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_liverstockinput_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddLiverstockinputModel extends Equatable {
  AddLiverstockinputModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
    this.dropdownItemList2 = const [],
    this.dropdownItemList3 = const [],
    this.dropdownItemList4 = const [],
    this.dropdownItemList5 = const [],
    this.dropdownItemList6 = const [],
    this.dropdownItemList7 = const [],
    this.livestockins,
    this.lsProgress,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.selectedDropDownValue5,
    this.selectedDropDownValue6,
    this.selectedDropDownValue7,
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  List<SelectionPopupModel> dropdownItemList2;

  List<SelectionPopupModel> dropdownItemList3;

  List<SelectionPopupModel> dropdownItemList4;

  List<SelectionPopupModel> dropdownItemList5;

  List<SelectionPopupModel> dropdownItemList6;

  List<SelectionPopupModel> dropdownItemList7;

  FarmerLivestockService? livestockins;
  LSProgress? lsProgress;
  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  SelectionPopupModel? selectedDropDownValue5;

  SelectionPopupModel? selectedDropDownValue6;

  SelectionPopupModel? selectedDropDownValue7;

  AddLiverstockinputModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
    List<SelectionPopupModel>? dropdownItemList2,
    List<SelectionPopupModel>? dropdownItemList3,
    List<SelectionPopupModel>? dropdownItemList4,
    List<SelectionPopupModel>? dropdownItemList5,
    List<SelectionPopupModel>? dropdownItemList6,
    List<SelectionPopupModel>? dropdownItemList7,
    FarmerLivestockService? livestockins,
    LSProgress? lsProgress,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    SelectionPopupModel? selectedDropDownValue5,
    SelectionPopupModel? selectedDropDownValue6,
    SelectionPopupModel? selectedDropDownValue7,
  }) {
    return AddLiverstockinputModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
      dropdownItemList2: dropdownItemList2 ?? this.dropdownItemList2,
      dropdownItemList3: dropdownItemList3 ?? this.dropdownItemList3,
      dropdownItemList4: dropdownItemList4 ?? this.dropdownItemList4,
      dropdownItemList5: dropdownItemList5 ?? this.dropdownItemList5,
      dropdownItemList6: dropdownItemList6 ?? this.dropdownItemList6,
      dropdownItemList7: dropdownItemList7 ?? this.dropdownItemList7,
      lsProgress: lsProgress ?? this.lsProgress,
      livestockins: livestockins ?? this.livestockins,
      selectedDropDownValue: selectedDropDownValue,
      selectedDropDownValue1: selectedDropDownValue1,
      selectedDropDownValue2: selectedDropDownValue2,
      selectedDropDownValue3: selectedDropDownValue3,
      selectedDropDownValue4: selectedDropDownValue4,
      selectedDropDownValue5: selectedDropDownValue5,
      selectedDropDownValue6: selectedDropDownValue6,
      selectedDropDownValue7: selectedDropDownValue7,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        dropdownItemList1,
        dropdownItemList2,
        dropdownItemList3,
        dropdownItemList4,
        dropdownItemList5,
        dropdownItemList6,
        dropdownItemList7,
        lsProgress,
        livestockins,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        selectedDropDownValue5,
        selectedDropDownValue6,
        selectedDropDownValue7,
      ];
}
