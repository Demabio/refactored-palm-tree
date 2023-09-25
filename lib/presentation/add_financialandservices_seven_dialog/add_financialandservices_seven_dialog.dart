import 'bloc/add_financialandservices_seven_bloc.dart';
import 'models/add_financialandservices_seven_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddFinancialandservicesSevenDialog extends StatelessWidget {
  const AddFinancialandservicesSevenDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesSevenBloc>(
      create: (context) =>
          AddFinancialandservicesSevenBloc(AddFinancialandservicesSevenState(
        addFinancialandservicesSevenModelObj:
            AddFinancialandservicesSevenModel(),
      ))
            ..add(AddFinancialandservicesSevenInitialEvent()),
      child: AddFinancialandservicesSevenDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 23.v,
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
              "msg_add_extension_service".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddFinancialandservicesSevenBloc,
              AddFinancialandservicesSevenState, bool?>(
            selector: (state) => state.nationalGovernm,
            builder: (context, nationalGovernm) {
              return CustomCheckboxButton(
                text: "msg_national_government2".tr,
                value: nationalGovernm,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 38.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSevenBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSevenBloc,
              AddFinancialandservicesSevenState, bool?>(
            selector: (state) => state.countyGovernmen,
            builder: (context, countyGovernmen) {
              return CustomCheckboxButton(
                text: "msg_county_government".tr,
                value: countyGovernmen,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSevenBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSevenBloc,
              AddFinancialandservicesSevenState, bool?>(
            selector: (state) => state.ngovalue,
            builder: (context, ngovalue) {
              return CustomCheckboxButton(
                text: "lbl_ngo".tr,
                value: ngovalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSevenBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSevenBloc,
              AddFinancialandservicesSevenState, bool?>(
            selector: (state) => state.privatevalue,
            builder: (context, privatevalue) {
              return CustomCheckboxButton(
                text: "lbl_private".tr,
                value: privatevalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSevenBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSevenBloc,
              AddFinancialandservicesSevenState, bool?>(
            selector: (state) => state.othervalue,
            builder: (context, othervalue) {
              return CustomCheckboxButton(
                text: "lbl_other".tr,
                value: othervalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSevenBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSevenBloc,
              AddFinancialandservicesSevenState, bool?>(
            selector: (state) => state.televisionvalue,
            builder: (context, televisionvalue) {
              return CustomCheckboxButton(
                text: "lbl_television".tr,
                value: televisionvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSevenBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesSevenBloc,
              AddFinancialandservicesSevenState, bool?>(
            selector: (state) => state.relativesvalue,
            builder: (context, relativesvalue) {
              return CustomCheckboxButton(
                text: "lbl_relatives".tr,
                value: relativesvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesSevenBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 70.v,
              bottom: 18.v,
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
