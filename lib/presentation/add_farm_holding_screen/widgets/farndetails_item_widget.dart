import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import '../models/farm_item_model.dart';
import 'enterprises_widget.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class FarmdetailsItemWidget extends StatelessWidget {
  FarmdetailsItemWidget(
    this.farmdetailsItemModel, {
    this.edit,
    this.delete,
    Key? key,
  }) : super(
          key: key,
        );

  FarmdetailsItemModel farmdetailsItemModel;
  VoidCallback? edit;
  VoidCallback? delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceExt((9 / 841) * 100).h,
        vertical: DeviceExt((13 / 411) * 100).w,
      ),
      decoration: AppDecoration.outlinePrimary1
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("msg_descriptive_name".tr,
                style: CustomTextStyles.labelMediumPrimary),
            Text(farmdetailsItemModel.name!, style: theme.textTheme.labelMedium)
          ]),
          SizedBox(height: DeviceExt((28 / 411) * 100).w),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: DeviceExt((1 / 411) * 100).w),
                child: Text("lbl_total_acreage".tr,
                    style: CustomTextStyles.labelMediumPrimary)),
            Text(farmdetailsItemModel.totalAcreage!,
                style: theme.textTheme.labelMedium)
          ]),
          SizedBox(height: DeviceExt((28 / 411) * 100).w),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_area_unit".tr,
                style: CustomTextStyles.labelMediumPrimary),
            Text(farmdetailsItemModel.unitOfArea!,
                style: theme.textTheme.labelMedium)
          ]),
          SizedBox(height: DeviceExt((29 / 411) * 100).w),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: DeviceExt((156 / 841) * 100).h,
                child: Text("msg_size_of_land_under".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: DeviceExt((18 / 411) * 100).w),
                child: Text(farmdetailsItemModel.landsize!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: DeviceExt((10 / 411) * 100).w),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: DeviceExt((156 / 841) * 100).h,
                child: Text("msg_total_land_area".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: DeviceExt((16 / 411) * 100).w),
                child: Text(farmdetailsItemModel.livestock!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: DeviceExt((14 / 411) * 100).w),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: DeviceExt((161 / 841) * 100).h,
                child: Text("msg_size_of_land_leased".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: DeviceExt((18 / 411) * 100).w),
                child: Text(farmdetailsItemModel.lease!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: DeviceExt((10 / 411) * 100).w),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: DeviceExt((164 / 841) * 100).h,
                child: Text("msg_size_of_land_lying".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: DeviceExt((16 / 411) * 100).w),
                child: Text(farmdetailsItemModel.idle!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: DeviceExt((14 / 411) * 100).w),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: DeviceExt((1 / 411) * 100).w),
                child: Text("lbl_accuracy".tr,
                    style: CustomTextStyles.labelMediumPrimary)),
            Text("lbl_11".tr, style: theme.textTheme.labelMedium)
          ]),
          SizedBox(height: DeviceExt((27 / 411) * 100).w),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: DeviceExt((136 / 841) * 100).h,
                child: Text("msg_lr_no_certificate_lease".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: DeviceExt((19 / 411) * 100).w),
                child: Text(farmdetailsItemModel.lr!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: DeviceExt((11 / 411) * 100).w),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("msg_legal_status_of".tr,
                style: CustomTextStyles.labelMediumPrimary),
            Text(farmdetailsItemModel.owner!,
                style: theme.textTheme.labelMedium)
          ]),
          Padding(
              padding: EdgeInsets.only(
                  left: DeviceExt((34 / 841) * 100).h,
                  top: DeviceExt((29 / 411) * 100).w),
              child: Text("msg_enterprises_on_this".tr,
                  style: CustomTextStyles.labelMediumPrimary)),
          SizedBox(height: DeviceExt((15 / 411) * 100).w),
          Column(
            children: List<Widget>.generate(
              farmdetailsItemModel.enterprises.length,
              (index) {
                EnterpriseModel model = farmdetailsItemModel.enterprises[index];

                return EnterprisesItemWidget(
                  model,
                );
              },
            ),
          ),
          SizedBox(height: DeviceExt((15 / 411) * 100).w),
          Row(
            children: [
              AppbarImage1(
                  svgPath: ImageConstant.imgFrame33,
                  margin: EdgeInsets.fromLTRB(
                      DeviceExt((14 / 841) * 100).h,
                      DeviceExt((3 / 411) * 100).w,
                      DeviceExt((14 / 841) * 100).h,
                      DeviceExt((11 / 411) * 100).w),
                  onTap: () {
                    edit?.call();
                  }),
              Spacer(),
              AppbarImage1(
                  svgPath: ImageConstant.imgFrame34,
                  margin: EdgeInsets.fromLTRB(
                      DeviceExt((14 / 841) * 100).h,
                      DeviceExt((3 / 411) * 100).w,
                      DeviceExt((14 / 841) * 100).h,
                      DeviceExt((11 / 411) * 100).w),
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
