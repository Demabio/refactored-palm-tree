import 'bloc/add_financialandservices_six_bloc.dart';
import 'models/add_financialandservices_six_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddFinancialandservicesSixDialog extends StatelessWidget {
  const AddFinancialandservicesSixDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesSixBloc>(
      create: (context) =>
          AddFinancialandservicesSixBloc(AddFinancialandservicesSixState(
        addFinancialandservicesSixModelObj: AddFinancialandservicesSixModel(),
      ))
            ..add(AddFinancialandservicesSixInitialEvent()),
      child: AddFinancialandservicesSixDialog(),
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
              "msg_agricultural_info".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddFinancialandservicesSixBloc,
              AddFinancialandservicesSixState, bool?>(
            selector: (state) => state.publicGathering,
            builder: (context, publicGathering) {
              return CustomCheckboxButton(
                text: "msg_public_gathering".tr,
                value: publicGathering,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 10.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSixBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSixBloc,
              AddFinancialandservicesSixState, bool?>(
            selector: (state) => state.radiovalue,
            builder: (context, radiovalue) {
              return CustomCheckboxButton(
                text: "lbl_radio".tr,
                value: radiovalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSixBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSixBloc,
              AddFinancialandservicesSixState, bool?>(
            selector: (state) => state.trash,
            builder: (context, trash) {
              return CustomCheckboxButton(
                text: "msg_newspaper_publications".tr,
                value: trash,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                  right: 82.h,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSixBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSixBloc,
              AddFinancialandservicesSixState, bool?>(
            selector: (state) => state.internetvalue,
            builder: (context, internetvalue) {
              return CustomCheckboxButton(
                text: "lbl_internet".tr,
                value: internetvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSixBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSixBloc,
              AddFinancialandservicesSixState, bool?>(
            selector: (state) => state.extensionMeetin,
            builder: (context, extensionMeetin) {
              return CustomCheckboxButton(
                text: "msg_extension_meetings".tr,
                value: extensionMeetin,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSixBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 14.v,
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
