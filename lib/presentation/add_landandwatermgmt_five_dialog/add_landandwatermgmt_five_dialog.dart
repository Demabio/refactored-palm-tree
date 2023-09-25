import 'bloc/add_landandwatermgmt_five_bloc.dart';
import 'models/add_landandwatermgmt_five_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddLandandwatermgmtFiveDialog extends StatelessWidget {
  const AddLandandwatermgmtFiveDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtFiveBloc>(
      create: (context) =>
          AddLandandwatermgmtFiveBloc(AddLandandwatermgmtFiveState(
        addLandandwatermgmtFiveModelObj: AddLandandwatermgmtFiveModel(),
      ))
            ..add(AddLandandwatermgmtFiveInitialEvent()),
      child: AddLandandwatermgmtFiveDialog(),
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
              "msg_add_irrigation_type".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.furrowvalue,
            builder: (context, furrowvalue) {
              return CustomCheckboxButton(
                text: "lbl_furrow".tr,
                value: furrowvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 36.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.dripvalue,
            builder: (context, dripvalue) {
              return CustomCheckboxButton(
                text: "lbl_drip".tr,
                value: dripvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.sprinklervalue,
            builder: (context, sprinklervalue) {
              return CustomCheckboxButton(
                text: "lbl_sprinkler".tr,
                value: sprinklervalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.centrePivot,
            builder: (context, centrePivot) {
              return CustomCheckboxButton(
                text: "lbl_centre_pivot".tr,
                value: centrePivot,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.bucketIrrigatio,
            builder: (context, bucketIrrigatio) {
              return CustomCheckboxButton(
                text: "msg_bucket_irrigation".tr,
                value: bucketIrrigatio,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.basinIrrigation,
            builder: (context, basinIrrigation) {
              return CustomCheckboxButton(
                text: "msg_basin_irrigation".tr,
                value: basinIrrigation,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.floodingvalue,
            builder: (context, floodingvalue) {
              return CustomCheckboxButton(
                text: "lbl_flooding".tr,
                value: floodingvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFiveBloc,
              AddLandandwatermgmtFiveState, bool?>(
            selector: (state) => state.furrowCanal,
            builder: (context, furrowCanal) {
              return CustomCheckboxButton(
                text: "lbl_furrow_canal".tr,
                value: furrowCanal,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFiveBloc>()
                      .add(ChangeCheckBox7Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 28.v,
              bottom: 16.v,
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
