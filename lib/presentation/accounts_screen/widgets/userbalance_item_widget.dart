import '../models/userbalance_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';

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
        horizontal: 15.h,
        vertical: 20.v,
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
            padding: EdgeInsets.all(12.h),
            decoration: IconButtonStyleHelper.fillPrimaryContainer,
            child: CustomImageView(
              svgPath: ImageConstant.imgMoneytag1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 5.v,
              bottom: 2.v,
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
                SizedBox(height: 2.v),
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
