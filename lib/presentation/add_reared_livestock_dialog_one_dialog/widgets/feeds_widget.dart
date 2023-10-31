import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';

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
          left: 5.h,
          top: 20.v,
        ),
        onChange: (value) {
          onSelect?.call(value);
        },
      ),
    );
  }
}
