// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class AgeGroupmModel extends Equatable {
  AgeGroupmModel({
    this.title = "Ayrshi",
    this.isSelected = false,
    this.livestockid,
    this.categoryid,
    this.subcategoryid,
    this.livestockCat,
    this.livestockSubCat,
    this.female,
    this.male,
  }) {}

  String title;

  bool isSelected;

  TextEditingController? male;

  TextEditingController? female;

  int? livestockid;

  int? categoryid;

  int? subcategoryid;

  String? livestockCat;

  String? livestockSubCat;

  AgeGroupmModel copyWith({
    String? ayrshi,
    bool? isSelected,
    int? livestockid,
    int? categoryid,
    int? subcategoryid,
    String? livestockCat,
    String? livestockSubCat,
    TextEditingController? male,
    TextEditingController? female,
  }) {
    return AgeGroupmModel(
      title: ayrshi ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      livestockid: livestockid ?? this.livestockid,
      categoryid: categoryid ?? this.categoryid,
      subcategoryid: subcategoryid ?? this.subcategoryid,
      livestockCat: livestockCat ?? this.livestockCat,
      livestockSubCat: livestockSubCat ?? this.livestockSubCat,
      male: male ?? this.male,
      female: female ?? this.female,
    );
  }

  @override
  List<Object?> get props => [
        title,
        isSelected,
        subcategoryid,
        categoryid,
        livestockid,
        livestockSubCat,
        livestockCat,
        female,
        male,
      ];
}
