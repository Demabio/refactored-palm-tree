import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

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

  AgeGroupmModel ageGroupmModel;

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
            text: "msg_less_than_3_weeks".tr,
            value: ageGroupmModel.isSelected,
            margin: EdgeInsets.only(
              left: 5.h,
              top: 46.v,
            ),
            onChange: (value) {},
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 14.v,
              right: 5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_males".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        CustomTextFormField(
                          width: 150.h,
                          controller: ageGroupmModel.male,
                          hintText: "lbl_males".tr,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 7.h,
                            vertical: 13.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_females".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        CustomTextFormField(
                          width: 150.h,
                          controller: ageGroupmModel.female,
                          hintText: "lbl_females".tr,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 13.v,
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
