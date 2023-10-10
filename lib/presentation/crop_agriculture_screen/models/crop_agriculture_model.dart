// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'cropdetails_item_model.dart';

/// This class defines the variables used in the [crop_agriculture_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CropAgricultureModel extends Equatable {
  CropAgricultureModel({this.cropdetailsItemList = const []}) {}

  List<CropdetailsItemModel> cropdetailsItemList;

  CropAgricultureModel copyWith(
      {List<CropdetailsItemModel>? cropdetailsItemList}) {
    return CropAgricultureModel(
      cropdetailsItemList: cropdetailsItemList ?? this.cropdetailsItemList,
    );
  }

  @override
  List<Object?> get props => [cropdetailsItemList];
}
