// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

/// This class is used in the [chipviewayrshi_item_widget] screen.
class IrrigationProjectModel extends Equatable {
  IrrigationProjectModel({
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
    this.model = const [],
  });

  String title;

  bool isSelected;

  TextEditingController? male;

  TextEditingController? female;

  List<SelectionPopupModel> model;

  int? ageGroupId;

  int? categoryid;

  int? subcategoryid;

  String? livestockCat;

  String? livestockSubCat;

  FocusNode? focusNode;

  FocusNode? femalefocusNode;

  IrrigationProjectModel copyWith({
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
    List<SelectionPopupModel>? model,
  }) {
    return IrrigationProjectModel(
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
      model: model ?? this.model,
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
        model,
      ];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isSelected': isSelected,
      'male': male?.text,
      'female': female?.text,
      'ageGroupId': ageGroupId,
      // Add other properties as needed...
    };
  }

  factory IrrigationProjectModel.fromJson(Map<String, dynamic> json) {
    return IrrigationProjectModel(
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
      // Add other properties as needed...
    );
  }
}
