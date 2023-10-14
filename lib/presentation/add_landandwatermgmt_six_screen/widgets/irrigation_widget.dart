import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

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
              left: 5.h,
              top: 20.v,
            ),
            onChange: (value) {
              onSelect?.call(value);
            },
          ),
          if (ageGroupmModel.isSelected)
            Container(
              height: 150.v,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5.v,
                  right: 5.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.h),
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
                              hintText: "Scheme".tr,
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
                        padding: EdgeInsets.only(left: 0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Membership Type".tr,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                            CustomDropDown(
                                icon: Container(
                                    height: 150.v,
                                    margin: EdgeInsets.only(left: 30.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.h)),
                                    child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPrimary)),
                                hintText: "lbl_select".tr,
                                items: ageGroupmModel.model,
                                onChanged: (value) {
                                  onSelectCB?.call(value);
                                })
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
