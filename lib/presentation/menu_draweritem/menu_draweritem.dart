import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MenuDraweritem extends StatelessWidget {
  const MenuDraweritem({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 67.h,
            vertical: 34.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 58.h,
                  top: 36.v,
                ),
                child: Text(
                  "lbl_cart".tr,
                  style: CustomTextStyles.bodyLargeLatoGray90001,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 44.h,
                  top: 29.v,
                ),
                child: Text(
                  "lbl_profile".tr,
                  style: CustomTextStyles.bodyLargeLatoGray90001,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 47.h,
                  top: 30.v,
                ),
                child: Text(
                  "lbl_clothing".tr,
                  style: CustomTextStyles.bodyLargeLatoGray90001,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 56.h,
                  top: 27.v,
                ),
                child: Text(
                  "lbl_shoes".tr,
                  style: CustomTextStyles.bodyLargeLatoGray90001,
                ),
              ),
              SizedBox(height: 538.v),
              Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.img5279112camera,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.img5279111networkfbsocial,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                    margin: EdgeInsets.only(left: 24.h),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.img5305160inspira,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                    margin: EdgeInsets.only(left: 24.h),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.img5279123tweettwittertwitter,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                    margin: EdgeInsets.only(left: 24.h),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
