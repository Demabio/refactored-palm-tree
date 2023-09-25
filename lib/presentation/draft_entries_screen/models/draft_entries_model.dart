// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'balancehistory_item_model.dart';/// This class defines the variables used in the [draft_entries_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DraftEntriesModel extends Equatable {DraftEntriesModel({this.balancehistoryItemList = const []}) {  }

List<BalancehistoryItemModel> balancehistoryItemList;

DraftEntriesModel copyWith({List<BalancehistoryItemModel>? balancehistoryItemList}) { return DraftEntriesModel(
balancehistoryItemList : balancehistoryItemList ?? this.balancehistoryItemList,
); } 
@override List<Object?> get props => [balancehistoryItemList];
 }
