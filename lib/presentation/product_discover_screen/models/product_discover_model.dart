// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'productdetails1_item_model.dart';/// This class defines the variables used in the [product_discover_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductDiscoverModel extends Equatable {ProductDiscoverModel({this.productdetails1ItemList = const []}) {  }

List<Productdetails1ItemModel> productdetails1ItemList;

ProductDiscoverModel copyWith({List<Productdetails1ItemModel>? productdetails1ItemList}) { return ProductDiscoverModel(
productdetails1ItemList : productdetails1ItemList ?? this.productdetails1ItemList,
); } 
@override List<Object?> get props => [productdetails1ItemList];
 }
