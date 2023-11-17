import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class IrrigationProjectGroupItemWidget extends StatelessWidget {
  IrrigationProjectGroupItemWidget(
    this.ageGroupmModel, {
    Key? key,
    this.onSelect,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  CheckBoxList ageGroupmModel;

  Function(bool)? onSelect;

  Function(SelectionPopupModel)? onSelectCB;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          CustomCheckboxButton(
            text: ageGroupmModel.title,
            value: ageGroupmModel.isSelected,
            margin: EdgeInsets.only(
              left: DeviceExt((5 / 841) * 100).h,
              top: DeviceExt((20 / 411) * 100).w,
            ),
            onChange: (value) {
              onSelect?.call(value);
            },
          ),
          if (ageGroupmModel.isSelected)
            Container(
              height: DeviceExt((75 / 411) * 100).w,
              child: Padding(
                padding: EdgeInsets.only(
                  right: DeviceExt((5 / 841) * 100).h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: DeviceExt((10 / 841) * 100).h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ageGroupmModel.title,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                            CustomTextFormField(
                              width: double.maxFinite,
                              focusNode: ageGroupmModel.focusNode,
                              autofocus: false,
                              controller: ageGroupmModel.male,
                              hintText: "Group".tr,
                              textInputType: TextInputType.text,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((7 / 841) * 100).h,
                                vertical: DeviceExt((13 / 411) * 100).w,
                              ),
                            ),
                          ],
                        ),
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
