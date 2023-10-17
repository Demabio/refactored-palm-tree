import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
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
                  cropdetailsItemModelObj.name ?? "N/A",
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
                  cropdetailsItemModelObj.totalAcreage ?? "N/A",
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
                  cropdetailsItemModelObj.unitOfArea ?? "N/A",
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
                  cropdetailsItemModelObj.seeds ?? "N/A",
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
                  cropdetailsItemModelObj.purpose ?? "N/A",
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
                  cropdetailsItemModelObj.water ?? "N/A",
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
                  cropdetailsItemModelObj.system ?? "N/A",
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
                  cropdetailsItemModelObj.fertiliser ?? "N/A",
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.fertiliser == "Yes",
            child: Padding(
                padding: EdgeInsets.only(left: 4.h, top: 4.v),
                child: Text("Fertilisers Used".tr,
                    style: CustomTextStyles.labelMediumPrimary)),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.fertiliser == "Yes",
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.v,
                right: 16.h,
              ),
              child: Column(
                children: List<Widget>.generate(
                  cropdetailsItemModelObj.a.length,
                  (index) {
                    CheckBoxList model = cropdetailsItemModelObj.a[index];

                    return InputsWidget(
                      model,
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.fertiliser == "Yes",
            child: Padding(
                padding: EdgeInsets.only(left: 4.h, top: 4.v),
                child: Text("Fertiliser Sources".tr,
                    style: CustomTextStyles.labelMediumPrimary)),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.fertiliser == "Yes",
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.v,
                right: 16.h,
              ),
              child: Column(
                children: List<Widget>.generate(
                  cropdetailsItemModelObj.s.length,
                  (index) {
                    CheckBoxList model = cropdetailsItemModelObj.s[index];

                    return InputsWidget(
                      model,
                    );
                  },
                ),
              ),
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
                  cropdetailsItemModelObj.pesticide ?? "N/A",
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.pesticide == "Yes",
            child: Padding(
                padding: EdgeInsets.only(left: 4.h, top: 4.v),
                child: Text("Pesticides Used".tr,
                    style: CustomTextStyles.labelMediumPrimary)),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.pesticide == "Yes",
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.v,
                right: 16.h,
              ),
              child: Column(
                children: List<Widget>.generate(
                  cropdetailsItemModelObj.p.length,
                  (index) {
                    CheckBoxList model = cropdetailsItemModelObj.p[index];

                    return InputsWidget(
                      model,
                    );
                  },
                ),
              ),
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
