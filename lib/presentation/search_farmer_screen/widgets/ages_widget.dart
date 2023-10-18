import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/presentation/livestock_one_page/models/agesmodel.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';

import '../../add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

// ignore: must_be_immutable
class AgeItemWidget extends StatelessWidget {
  AgeItemWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  AgeGroupModel enterpriseModel;

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              enterpriseModel.title,
              style: theme.textTheme.labelMedium,
            ),
            Spacer(),
            Text(
              "Males: ${enterpriseModel.males ?? "0"}",
              style: theme.textTheme.labelMedium,
            ),
            Spacer(),
            Text(
              "Females: ${enterpriseModel.females ?? "0"}",
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
