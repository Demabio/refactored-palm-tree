// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'main_landing_item_model.dart';import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [main_landing_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MainLandingModel extends Equatable {MainLandingModel({this.mainLandingItemList = const [], this.dropdownItemList = const [], this.dropdownItemList1 = const [], this.dropdownItemList2 = const [], }) {  }

List<MainLandingItemModel> mainLandingItemList;

List<SelectionPopupModel> dropdownItemList;

List<SelectionPopupModel> dropdownItemList1;

List<SelectionPopupModel> dropdownItemList2;

MainLandingModel copyWith({List<MainLandingItemModel>? mainLandingItemList, List<SelectionPopupModel>? dropdownItemList, List<SelectionPopupModel>? dropdownItemList1, List<SelectionPopupModel>? dropdownItemList2, }) { return MainLandingModel(
mainLandingItemList : mainLandingItemList ?? this.mainLandingItemList,
dropdownItemList : dropdownItemList ?? this.dropdownItemList,
dropdownItemList1 : dropdownItemList1 ?? this.dropdownItemList1,
dropdownItemList2 : dropdownItemList2 ?? this.dropdownItemList2,
); } 
@override List<Object?> get props => [mainLandingItemList,dropdownItemList,dropdownItemList1,dropdownItemList2];
 }
