// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'chipviewalbert_item_model.dart';import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [add_crop_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddCropOneModel extends Equatable {AddCropOneModel({this.chipviewalbertItemList = const [], this.dropdownItemList = const [], this.dropdownItemList1 = const [], this.dropdownItemList2 = const [], }) {  }

List<ChipviewalbertItemModel> chipviewalbertItemList;

List<SelectionPopupModel> dropdownItemList;

List<SelectionPopupModel> dropdownItemList1;

List<SelectionPopupModel> dropdownItemList2;

AddCropOneModel copyWith({List<ChipviewalbertItemModel>? chipviewalbertItemList, List<SelectionPopupModel>? dropdownItemList, List<SelectionPopupModel>? dropdownItemList1, List<SelectionPopupModel>? dropdownItemList2, }) { return AddCropOneModel(
chipviewalbertItemList : chipviewalbertItemList ?? this.chipviewalbertItemList,
dropdownItemList : dropdownItemList ?? this.dropdownItemList,
dropdownItemList1 : dropdownItemList1 ?? this.dropdownItemList1,
dropdownItemList2 : dropdownItemList2 ?? this.dropdownItemList2,
); } 
@override List<Object?> get props => [chipviewalbertItemList,dropdownItemList,dropdownItemList1,dropdownItemList2];
 }
