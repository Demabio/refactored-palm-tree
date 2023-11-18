import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class FishtemWidget extends StatelessWidget {
  FishtemWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
    this.edit,
    this.delete,
    this.view = true,
  }) : super(
          key: key,
        );

  CheckBoxList enterpriseModel;

  double? height;

  double? width;
  VoidCallback? edit;
  VoidCallback? delete;
  bool view;
  RegExp pattern = RegExp(r'\b(?:Other|other)\b');

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: enterpriseModel.isSelected,
      child: Container(
        alignment: Alignment.centerLeft,
        height: height,
        width: width,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Fish:",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  pattern.hasMatch(enterpriseModel.title)
                      ? "${enterpriseModel.title} - ${enterpriseModel.var5 ?? ""}"
                      : enterpriseModel.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Fish Category:",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.var1 ?? "Not Applied",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Production System:",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.var2 ?? "Not Applied",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Number of Fingerlings:",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.var3 ?? "Not Applied",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(1.8).w,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 15.v),
            Visibility(
              visible: view,
              child: Row(
                children: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgFrame33,
                      margin: EdgeInsets.fromLTRB(
                          DeviceExt((14 / 841) * 100).h,
                          ((15 / 411) * 100).w,
                          DeviceExt((14 / 411) * 100).h,
                          ((11 / 411) * 100).w),
                      onTap: () {
                        edit?.call();
                      }),
                  Spacer(),
                  AppbarImage1(
                      svgPath: ImageConstant.imgFrame34,
                      margin: EdgeInsets.fromLTRB(
                          DeviceExt((14 / 411) * 100).h,
                          ((3 / 411) * 100).w,
                          DeviceExt((14 / 411) * 100).h,
                          ((11 / 411) * 100).w),
                      onTap: () {
                        delete?.call();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
