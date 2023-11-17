import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class IncomesWidget extends StatelessWidget {
  IncomesWidget(
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
        child: Row(
          children: [
            Text(
              "${enterpriseModel.title}",
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontSize: Device.orientation == Orientation.portrait
                    ? DeviceExt(1.8).h
                    : DeviceExt(1.8).w,
              ),
              textAlign: TextAlign.left,
            ),
            Spacer(),
            Text(
              "Priority: ${enterpriseModel.var1}",
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
      ),
    );
  }
}
