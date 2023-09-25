// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'package:kiamis_app/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [add_financialandservices_five_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddFinancialandservicesFiveModel extends Equatable {AddFinancialandservicesFiveModel({this.dropdownItemList = const []}) {  }

List<SelectionPopupModel> dropdownItemList;

AddFinancialandservicesFiveModel copyWith({List<SelectionPopupModel>? dropdownItemList}) { return AddFinancialandservicesFiveModel(
dropdownItemList : dropdownItemList ?? this.dropdownItemList,
); } 
@override List<Object?> get props => [dropdownItemList];
 }
