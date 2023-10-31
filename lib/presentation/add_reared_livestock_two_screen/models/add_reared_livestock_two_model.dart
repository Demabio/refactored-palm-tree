// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'chipviewayrshi2_item_model.dart';
import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_reared_livestock_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddRearedLivestockTwoModel extends Equatable {
  AddRearedLivestockTwoModel({
    this.chipviewayrshi2ItemList = const [],
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
  });

  List<Chipviewayrshi2ItemModel> chipviewayrshi2ItemList;

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  AddRearedLivestockTwoModel copyWith({
    List<Chipviewayrshi2ItemModel>? chipviewayrshi2ItemList,
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
  }) {
    return AddRearedLivestockTwoModel(
      chipviewayrshi2ItemList:
          chipviewayrshi2ItemList ?? this.chipviewayrshi2ItemList,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
    );
  }

  @override
  List<Object?> get props =>
      [chipviewayrshi2ItemList, dropdownItemList, dropdownItemList1];
}
