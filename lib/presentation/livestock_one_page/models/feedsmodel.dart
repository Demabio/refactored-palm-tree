// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class FeedsModel extends Equatable {
  FeedsModel({
    this.title = "Ayrshi",
    this.isSelected = false,
    this.enterpriseId,
    this.categoryid,
    this.subcategoryid,
    this.livestockCat,
    this.livestockSubCat,
    this.female,
    this.male,
    this.focusNode,
    this.femalefocusNode,
  });

  String title;

  bool isSelected;

  TextEditingController? male;

  TextEditingController? female;

  int? enterpriseId;

  int? categoryid;

  int? subcategoryid;

  String? livestockCat;

  String? livestockSubCat;

  FocusNode? focusNode;

  FocusNode? femalefocusNode;

  FeedsModel copyWith({
    String? title,
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
    return FeedsModel(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      enterpriseId: ageGroupId ?? this.enterpriseId,
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
        enterpriseId,
        livestockSubCat,
        livestockCat,
        female,
        male,
        focusNode,
        femalefocusNode,
      ];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isSelected': isSelected,
      'male': male?.text,
      'female': female?.text,
      'enterpriseId': enterpriseId,
      // Add other properties as needed...
    };
  }

  factory FeedsModel.fromJson(Map<String, dynamic> json) {
    return FeedsModel(
      title: json['title'],
      isSelected: json['isSelected'],
      male: json['male'] != null
          ? TextEditingController(text: json['male'])
          : null,
      female: json['female'] != null
          ? TextEditingController(text: json['female'])
          : null,
      enterpriseId: json['enterpriseId'],
      categoryid: json['categoryid'],
      subcategoryid: json['subcategoryid'],
      livestockCat: json['livestockCat'],
      livestockSubCat: json['livestockSubCat'],
      // Add other properties as needed...
    );
  }
}
