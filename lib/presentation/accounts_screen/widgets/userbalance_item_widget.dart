import '../models/userbalance_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class UserbalanceItemWidget extends StatelessWidget {
  UserbalanceItemWidget(
    this.userbalanceItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserbalanceItemModel userbalanceItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceExt((15 / 841) * 100).h,
        vertical: DeviceExt((20 / 411) * 100).w,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 45.adaptSize,
            width: 45.adaptSize,
            padding: EdgeInsets.all(DeviceExt((12 / 841) * 100).h),
            decoration: IconButtonStyleHelper.fillPrimaryContainer,
            child: CustomImageView(
              svgPath: ImageConstant.imgMoneytag1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((10 / 841) * 100).h,
              top: DeviceExt((5 / 411) * 100).w,
              bottom: DeviceExt((2 / 411) * 100).w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    userbalanceItemModelObj.mybalance!,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallBluegray40003,
                  ),
                ),
                SizedBox(height: DeviceExt((2 / 411) * 100).w),
                Text(
                  userbalanceItemModelObj.balance!,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumInterIndigo600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
