import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import '../models/farm_item_model.dart';
import 'enterprises_widget.dart';

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
        horizontal: 9.h,
        vertical: 13.v,
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
          SizedBox(height: 28.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Text("lbl_total_acreage".tr,
                    style: CustomTextStyles.labelMediumPrimary)),
            Text(farmdetailsItemModel.totalAcreage!,
                style: theme.textTheme.labelMedium)
          ]),
          SizedBox(height: 28.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_area_unit".tr,
                style: CustomTextStyles.labelMediumPrimary),
            Text(farmdetailsItemModel.unitOfArea!,
                style: theme.textTheme.labelMedium)
          ]),
          SizedBox(height: 29.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: 156.h,
                child: Text("msg_size_of_land_under".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: 18.v),
                child: Text(farmdetailsItemModel.landsize!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: 10.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: 156.h,
                child: Text("msg_total_land_area".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: 16.v),
                child: Text(farmdetailsItemModel.livestock!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: 14.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: 161.h,
                child: Text("msg_size_of_land_leased".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: 18.v),
                child: Text(farmdetailsItemModel.lease!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: 10.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: 164.h,
                child: Text("msg_size_of_land_lying".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: 16.v),
                child: Text(farmdetailsItemModel.idle!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: 14.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Text("lbl_accuracy".tr,
                    style: CustomTextStyles.labelMediumPrimary)),
            Text("lbl_11".tr, style: theme.textTheme.labelMedium)
          ]),
          SizedBox(height: 27.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: 136.h,
                child: Text("msg_lr_no_certificate_lease".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumPrimary)),
            Padding(
                padding: EdgeInsets.only(bottom: 19.v),
                child: Text(farmdetailsItemModel.lr!,
                    style: theme.textTheme.labelMedium))
          ]),
          SizedBox(height: 11.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("msg_legal_status_of".tr,
                style: CustomTextStyles.labelMediumPrimary),
            Text(farmdetailsItemModel.owner!,
                style: theme.textTheme.labelMedium)
          ]),
          Padding(
              padding: EdgeInsets.only(left: 34.h, top: 29.v),
              child: Text("msg_enterprises_on_this".tr,
                  style: CustomTextStyles.labelMediumPrimary)),
          SizedBox(height: 15.v),
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
