// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';import 'sectionlistdura_item_model.dart';/// This class defines the variables used in the [history_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HistoryModel extends Equatable {HistoryModel({this.sectionlistduraItemList = const []}) {  }

List<SectionlistduraItemModel> sectionlistduraItemList;

HistoryModel copyWith({List<SectionlistduraItemModel>? sectionlistduraItemList}) { return HistoryModel(
sectionlistduraItemList : sectionlistduraItemList ?? this.sectionlistduraItemList,
); } 
@override List<Object?> get props => [sectionlistduraItemList];
 }
