import '../models/balancehistory_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class BalancehistoryItemWidget extends StatelessWidget {
  BalancehistoryItemWidget(
    this.balancehistoryItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BalancehistoryItemModel balancehistoryItemModelObj;

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
            "lbl_amani".tr,
            style: CustomTextStyles.bodyMediumPoppinsBlack900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 24.v,
            bottom: 25.v,
          ),
          child: Text(
            "lbl_34889922".tr,
            style: CustomTextStyles.bodyMediumPoppinsBlack900,
          ),
        ),
        CustomImageView(
          svgPath: ImageConstant.imgFile,
          height: 71.v,
          width: 30.h,
        ),
      ],
    );
  }
}
