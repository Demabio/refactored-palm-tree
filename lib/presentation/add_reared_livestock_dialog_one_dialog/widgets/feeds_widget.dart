import 'package:flutter/material.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class FeedsItemWidget extends StatelessWidget {
  FeedsItemWidget(
    this.model, {
    Key? key,
    this.onSelect,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  FeedsModel model;

  Function(bool)? onSelect;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CustomCheckboxButton(
        text: model.title,
        value: model.isSelected,
        margin: EdgeInsets.only(
          left: DeviceExt((5 / 841) * 100).h,
          top: DeviceExt((20 / 411) * 100).w,
        ),
        onChange: (value) {
          onSelect?.call(value);
        },
      ),
    );
  }
}
