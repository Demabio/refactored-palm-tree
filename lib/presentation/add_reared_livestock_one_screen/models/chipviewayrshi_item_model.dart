// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class ChipviewayrshiItemModel extends Equatable {
  ChipviewayrshiItemModel({
    this.ayrshi = "Ayrshi",
    this.isSelected = false,
    this.livestockid,
    this.categoryid,
    this.subcategoryid,
    this.livestockCat,
    this.livestockSubCat,
  }) {}

  String ayrshi;

  bool isSelected;

  int? livestockid;

  int? categoryid;

  int? subcategoryid;

  String? livestockCat;

  String? livestockSubCat;

  ChipviewayrshiItemModel copyWith({
    String? ayrshi,
    bool? isSelected,
    int? livestockid,
    int? categoryid,
    int? subcategoryid,
    String? livestockCat,
    String? livestockSubCat,
  }) {
    return ChipviewayrshiItemModel(
      ayrshi: ayrshi ?? this.ayrshi,
      isSelected: isSelected ?? this.isSelected,
      livestockid: livestockid ?? this.livestockid,
      categoryid: categoryid ?? this.categoryid,
      subcategoryid: subcategoryid ?? this.subcategoryid,
      livestockCat: livestockCat ?? this.livestockCat,
      livestockSubCat: livestockSubCat ?? this.livestockSubCat,
    );
  }

  @override
  List<Object?> get props => [
        ayrshi,
        isSelected,
        subcategoryid,
        categoryid,
        livestockid,
        livestockSubCat,
        livestockCat,
      ];
}
