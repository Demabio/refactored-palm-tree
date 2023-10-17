// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class AgeGroupModel extends Equatable {
  AgeGroupModel({
    this.title = "Ayrshi",
    this.isSelected = false,
    this.ageGroupId,
    this.categoryid,
    this.subcategoryid,
    this.livestockCat,
    this.livestockSubCat,
    this.female,
    this.male,
    this.females,
    this.males,
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

  String? males;

  String? females;

  FocusNode? focusNode;

  FocusNode? femalefocusNode;

  AgeGroupModel copyWith({
    String? ayrshi,
    bool? isSelected,
    int? ageGroupId,
    int? categoryid,
    int? subcategoryid,
    String? livestockCat,
    String? livestockSubCat,
    TextEditingController? male,
    TextEditingController? female,
    String? males,
    String? females,
    FocusNode? focusNode,
    FocusNode? femalefocusNode,
  }) {
    return AgeGroupModel(
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
      males: males ?? this.males,
      females: females ?? this.females,
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
        females,
        males,
        focusNode,
        femalefocusNode,
      ];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isSelected': isSelected,
      'male': male?.text == "" ? "0" : male?.text,
      'female': female?.text == "" ? "0" : female?.text,
      'ageGroupId': ageGroupId,
      // Add other properties as needed...
    };
  }

  factory AgeGroupModel.fromJson(Map<String, dynamic> json) {
    return AgeGroupModel(
      title: json['title'],
      isSelected: json['isSelected'],
      male: json['male'] != null
          ? TextEditingController(text: json['male'])
          : null,
      female: json['female'] != null
          ? TextEditingController(text: json['female'])
          : null,
      ageGroupId: json['ageGroupId'],
      categoryid: json['categoryid'],
      subcategoryid: json['subcategoryid'],
      livestockCat: json['livestockCat'],
      livestockSubCat: json['livestockSubCat'],
      females: json['female'],
      males: json['male'],
      // Add other properties as needed...
    );
  }
}
