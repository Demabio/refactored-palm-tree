import 'bloc/add_reared_livestock_dialog_two_bloc.dart';
import 'models/add_reared_livestock_dialog_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddRearedLivestockDialogTwoDialog extends StatelessWidget {
  const AddRearedLivestockDialogTwoDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockDialogTwoBloc>(
      create: (context) =>
          AddRearedLivestockDialogTwoBloc(AddRearedLivestockDialogTwoState(
        addRearedLivestockDialogTwoModelObj: AddRearedLivestockDialogTwoModel(),
      ))
            ..add(AddRearedLivestockDialogTwoInitialEvent()),
      child: AddRearedLivestockDialogTwoDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 9.v,
            ),
            child: Text(
              "msg_add_livestock_age2".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.lessThanThreeWe,
            builder: (context, lessThanThreeWe) {
              return CustomCheckboxButton(
                text: "msg_less_than_3_weeks".tr,
                value: lessThanThreeWe,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 46.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.threeToEightWee,
            builder: (context, threeToEightWee) {
              return CustomCheckboxButton(
                text: "lbl_3_8_weeks".tr,
                value: threeToEightWee,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.lessThanTwoMont,
            builder: (context, lessThanTwoMont) {
              return CustomCheckboxButton(
                text: "msg_less_than_2_months".tr,
                value: lessThanTwoMont,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.twoToSixMonths,
            builder: (context, twoToSixMonths) {
              return CustomCheckboxButton(
                text: "lbl_2_6_months".tr,
                value: twoToSixMonths,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.sixToTwelveMont,
            builder: (context, sixToTwelveMont) {
              return CustomCheckboxButton(
                text: "lbl_6_12_months".tr,
                value: sixToTwelveMont,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.oneToTwoYears,
            builder: (context, oneToTwoYears) {
              return CustomCheckboxButton(
                text: "lbl_1_2_years2".tr,
                value: oneToTwoYears,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.twoToFourYears,
            builder: (context, twoToFourYears) {
              return CustomCheckboxButton(
                text: "lbl_2_4_years".tr,
                value: twoToFourYears,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddRearedLivestockDialogTwoBloc,
              AddRearedLivestockDialogTwoState, bool?>(
            selector: (state) => state.fourYearsOrOlde,
            builder: (context, fourYearsOrOlde) {
              return CustomCheckboxButton(
                text: "msg_4_years_or_older".tr,
                value: fourYearsOrOlde,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddRearedLivestockDialogTwoBloc>()
                      .add(ChangeCheckBox7Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 47.v,
            ),
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
