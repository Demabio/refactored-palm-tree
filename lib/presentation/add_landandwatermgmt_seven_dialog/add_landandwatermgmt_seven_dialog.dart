import 'bloc/add_landandwatermgmt_seven_bloc.dart';
import 'models/add_landandwatermgmt_seven_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddLandandwatermgmtSevenDialog extends StatelessWidget {
  const AddLandandwatermgmtSevenDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtSevenBloc>(
      create: (context) =>
          AddLandandwatermgmtSevenBloc(AddLandandwatermgmtSevenState(
        addLandandwatermgmtSevenModelObj: AddLandandwatermgmtSevenModel(),
      ))
            ..add(AddLandandwatermgmtSevenInitialEvent()),
      child: AddLandandwatermgmtSevenDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 25.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Text(
              "msg_implementing_body".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddLandandwatermgmtSevenBloc,
              AddLandandwatermgmtSevenState, bool?>(
            selector: (state) => state.countyGovernmen,
            builder: (context, countyGovernmen) {
              return CustomCheckboxButton(
                text: "msg_county_government".tr,
                value: countyGovernmen,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 36.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtSevenBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtSevenBloc,
              AddLandandwatermgmtSevenState, bool?>(
            selector: (state) => state.trash,
            builder: (context, trash) {
              return CustomCheckboxButton(
                text: "msg_national_irrigation".tr,
                value: trash,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                  right: 57.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtSevenBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtSevenBloc,
              AddLandandwatermgmtSevenState, bool?>(
            selector: (state) => state.implementingAge,
            builder: (context, implementingAge) {
              return CustomCheckboxButton(
                text: "msg_implementing_agents".tr,
                value: implementingAge,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtSevenBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtSevenBloc,
              AddLandandwatermgmtSevenState, bool?>(
            selector: (state) => state.othervalue,
            builder: (context, othervalue) {
              return CustomCheckboxButton(
                text: "lbl_other".tr,
                value: othervalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtSevenBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtSevenBloc,
              AddLandandwatermgmtSevenState, bool?>(
            selector: (state) => state.selfPrivate,
            builder: (context, selfPrivate) {
              return CustomCheckboxButton(
                text: "lbl_self_private".tr,
                value: selfPrivate,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtSevenBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtSevenBloc,
              AddLandandwatermgmtSevenState, bool?>(
            selector: (state) => state.trashone,
            builder: (context, trashone) {
              return CustomCheckboxButton(
                text: "msg_national_government".tr,
                value: trashone,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                  right: 40.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtSevenBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 69.v,
              bottom: 14.v,
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
