// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class ChipviewayItemModel extends Equatable {
  ChipviewayItemModel({
    this.fish = "Ayrshi",
    this.isSelected = false,
    this.fishid,
    this.categoryid,
    this.subcategoryid,
    this.fishCat,
    this.livestockSubCat,
  });

  String fish;

  bool isSelected;

  int? fishid;

  int? categoryid;

  int? subcategoryid;

  String? fishCat;

  String? livestockSubCat;

  ChipviewayItemModel copyWith({
    String? fish,
    bool? isSelected,
    int? fishid,
    int? categoryid,
    int? subcategoryid,
    String? fishCat,
    String? livestockSubCat,
  }) {
    return ChipviewayItemModel(
      fish: fish ?? this.fish,
      isSelected: isSelected ?? this.isSelected,
      fishid: fishid ?? this.fishid,
      categoryid: categoryid ?? this.categoryid,
      subcategoryid: subcategoryid ?? this.subcategoryid,
      fishCat: fishCat ?? this.fishCat,
      livestockSubCat: livestockSubCat ?? this.livestockSubCat,
    );
  }

  @override
  List<Object?> get props => [
        fish,
        isSelected,
        subcategoryid,
        categoryid,
        fishid,
        livestockSubCat,
        fishCat,
      ];
}
