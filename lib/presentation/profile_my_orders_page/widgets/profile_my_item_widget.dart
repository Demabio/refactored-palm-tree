import '../models/profile_my_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class ProfileMyItemWidget extends StatelessWidget {
  ProfileMyItemWidget(
    this.profileMyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfileMyItemModel profileMyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage110x109,
          height: 110.v,
          width: 109.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            top: 2.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profileMyItemModelObj.price!,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyLargeLatoGray90001,
              ),
              SizedBox(height: 12.v),
              Text(
                profileMyItemModelObj.shortsinYellow!,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyMedium14,
              ),
              SizedBox(height: 38.v),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_qty2".tr,
                            style: CustomTextStyles.bodyMediumGray6000114,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(
                      "lbl_1".tr,
                      style: CustomTextStyles.bodyMedium14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
