import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

import '../../add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';

// ignore: must_be_immutable
class InputsWidget extends StatelessWidget {
  InputsWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  CheckBoxList enterpriseModel;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: enterpriseModel.isSelected,
      child: Container(
        alignment: Alignment.centerLeft,
        height: height,
        width: width,
        child: Text(
          enterpriseModel.title,
          style: theme.textTheme.labelMedium,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
