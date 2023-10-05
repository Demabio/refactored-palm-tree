import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';

// ignore: must_be_immutable
class CBListWidget extends StatelessWidget {
  CBListWidget(
    this.enterpriseModel, {
    Key? key,
    this.onSelect,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  CheckBoxList enterpriseModel;

  Function(bool)? onSelect;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CustomCheckboxButton(
        text: enterpriseModel.title,
        value: enterpriseModel.isSelected,
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
