import '../models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle63,
          height: 50.adaptSize,
          width: 50.adaptSize,
          radius: BorderRadius.circular(
            4.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            top: 5.v,
            bottom: 5.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userprofile1ItemModelObj.userName!,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleSmallBlack900,
              ),
              SizedBox(height: 2.v),
              Text(
                userprofile1ItemModelObj.userRole!,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallPoppinsGray500,
              ),
            ],
          ),
        ),
        Spacer(),
        CustomIconButton(
          height: 25.adaptSize,
          width: 25.adaptSize,
          margin: EdgeInsets.only(
            top: 13.v,
            bottom: 12.v,
          ),
          padding: EdgeInsets.all(8.h),
          decoration: IconButtonStyleHelper.fillDeepPurple,
          child: CustomImageView(
            svgPath: ImageConstant.imgPlus,
          ),
        ),
      ],
    );
  }
}
