import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AgeGroupItemWidget extends StatelessWidget {
  AgeGroupItemWidget(
    this.ageGroupmModel, {
    Key? key,
    this.onSelect,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  AgeGroupModel ageGroupmModel;

  Function(bool)? onSelect;

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
            Padding(
              padding: EdgeInsets.only(
                top: DeviceExt((5 / 411) * 100).w,
                right: DeviceExt((5 / 841) * 100).h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: DeviceExt((10 / 841) * 100).h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_males".tr,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                          CustomTextFormField(
                            width: DeviceExt((150 / 841) * 100).h,
                            focusNode: ageGroupmModel.focusNode,
                            autofocus: false,
                            controller: ageGroupmModel.male,
                            hintText: "lbl_males".tr,
                            textInputType: TextInputType.number,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: DeviceExt((7 / 841) * 100).h,
                              vertical: DeviceExt((13 / 411) * 100).w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: DeviceExt((10 / 841) * 100).h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_females".tr,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                          CustomTextFormField(
                            width: DeviceExt((150 / 841) * 100).h,
                            focusNode: ageGroupmModel.femalefocusNode,
                            autofocus: false,
                            controller: ageGroupmModel.female,
                            hintText: "lbl_females".tr,
                            textInputType: TextInputType.number,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: DeviceExt((8 / 841) * 100).h,
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
        ],
      ),
    );
  }
}
