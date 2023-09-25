import 'bloc/add_aquaculture_three_bloc.dart';
import 'models/add_aquaculture_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddAquacultureThreeDialog extends StatelessWidget {
  const AddAquacultureThreeDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureThreeBloc>(
      create: (context) => AddAquacultureThreeBloc(AddAquacultureThreeState(
        addAquacultureThreeModelObj: AddAquacultureThreeModel(),
      ))
        ..add(AddAquacultureThreeInitialEvent()),
      child: AddAquacultureThreeDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 26.v,
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
              "msg_add_aquaculture".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddAquacultureThreeBloc, AddAquacultureThreeState,
              bool?>(
            selector: (state) => state.brackishvalue,
            builder: (context, brackishvalue) {
              return CustomCheckboxButton(
                text: "lbl_brackish".tr,
                value: brackishvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 35.v,
                ),
                onChange: (value) {
                  context
                      .read<AddAquacultureThreeBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddAquacultureThreeBloc, AddAquacultureThreeState,
              bool?>(
            selector: (state) => state.chickMarsh,
            builder: (context, chickMarsh) {
              return CustomCheckboxButton(
                text: "lbl_chick_marsh".tr,
                value: chickMarsh,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddAquacultureThreeBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddAquacultureThreeBloc, AddAquacultureThreeState,
              bool?>(
            selector: (state) => state.homeMadeFeedMix,
            builder: (context, homeMadeFeedMix) {
              return CustomCheckboxButton(
                text: "msg_home_made_feed_mix".tr,
                value: homeMadeFeedMix,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddAquacultureThreeBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 36.v,
              bottom: 8.v,
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
