// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [add_aquaculture_four_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddAquacultureFourModel extends Equatable {AddAquacultureFourModel({this.dropdownItemList = const [], this.dropdownItemList1 = const [], this.dropdownItemList2 = const [], this.dropdownItemList3 = const [], this.dropdownItemList4 = const [], this.dropdownItemList5 = const [], }) {  }

List<SelectionPopupModel> dropdownItemList;

List<SelectionPopupModel> dropdownItemList1;

List<SelectionPopupModel> dropdownItemList2;

List<SelectionPopupModel> dropdownItemList3;

List<SelectionPopupModel> dropdownItemList4;

List<SelectionPopupModel> dropdownItemList5;

AddAquacultureFourModel copyWith({List<SelectionPopupModel>? dropdownItemList, List<SelectionPopupModel>? dropdownItemList1, List<SelectionPopupModel>? dropdownItemList2, List<SelectionPopupModel>? dropdownItemList3, List<SelectionPopupModel>? dropdownItemList4, List<SelectionPopupModel>? dropdownItemList5, }) { return AddAquacultureFourModel(
dropdownItemList : dropdownItemList ?? this.dropdownItemList,
dropdownItemList1 : dropdownItemList1 ?? this.dropdownItemList1,
dropdownItemList2 : dropdownItemList2 ?? this.dropdownItemList2,
dropdownItemList3 : dropdownItemList3 ?? this.dropdownItemList3,
dropdownItemList4 : dropdownItemList4 ?? this.dropdownItemList4,
dropdownItemList5 : dropdownItemList5 ?? this.dropdownItemList5,
); } 
@override List<Object?> get props => [dropdownItemList,dropdownItemList1,dropdownItemList2,dropdownItemList3,dropdownItemList4,dropdownItemList5];
 }
