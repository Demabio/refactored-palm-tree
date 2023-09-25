// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';/// This class is used in the [chipviewayrshi_item_widget] screen.
class ChipviewayrshiItemModel extends Equatable {ChipviewayrshiItemModel({this.ayrshi = "Ayrshi", this.isSelected = false, }) {  }

String ayrshi;

bool isSelected;

ChipviewayrshiItemModel copyWith({String? ayrshi, bool? isSelected, }) { return ChipviewayrshiItemModel(
ayrshi : ayrshi ?? this.ayrshi,
isSelected : isSelected ?? this.isSelected,
); } 
@override List<Object?> get props => [ayrshi,isSelected];
 }
