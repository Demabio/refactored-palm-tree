import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

// ignore: must_be_immutable
class CoopItemWidget extends StatelessWidget {
  CoopItemWidget(
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
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  enterpriseModel.title ?? "N/A",
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.var2 ?? "N/A",
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
