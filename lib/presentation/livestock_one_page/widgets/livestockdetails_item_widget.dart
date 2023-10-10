import 'package:kiamis_app/data/models/dbModels/livestock/agegroup.dart';
import 'package:kiamis_app/presentation/livestock_one_page/models/agesmodel.dart';
import 'package:kiamis_app/presentation/livestock_one_page/models/feedsmodel.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

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
                  "lbl_livestock2".tr,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
                Text(
                  farmdetailsItemModel.name!,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          Text(
            "msg_livestock_age_groups".tr,
            style: CustomTextStyles.labelMediumPrimary,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 15.v,
              right: 16.h,
            ),
            child: Column(
              children: List<Widget>.generate(
                farmdetailsItemModel.ages.length ?? 0,
                (index) {
                  AgesModel model = farmdetailsItemModel!.ages[index];

                  return AgeItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 14.v),
          Text(
            "msg_main_livestock_feed".tr,
            style: CustomTextStyles.labelMediumPrimary,
          ),
          SizedBox(height: 14.v),
          Column(
            children: List<Widget>.generate(
              farmdetailsItemModel.feeds.length ?? 0,
              (index) {
                FeedsModel model = farmdetailsItemModel!.feeds[index];

                return FeedItemWidget(
                  model,
                );
              },
            ),
          ),
          SizedBox(height: 13.v),
          Row(
            children: [
              SizedBox(
                width: 112.h,
                child: Text(
                  "msg_farming_production".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelMediumPrimary,
                ),
              ),
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