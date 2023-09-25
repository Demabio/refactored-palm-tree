import '../models/sectionlistdura_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SectionlistduraItemWidget extends StatelessWidget {
  SectionlistduraItemWidget(
    this.sectionlistduraItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SectionlistduraItemModel sectionlistduraItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 50.adaptSize,
          width: 50.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillGray,
          child: CustomImageView(
            svgPath: ImageConstant.imgFire,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.h,
            top: 6.v,
            bottom: 3.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_apple_store".tr,
                style: CustomTextStyles.titleSmallBlack900,
              ),
              SizedBox(height: 4.v),
              Text(
                "lbl_21_june_2022".tr,
                style: CustomTextStyles.labelMediumGray500,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "lbl_220_00".tr,
                  style: CustomTextStyles.labelMediumMedium,
                ),
              ),
              SizedBox(height: 3.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "lbl_debit_card".tr,
                  style: CustomTextStyles.labelMediumGray500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
