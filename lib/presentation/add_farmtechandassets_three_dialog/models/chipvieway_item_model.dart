// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class ChipviewayItemModel extends Equatable {
  ChipviewayItemModel({
    this.name = "Ayrshi",
    this.isSelected = false,
    this.nameid,
    this.categoryid,
    this.subcategoryid,
    this.namecat,
    this.livestockSubCat,
  }) {}

  String name;

  bool isSelected;

  int? nameid;

  int? categoryid;

  int? subcategoryid;

  String? namecat;

  String? livestockSubCat;

  ChipviewayItemModel copyWith({
    String? name,
    bool? isSelected,
    int? nameid,
    int? categoryid,
    int? subcategoryid,
    String? namecat,
    String? livestockSubCat,
  }) {
    return ChipviewayItemModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      nameid: nameid ?? this.nameid,
      categoryid: categoryid ?? this.categoryid,
      subcategoryid: subcategoryid ?? this.subcategoryid,
      namecat: namecat ?? this.namecat,
      livestockSubCat: livestockSubCat ?? this.livestockSubCat,
    );
  }

  @override
  List<Object?> get props => [
        name,
        isSelected,
        subcategoryid,
        categoryid,
        nameid,
        livestockSubCat,
        namecat,
      ];
}
