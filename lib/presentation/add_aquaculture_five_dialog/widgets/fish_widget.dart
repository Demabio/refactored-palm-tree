import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import '../../add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';

// ignore: must_be_immutable
class FishtemWidget extends StatelessWidget {
  FishtemWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
    this.edit,
    this.delete,
  }) : super(
          key: key,
        );

  CheckBoxList enterpriseModel;

  double? height;

  double? width;
  VoidCallback? edit;
  VoidCallback? delete;
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
                  "Fish:",
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.title,
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Fish Category:",
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.var1 ?? "N/A",
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Production System:",
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
            Row(
              children: [
                Text(
                  "Number of Fingerlings:",
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.var3 ?? "N/A",
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 15.v),
            Row(
              children: [
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame33,
                    margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                    onTap: () {
                      edit?.call();
                    }),
                Spacer(),
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame34,
                    margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                    onTap: () {
                      delete?.call();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
