// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class AgeGroupmModel extends Equatable {
  AgeGroupmModel({
    this.title = "Ayrshi",
    this.isSelected = false,
    this.ageGroupId,
    this.categoryid,
    this.subcategoryid,
    this.livestockCat,
    this.livestockSubCat,
    this.female,
    this.male,
    this.focusNode,
    this.femalefocusNode,
  }) {}

  String title;

  bool isSelected;

  TextEditingController? male;

  TextEditingController? female;

  int? ageGroupId;

  int? categoryid;

  int? subcategoryid;

  String? livestockCat;

  String? livestockSubCat;

  FocusNode? focusNode;

  FocusNode? femalefocusNode;

  AgeGroupmModel copyWith({
    String? ayrshi,
    bool? isSelected,
    int? ageGroupId,
    int? categoryid,
    int? subcategoryid,
    String? livestockCat,
    String? livestockSubCat,
    TextEditingController? male,
    TextEditingController? female,
    FocusNode? focusNode,
    FocusNode? femalefocusNode,
  }) {
    return AgeGroupmModel(
      title: ayrshi ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      ageGroupId: ageGroupId ?? this.ageGroupId,
      categoryid: categoryid ?? this.categoryid,
      subcategoryid: subcategoryid ?? this.subcategoryid,
      livestockCat: livestockCat ?? this.livestockCat,
      livestockSubCat: livestockSubCat ?? this.livestockSubCat,
      male: male ?? this.male,
      female: female ?? this.female,
      focusNode: focusNode ?? this.focusNode,
      femalefocusNode: femalefocusNode ?? this.femalefocusNode,
    );
  }

  @override
  List<Object?> get props => [
        title,
        isSelected,
        subcategoryid,
        categoryid,
        ageGroupId,
        livestockSubCat,
        livestockCat,
        female,
        male,
        focusNode,
        femalefocusNode,
      ];
}
