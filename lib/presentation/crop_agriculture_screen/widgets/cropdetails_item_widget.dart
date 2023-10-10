import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import '../models/cropdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class CropdetailsItemWidget extends StatelessWidget {
  CropdetailsItemWidget(
    this.cropdetailsItemModelObj, {
    this.edit,
    this.delete,
    Key? key,
  }) : super(
          key: key,
        );

  CropdetailsItemModel cropdetailsItemModelObj;
  VoidCallback? edit;
  VoidCallback? delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 17.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_crop".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  cropdetailsItemModelObj.name!,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "lbl_total_acreage2".tr,
                    style: CustomTextStyles.labelMediumPrimary,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.totalAcreage!,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_unit_of_area".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  cropdetailsItemModelObj.unitOfArea!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 14.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "msg_use_certified_seeds".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  cropdetailsItemModelObj.seeds!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 14.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "lbl_purpose".tr,
                    style: CustomTextStyles.labelMediumPrimary,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.purpose!,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    "lbl_water_source".tr,
                    style: CustomTextStyles.labelMediumPrimary,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.water!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 15.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_crop_system".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  cropdetailsItemModelObj.system!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_use_fertilizer".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  cropdetailsItemModelObj.fertiliser!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 14.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_use_pesticide".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  cropdetailsItemModelObj.pesticide!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Row(
            children: [
              AppbarImage1(
                  svgPath: ImageConstant.imgFrame33,
                  margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                  onTap: () {
                    edit?.call();
                  }),
              Spacer(),
              AppbarImage1(
                  svgPath: ImageConstant.imgFrame34,
                  margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                  onTap: () {
                    delete?.call();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
