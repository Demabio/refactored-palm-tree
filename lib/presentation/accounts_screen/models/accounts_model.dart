// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'userbalance_item_model.dart';/// This class defines the variables used in the [accounts_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AccountsModel extends Equatable {AccountsModel({this.userbalanceItemList = const []}) {  }

List<UserbalanceItemModel> userbalanceItemList;

AccountsModel copyWith({List<UserbalanceItemModel>? userbalanceItemList}) { return AccountsModel(
userbalanceItemList : userbalanceItemList ?? this.userbalanceItemList,
); } 
@override List<Object?> get props => [userbalanceItemList];
 }
