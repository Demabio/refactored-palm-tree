import '../models/gridproductname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class GridproductnameItemWidget extends StatelessWidget {
  GridproductnameItemWidget(
    this.gridproductnameItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GridproductnameItemModel gridproductnameItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage171x171,
          height: 171.adaptSize,
          width: 171.adaptSize,
          radius: BorderRadius.circular(
            8.h,
          ),
        ),
        SizedBox(height: 11.v),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "lbl_long".tr,
                style: theme.textTheme.bodyMedium,
              ),
              TextSpan(
                text: "lbl_sleeve_t_shirt".tr,
                style: CustomTextStyles.labelLargeLatoGray90001,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
