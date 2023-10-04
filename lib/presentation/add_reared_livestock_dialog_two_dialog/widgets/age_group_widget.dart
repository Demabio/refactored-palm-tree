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
            text: ageGroupmModel.title,
            value: ageGroupmModel.isSelected,
            margin: EdgeInsets.only(
              left: 5.h,
              top: 20.v,
            ),
            onChange: (value) {
              onSelect?.call(value);
            },
          ),
          if (ageGroupmModel.isSelected)
            Padding(
              padding: EdgeInsets.only(
                top: 5.v,
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
                            focusNode: ageGroupmModel.focusNode,
                            autofocus: false,
                            controller: ageGroupmModel.male,
                            hintText: "lbl_males".tr,
                            textInputType: TextInputType.number,
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
                            focusNode: ageGroupmModel.femalefocusNode,
                            autofocus: false,
                            controller: ageGroupmModel.female,
                            hintText: "lbl_females".tr,
                            textInputType: TextInputType.number,
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
