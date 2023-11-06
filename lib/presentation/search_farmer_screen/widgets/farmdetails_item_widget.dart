import 'package:flutter_sizer/flutter_sizer.dart';

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
        horizontal: DeviceExt((9 / 841) * 100).h,
        vertical: ((13 / 411) * 100).w,
      ),
      decoration: AppDecoration.outlinePrimary1
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: ((17 / 411) * 100).w,
              right: DeviceExt((5 / 841) * 100).h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Farm Name:".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2.5).w,
                  ),
                ),
                Text(
                  farmdetailsItemModel.name!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ((13 / 411) * 100).w),
          Row(
            children: [
              SizedBox(
                width: DeviceExt((112 / 841) * 100).h,
                child: Text(
                  "Production on farm:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2.5).w,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: ((8 / 411) * 100).w,
                  bottom: ((9 / 411) * 100).w,
                ),
                child: Text(
                  farmdetailsItemModel.prod!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ((13 / 411) * 100).w),
          Row(
            children: [
              SizedBox(
                width: DeviceExt((112 / 841) * 100).h,
                child: Text(
                  "Size:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2.5).w,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: ((8 / 411) * 100).w,
                  bottom: ((9 / 411) * 100).w,
                ),
                child: Text(
                  farmdetailsItemModel.landsize!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ((13 / 411) * 100).w),
          Row(
            children: [
              SizedBox(
                width: DeviceExt((112 / 841) * 100).h,
                child: Text(
                  "Coordinates:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2.5).w,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: ((8 / 411) * 100).w,
                  bottom: ((9 / 411) * 100).w,
                ),
                child: Text(
                  "${farmdetailsItemModel.x!},${farmdetailsItemModel.y!}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ((13 / 411) * 100).w),
          Row(
            children: [
              SizedBox(
                width: DeviceExt((112 / 841) * 100).h,
                child: Text(
                  "Is Completely Filled:".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2.5).w,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: ((8 / 411) * 100).w,
                  bottom: ((9 / 411) * 100).w,
                ),
                child: Text(
                  "${farmdetailsItemModel.completed}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ((13 / 411) * 100).w),
          Row(
            children: [
              CustomImageView(
                  svgPath: ImageConstant.imgFrame33,
                  height: Device.orientation == Orientation.portrait
                      ? DeviceExt(5).h
                      : 5.w,
                  width: Device.orientation == Orientation.portrait
                      ? DeviceExt(5).h
                      : 5.w,
                  onTap: () {
                    edit?.call();
                  }),
              Spacer(),
              CustomImageView(
                  svgPath: ImageConstant.imgFrame34,
                  height: Device.orientation == Orientation.portrait
                      ? DeviceExt(5).h
                      : 5.w,
                  width: Device.orientation == Orientation.portrait
                      ? DeviceExt(5).h
                      : 5.w,
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
