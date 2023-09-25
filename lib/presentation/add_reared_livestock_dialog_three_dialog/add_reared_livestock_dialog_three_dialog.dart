import 'bloc/add_reared_livestock_dialog_three_bloc.dart';
import 'models/add_reared_livestock_dialog_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddRearedLivestockDialogThreeDialog extends StatelessWidget {
  const AddRearedLivestockDialogThreeDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockDialogThreeBloc>(
      create: (context) =>
          AddRearedLivestockDialogThreeBloc(AddRearedLivestockDialogThreeState(
        addRearedLivestockDialogThreeModelObj:
            AddRearedLivestockDialogThreeModel(),
      ))
            ..add(AddRearedLivestockDialogThreeInitialEvent()),
      child: AddRearedLivestockDialogThreeDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: Text(
              "msg_add_livestock_age2".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.lessThanThreeWe,
            builder: (context, lessThanThreeWe) {
              return CustomCheckboxButton(
                text: "msg_less_than_3_weeks".tr,
                value: lessThanThreeWe,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 46.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
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
                        BlocSelector<
                            AddRearedLivestockDialogThreeBloc,
                            AddRearedLivestockDialogThreeState,
                            TextEditingController?>(
                          selector: (state) => state.twotosixmonthsmController,
                          builder: (context, twotosixmonthsmController) {
                            return CustomTextFormField(
                              width: 150.h,
                              controller: twotosixmonthsmController,
                              hintText: "lbl_males".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 7.h,
                                vertical: 13.v,
                              ),
                            );
                          },
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
                        BlocSelector<
                            AddRearedLivestockDialogThreeBloc,
                            AddRearedLivestockDialogThreeState,
                            TextEditingController?>(
                          selector: (state) => state.femalesController,
                          builder: (context, femalesController) {
                            return CustomTextFormField(
                              width: 150.h,
                              controller: femalesController,
                              hintText: "lbl_females".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.h,
                                vertical: 13.v,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.threeToEightWee,
            builder: (context, threeToEightWee) {
              return CustomCheckboxButton(
                text: "lbl_3_8_weeks".tr,
                value: threeToEightWee,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.lessThanTwoMont,
            builder: (context, lessThanTwoMont) {
              return CustomCheckboxButton(
                text: "msg_less_than_2_months".tr,
                value: lessThanTwoMont,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 2.h,
              top: 14.v,
              right: 5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 9.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_males".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        BlocSelector<
                            AddRearedLivestockDialogThreeBloc,
                            AddRearedLivestockDialogThreeState,
                            TextEditingController?>(
                          selector: (state) => state.twotosixmonthsmController1,
                          builder: (context, twotosixmonthsmController1) {
                            return CustomTextFormField(
                              width: 150.h,
                              controller: twotosixmonthsmController1,
                              hintText: "lbl_males".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 7.h,
                                vertical: 13.v,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_females".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        BlocSelector<
                            AddRearedLivestockDialogThreeBloc,
                            AddRearedLivestockDialogThreeState,
                            TextEditingController?>(
                          selector: (state) => state.femalesoneController,
                          builder: (context, femalesoneController) {
                            return CustomTextFormField(
                              width: 150.h,
                              controller: femalesoneController,
                              hintText: "lbl_females".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.h,
                                vertical: 13.v,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.twoToSixMonths,
            builder: (context, twoToSixMonths) {
              return CustomCheckboxButton(
                text: "lbl_2_6_months".tr,
                value: twoToSixMonths,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.sixToTwelveMont,
            builder: (context, sixToTwelveMont) {
              return CustomCheckboxButton(
                text: "lbl_6_12_months".tr,
                value: sixToTwelveMont,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.oneToTwoYears,
            builder: (context, oneToTwoYears) {
              return CustomCheckboxButton(
                text: "lbl_1_2_years2".tr,
                value: oneToTwoYears,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 2.h,
              top: 12.v,
              right: 5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 9.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_males".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        BlocSelector<
                            AddRearedLivestockDialogThreeBloc,
                            AddRearedLivestockDialogThreeState,
                            TextEditingController?>(
                          selector: (state) => state.twotosixmonthsmController2,
                          builder: (context, twotosixmonthsmController2) {
                            return CustomTextFormField(
                              width: 150.h,
                              controller: twotosixmonthsmController2,
                              hintText: "lbl_males".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 7.h,
                                vertical: 13.v,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_females".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        BlocSelector<
                            AddRearedLivestockDialogThreeBloc,
                            AddRearedLivestockDialogThreeState,
                            TextEditingController?>(
                          selector: (state) => state.femalestwoController,
                          builder: (context, femalestwoController) {
                            return CustomTextFormField(
                              width: 150.h,
                              controller: femalestwoController,
                              hintText: "lbl_females".tr,
                              textInputAction: TextInputAction.done,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.h,
                                vertical: 13.v,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.twoToFourYears,
            builder: (context, twoToFourYears) {
              return CustomCheckboxButton(
                text: "lbl_2_4_years".tr,
                value: twoToFourYears,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogThreeBloc,
              AddRearedLivestockDialogThreeState, bool?>(
            selector: (state) => state.fourYearsOrOlde,
            builder: (context, fourYearsOrOlde) {
              return CustomCheckboxButton(
                text: "msg_4_years_or_older".tr,
                value: fourYearsOrOlde,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 13.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogThreeBloc>()
                      .add(ChangeCheckBox7Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5.h, 44.v, 4.h, 16.v),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.h,
                    vertical: 12.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder6,
                  ),
                  child: Text(
                    "lbl_reset".tr,
                    style: CustomTextStyles.bodyLarge16,
                  ),
                ),
                CustomElevatedButton(
                  width: 95.h,
                  text: "lbl_add".tr,
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                ),
                CustomOutlinedButton(
                  width: 95.h,
                  text: "lbl_close".tr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
