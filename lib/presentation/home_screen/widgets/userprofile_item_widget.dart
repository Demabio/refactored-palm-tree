import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceExt((15 / 841) * 100).h,
        vertical: DeviceExt((19 / 411) * 100).w,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        children: [
          CustomIconButton(
            height: 45.adaptSize,
            width: 45.adaptSize,
            padding: EdgeInsets.all(DeviceExt((12 / 841) * 100).h),
            decoration: IconButtonStyleHelper.fillPrimaryContainer,
            child: CustomImageView(
              svgPath: ImageConstant.imgSave,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((10 / 841) * 100).h,
              bottom: DeviceExt((2 / 411) * 100).w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userprofileItemModelObj.balanceText!,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: DeviceExt((1 / 411) * 100).w),
                Text(
                  userprofileItemModelObj.balanceAmount!,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
