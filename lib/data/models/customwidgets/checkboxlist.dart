// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class CheckBoxList extends Equatable {
  CheckBoxList({
    this.title = "Ayrshi",
    this.isSelected = false,
    this.id,
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

  int? id;

  int? categoryid;

  int? subcategoryid;

  String? livestockCat;

  String? livestockSubCat;

  FocusNode? focusNode;

  FocusNode? femalefocusNode;

  CheckBoxList copyWith({
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
    return CheckBoxList(
      title: ayrshi ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      id: ageGroupId ?? this.id,
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
        id,
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
      'enterpriseId': id,
      // Add other properties as needed...
    };
  }

  factory CheckBoxList.fromJson(Map<String, dynamic> json) {
    return CheckBoxList(
      title: json['title'],
      isSelected: json['isSelected'],
      male: json['male'] != null
          ? TextEditingController(text: json['male'])
          : null,
      female: json['female'] != null
          ? TextEditingController(text: json['female'])
          : null,
      id: json['enterpriseId'],
      categoryid: json['categoryid'],
      subcategoryid: json['subcategoryid'],
      livestockCat: json['livestockCat'],
      livestockSubCat: json['livestockSubCat'],
      // Add other properties as needed...
    );
  }
}
