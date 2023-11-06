import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import '../models/farm_item_model.dart';

// ignore: must_be_immutable
class FdetailsItemWidget extends StatelessWidget {
  FdetailsItemWidget(
    this.farmdetailsItemModel, {
    this.edit,
    this.delete,
    Key? key,
  }) : super(
          key: key,
        );

  FdetailsItemModel farmdetailsItemModel;
  VoidCallback? edit;
  VoidCallback? delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlinePrimary1
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 17.v,
              right: 5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Farm Name:".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  farmdetailsItemModel.name!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 13.v),
          Row(
            children: [
              SizedBox(
                width: 112.h,
                child: Text(
                  "Production on farm:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.v,
                  bottom: 9.v,
                ),
                child: Text(
                  farmdetailsItemModel.prod!,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Row(
            children: [
              SizedBox(
                width: 112.h,
                child: Text(
                  "Size:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.v,
                  bottom: 9.v,
                ),
                child: Text(
                  farmdetailsItemModel.landsize!,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Row(
            children: [
              SizedBox(
                width: 112.h,
                child: Text(
                  "Coordinates:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.v,
                  bottom: 9.v,
                ),
                child: Text(
                  "${farmdetailsItemModel.x!},${farmdetailsItemModel.y!}",
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Row(
            children: [
              SizedBox(
                width: 112.h,
                child: Text(
                  "Is Completely Filled:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.v,
                  bottom: 9.v,
                ),
                child: Text(
                  "${farmdetailsItemModel.completed}",
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.v),
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
