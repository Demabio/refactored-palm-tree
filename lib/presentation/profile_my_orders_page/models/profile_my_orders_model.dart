// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'profile_my_item_model.dart';/// This class defines the variables used in the [profile_my_orders_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileMyOrdersModel extends Equatable {ProfileMyOrdersModel({this.profileMyItemList = const []}) {  }

List<ProfileMyItemModel> profileMyItemList;

ProfileMyOrdersModel copyWith({List<ProfileMyItemModel>? profileMyItemList}) { return ProfileMyOrdersModel(
profileMyItemList : profileMyItemList ?? this.profileMyItemList,
); } 
@override List<Object?> get props => [profileMyItemList];
 }
