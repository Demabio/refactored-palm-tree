import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

// ignore: must_be_immutable
class CoopItemWidget extends StatelessWidget {
  CoopItemWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  CheckBoxList enterpriseModel;

  double? height;

  double? width;

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
                  enterpriseModel.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.5).h
                        : DeviceExt(2).w,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  enterpriseModel.var1 ?? "N/A",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.5).h
                        : DeviceExt(2).w,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
