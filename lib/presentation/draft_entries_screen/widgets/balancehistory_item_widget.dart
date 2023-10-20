import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import '../models/balancehistory_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class BalancehistoryItemWidget extends StatelessWidget {
  BalancehistoryItemWidget(
    this.balancehistoryItemModelObj, {
    this.edit,
    this.delete,
    Key? key,
  }) : super(
          key: key,
        );

  BalancehistoryItemModel balancehistoryItemModelObj;
  VoidCallback? edit;
  VoidCallback? delete;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 24.v,
            bottom: 25.v,
          ),
          child: Text(
            balancehistoryItemModelObj.name ?? "N/A",
            style: CustomTextStyles.bodyMediumPoppinsBlack900,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 24.v,
            bottom: 25.v,
          ),
          child: Text(
            balancehistoryItemModelObj.idNo ?? "N/A",
            style: CustomTextStyles.bodyMediumPoppinsBlack900,
          ),
        ),
        Spacer(),
        Column(
          children: [
            AppbarImage1(
                svgPath: ImageConstant.imgFrame33,
                margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                onTap: () {
                  edit?.call();
                }),
            AppbarImage1(
                svgPath: ImageConstant.imgFrame34,
                margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                onTap: () {
                  delete?.call();
                }),
          ],
        ),
      ],
    );
  }
}
