import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import '../../add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import '../models/livestock_item_model.dart';
import 'ages_widget.dart';
import 'feeds_widget.dart';

// ignore: must_be_immutable
class LSdetailsItemWidget extends StatelessWidget {
  LSdetailsItemWidget(
    this.farmdetailsItemModel, {
    this.edit,
    this.delete,
    Key? key,
  }) : super(
          key: key,
        );

  LSdetailsItemModel farmdetailsItemModel;
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
                  "lbl_livestock2".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
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
          SizedBox(height: ((16 / 411) * 100).w),
          Text(
            "msg_livestock_age_groups".tr,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: Device.orientation == Orientation.portrait
                  ? DeviceExt(2).h
                  : DeviceExt(2).w,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ((15 / 411) * 100).w,
              right: DeviceExt((16 / 841) * 100).h,
            ),
            child: Column(
              children: List<Widget>.generate(
                farmdetailsItemModel.ages.length,
                (index) {
                  AgeGroupModel model = farmdetailsItemModel.ages[index];

                  return AgeItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: ((14 / 411) * 100).w),
          Text(
            "msg_main_livestock_feed".tr,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: Device.orientation == Orientation.portrait
                  ? DeviceExt(2).h
                  : DeviceExt(2).w,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ((14 / 411) * 100).w),
          Column(
            children: List<Widget>.generate(
              farmdetailsItemModel.feeds.length,
              (index) {
                FeedsModel model = farmdetailsItemModel.feeds[index];

                return FeedItemWidget(
                  model,
                );
              },
            ),
          ),
          SizedBox(height: ((13 / 411) * 100).w),
          Row(
            children: [
              SizedBox(
                width: DeviceExt((112 / 841) * 100).h,
                child: Text(
                  "msg_farming_production".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
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
          SizedBox(height: ((15 / 411) * 100).w),
          Visibility(
            visible: farmdetailsItemModel.beekeepr,
            child: Row(
              children: [
                SizedBox(
                  width: DeviceExt((112 / 841) * 100).h,
                  child: Text(
                    "Number of BeeHives".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
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
                    farmdetailsItemModel.x ?? "0",
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
          ),
          SizedBox(height: ((15 / 411) * 100).w),
          Visibility(
            visible: farmdetailsItemModel.beekeepr,
            child: Text(
              "BeeHive Types".tr,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: Device.orientation == Orientation.portrait
                    ? DeviceExt(1.8).h
                    : DeviceExt(2).w,
              ),
            ),
          ),
          SizedBox(height: ((14 / 411) * 100).w),
          Visibility(
            visible: farmdetailsItemModel.beekeepr,
            child: Column(
              children: List<Widget>.generate(
                farmdetailsItemModel.bees.length,
                (index) {
                  FeedsModel model = farmdetailsItemModel.bees[index];

                  return FeedItemWidget(
                    model,
                  );
                },
              ),
            ),
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
