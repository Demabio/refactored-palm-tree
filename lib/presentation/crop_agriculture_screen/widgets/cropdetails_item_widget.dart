import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';

import '../models/cropdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
        horizontal: DeviceExt((9 / 841) * 100).h,
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
              left: DeviceExt((1 / 841) * 100).h,
              top: 17.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_crop".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.name ?? "N/A",
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((1 / 841) * 100).h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "lbl_total_acreage2".tr,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.totalAcreage ?? "N/A",
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((1 / 841) * 100).h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_unit_of_area".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.unitOfArea ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((1 / 841) * 100).h,
              top: 14.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "msg_use_certified_seeds".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.seeds ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((1 / 841) * 100).h,
              top: 14.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "lbl_purpose".tr,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.purpose ?? "N/A",
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((1 / 841) * 100).h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    "lbl_water_source".tr,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.water ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((1 / 841) * 100).h,
              top: 15.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_crop_system".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.system ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DeviceExt((1 / 841) * 100).h,
              top: 13.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_use_fertilizer".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.fertiliser ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.fertiliser == "Yes",
            child: Padding(
                padding: EdgeInsets.only(
                    left: DeviceExt((4 / 841) * 100).h, top: 4.v),
                child: Text(
                  "Fertilisers Used".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.fertiliser == "Yes",
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.v,
                right: DeviceExt((16 / 841) * 100).h,
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
                padding: EdgeInsets.only(
                    left: DeviceExt((4 / 841) * 100).h, top: 4.v),
                child: Text(
                  "Fertiliser Sources".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.fertiliser == "Yes",
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.v,
                right: DeviceExt((16 / 841) * 100).h,
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
              left: DeviceExt((1 / 841) * 100).h,
              top: 14.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_use_pesticide".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cropdetailsItemModelObj.pesticide ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.pesticide == "Yes",
            child: Padding(
                padding: EdgeInsets.only(
                    left: DeviceExt((4 / 841) * 100).h, top: 4.v),
                child: Text(
                  "Pesticides Used".tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Visibility(
            visible: cropdetailsItemModelObj.pesticide == "Yes",
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.v,
                right: DeviceExt((16 / 841) * 100).h,
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
          SizedBox(
            height: ((15 / 411) * 100).w,
          ),
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
