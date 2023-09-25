// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';/// This class is used in the [chipviewayrshi2_item_widget] screen.
class Chipviewayrshi2ItemModel extends Equatable {Chipviewayrshi2ItemModel({this.ayrshi = "Ayrshi", this.isSelected = false, }) {  }

String ayrshi;

bool isSelected;

Chipviewayrshi2ItemModel copyWith({String? ayrshi, bool? isSelected, }) { return Chipviewayrshi2ItemModel(
ayrshi : ayrshi ?? this.ayrshi,
isSelected : isSelected ?? this.isSelected,
); } 
@override List<Object?> get props => [ayrshi,isSelected];
 }
