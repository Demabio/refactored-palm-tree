// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'gridproductname_item_model.dart';/// This class defines the variables used in the [product_search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductSearchModel extends Equatable {ProductSearchModel({this.gridproductnameItemList = const []}) {  }

List<GridproductnameItemModel> gridproductnameItemList;

ProductSearchModel copyWith({List<GridproductnameItemModel>? gridproductnameItemList}) { return ProductSearchModel(
gridproductnameItemList : gridproductnameItemList ?? this.gridproductnameItemList,
); } 
@override List<Object?> get props => [gridproductnameItemList];
 }
