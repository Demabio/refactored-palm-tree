// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [home_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({this.userprofileItemList = const [], this.dbExists}) {}

  List<UserprofileItemModel> userprofileItemList;

  bool? dbExists;

  HomeModel copyWith({
    List<UserprofileItemModel>? userprofileItemList,
    bool? dbExists,
  }) {
    return HomeModel(
      userprofileItemList: userprofileItemList ?? this.userprofileItemList,
      dbExists: dbExists ?? this.dbExists,
    );
  }

  @override
  List<Object?> get props => [
        userprofileItemList,
        dbExists,
      ];
}
