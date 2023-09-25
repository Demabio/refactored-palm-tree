// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';/// This class is used in the [chipviewalbert_item_widget] screen.
class ChipviewalbertItemModel extends Equatable {ChipviewalbertItemModel({this.albertcrop = "Albert crop", this.isSelected = false, }) {  }

String albertcrop;

bool isSelected;

ChipviewalbertItemModel copyWith({String? albertcrop, bool? isSelected, }) { return ChipviewalbertItemModel(
albertcrop : albertcrop ?? this.albertcrop,
isSelected : isSelected ?? this.isSelected,
); } 
@override List<Object?> get props => [albertcrop,isSelected];
 }
