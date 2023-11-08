import 'bloc/add_reared_livestock_dialog_three_bloc.dart';
import 'models/add_reared_livestock_dialog_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
      width: DeviceExt((344 / 841) * 100).h,
      padding: EdgeInsets.symmetric(
        horizontal: DeviceExt((9 / 841) * 100).h,
        vertical: DeviceExt((2 / 411) * 100).w,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: DeviceExt((5 / 841) * 100).h),
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((46 / 411) * 100).w,
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
              top: DeviceExt((14 / 411) * 100).w,
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
                        BlocSelector<
                            AddRearedLivestockDialogThreeBloc,
                            AddRearedLivestockDialogThreeState,
                            TextEditingController?>(
                          selector: (state) => state.twotosixmonthsmController,
                          builder: (context, twotosixmonthsmController) {
                            return CustomTextFormField(
                              width: DeviceExt((150 / 841) * 100).h,
                              controller: twotosixmonthsmController,
                              hintText: "lbl_males".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((7 / 841) * 100).h,
                                vertical: DeviceExt((13 / 411) * 100).w,
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
                    padding:
                        EdgeInsets.only(left: DeviceExt((10 / 841) * 100).h),
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
                              width: DeviceExt((150 / 841) * 100).h,
                              controller: femalesController,
                              hintText: "lbl_females".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((8 / 841) * 100).h,
                                vertical: DeviceExt((13 / 411) * 100).w,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((15 / 411) * 100).w,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((15 / 411) * 100).w,
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
              left: DeviceExt((2 / 841) * 100).h,
              top: DeviceExt((14 / 411) * 100).w,
              right: DeviceExt((5 / 841) * 100).h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: DeviceExt((9 / 841) * 100).h),
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
                              width: DeviceExt((150 / 841) * 100).h,
                              controller: twotosixmonthsmController1,
                              hintText: "lbl_males".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((7 / 841) * 100).h,
                                vertical: DeviceExt((13 / 411) * 100).w,
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
                    padding:
                        EdgeInsets.only(left: DeviceExt((9 / 841) * 100).h),
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
                              width: DeviceExt((150 / 841) * 100).h,
                              controller: femalesoneController,
                              hintText: "lbl_females".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((8 / 841) * 100).h,
                                vertical: DeviceExt((13 / 411) * 100).w,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((15 / 411) * 100).w,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((15 / 411) * 100).w,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((15 / 411) * 100).w,
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
              left: DeviceExt((2 / 841) * 100).h,
              top: DeviceExt((12 / 411) * 100).w,
              right: DeviceExt((5 / 841) * 100).h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: DeviceExt((9 / 841) * 100).h),
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
                              width: DeviceExt((150 / 841) * 100).h,
                              controller: twotosixmonthsmController2,
                              hintText: "lbl_males".tr,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((7 / 841) * 100).h,
                                vertical: DeviceExt((13 / 411) * 100).w,
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
                    padding:
                        EdgeInsets.only(left: DeviceExt((9 / 841) * 100).h),
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
                              width: DeviceExt((150 / 841) * 100).h,
                              controller: femalestwoController,
                              hintText: "lbl_females".tr,
                              textInputAction: TextInputAction.done,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((8 / 841) * 100).h,
                                vertical: DeviceExt((13 / 411) * 100).w,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((15 / 411) * 100).w,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((13 / 411) * 100).w,
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
            padding: EdgeInsets.fromLTRB(
                DeviceExt((5 / 841) * 100).h,
                DeviceExt((44 / 411) * 100).w,
                DeviceExt((4 / 841) * 100).h,
                DeviceExt((16 / 411) * 100).w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: DeviceExt((25 / 841) * 100).h,
                    vertical: DeviceExt((12 / 411) * 100).w,
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
                  width: DeviceExt((95 / 841) * 100).h,
                  text: "lbl_add".tr,
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                ),
                CustomOutlinedButton(
                  width: DeviceExt((95 / 841) * 100).h,
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
