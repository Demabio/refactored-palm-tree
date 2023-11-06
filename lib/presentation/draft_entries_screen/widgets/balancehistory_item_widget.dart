import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import '../models/balancehistory_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class BalancehistoryItemWidget extends StatelessWidget {
  BalancehistoryItemWidget(
    this.balancehistoryItemModelObj, {
    this.edit,
    this.delete,
    Key? key,
  }) : super(
          key: key,
        );

  BalancehistoryItemModel balancehistoryItemModelObj;
  VoidCallback? edit;
  VoidCallback? delete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ((24 / 411) * 100).w,
                bottom: ((25 / 411) * 100).w,
              ),
              child: Container(
                width: ((100 / 411) * 100).w,
                child: Text(
                  balancehistoryItemModelObj.name ?? "N/A",
                  maxLines: 10,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: ((24 / 411) * 100).w,
                bottom: ((25 / 411) * 100).w,
              ),
              child: Text(
                balancehistoryItemModelObj.idNo ?? "N/A",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: Device.orientation == Orientation.portrait
                      ? DeviceExt(1.8).h
                      : DeviceExt(1.8).w,
                  color: Colors.black,
                ),
              ),
            ),
            Spacer(),
            Column(
              children: [
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame33,
                    onTap: () {
                      edit?.call();
                    }),
                SizedBox(height: ((15 / 411) * 100).w),
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame34,
                    onTap: () {
                      delete?.call();
                    }),
              ],
            ),
          ],
        ),
        Visibility(
          visible: PrefUtils().getAction() == "Rejected",
          child: Row(
            children: [
              Text(
                "Comments:",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: Device.orientation == Orientation.portrait
                      ? DeviceExt(1.8).h
                      : DeviceExt(2).w,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  balancehistoryItemModelObj.comments ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
