import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
  RegExp pattern = RegExp(r'\b(?:Other|other|Others|others)\b');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          CustomCheckboxButton(
            text: enterpriseModel.title,
            value: enterpriseModel.isSelected,
            margin: EdgeInsets.only(
              left: DeviceExt((5 / 841) * 100).h,
              top: DeviceExt((20 / 411) * 100).w,
            ),
            onChange: (value) {
              onSelect?.call(value);
            },
          ),
          if (pattern.hasMatch(enterpriseModel.title) &&
              enterpriseModel.isSelected)
            Container(
              height: DeviceExt((75 / 411) * 100).w,
              child: Padding(
                padding: EdgeInsets.only(
                  right: DeviceExt((5 / 841) * 100).h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(right: DeviceExt((10 / 841) * 100).h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Other".tr,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                          CustomTextFormField(
                            width: double.maxFinite,
                            focusNode: enterpriseModel.focusNode,
                            autofocus: false,
                            controller: enterpriseModel.male,
                            hintText: "Other".tr,
                            textInputType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
