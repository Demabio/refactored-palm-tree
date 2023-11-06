import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';

// ignore: must_be_immutable
class FeedItemWidget extends StatelessWidget {
  FeedItemWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  FeedsModel enterpriseModel;

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
        child: Text(
          enterpriseModel.title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.black,
            fontSize: Device.orientation == Orientation.portrait
                ? DeviceExt(1.8).h
                : DeviceExt(2).w,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
