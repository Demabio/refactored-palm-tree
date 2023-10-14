// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

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
    this.var1,
    this.var2,
    this.var3,
    this.var4,
    this.var5,
    this.var6,
    this.model = const [],
    this.drop,
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

  String? var1;
  String? var2;
  String? var3;
  String? var4;
  String? var5;
  String? var6;

  FocusNode? focusNode;

  FocusNode? femalefocusNode;

  List<SelectionPopupModel> model;
  SelectionPopupModel? drop;
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
    String? var1,
    String? var2,
    String? var3,
    String? var4,
    String? var5,
    String? var6,
    List<SelectionPopupModel>? model,
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
      var1: var1 ?? this.var1,
      var2: var2 ?? this.var2,
      var3: var3 ?? this.var3,
      var4: var4 ?? this.var4,
      var5: var5 ?? this.var5,
      var6: var6 ?? this.var6,
      model: model ?? this.model,
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
        var1,
        var2,
        var3,
        var4,
        var5,
        var6,
        model,
      ];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isSelected': isSelected,
      'male': male?.text,
      'female': female?.text,
      'enterpriseId': id,
      'var1': var1,
      'var2': var2,
      'var3': var3,
      'var4': var4,
      'var5': var5,
      'var6': var6,

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
      var1: json['var1'],
      var2: json['var2'],
      var3: json['var3'],
      var4: json['var4'],
      var5: json['var5'],
      var6: json['var6'],

      // Add other properties as needed...
    );
  }
}
