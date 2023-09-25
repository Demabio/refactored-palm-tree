import 'bloc/add_financialandservices_eight_bloc.dart';
import 'models/add_financialandservices_eight_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddFinancialandservicesEightDialog extends StatelessWidget {
  const AddFinancialandservicesEightDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesEightBloc>(
      create: (context) =>
          AddFinancialandservicesEightBloc(AddFinancialandservicesEightState(
        addFinancialandservicesEightModelObj:
            AddFinancialandservicesEightModel(),
      ))
            ..add(AddFinancialandservicesEightInitialEvent()),
      child: AddFinancialandservicesEightDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 13.v,
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
              left: 3.h,
              top: 10.v,
            ),
            child: Text(
              "msg_add_mode_of_extension".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddFinancialandservicesEightBloc,
              AddFinancialandservicesEightState, bool?>(
            selector: (state) => state.eExtension,
            builder: (context, eExtension) {
              return CustomCheckboxButton(
                text: "lbl_e_extension".tr,
                value: eExtension,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 12.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesEightBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesEightBloc,
              AddFinancialandservicesEightState, bool?>(
            selector: (state) => state.faceToFace,
            builder: (context, faceToFace) {
              return CustomCheckboxButton(
                text: "lbl_face_to_face".tr,
                value: faceToFace,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesEightBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesEightBloc,
              AddFinancialandservicesEightState, bool?>(
            selector: (state) => state.farmerFieldScho,
            builder: (context, farmerFieldScho) {
              return CustomCheckboxButton(
                text: "msg_farmer_field_schools".tr,
                value: farmerFieldScho,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesEightBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesEightBloc,
              AddFinancialandservicesEightState, bool?>(
            selector: (state) => state.trash,
            builder: (context, trash) {
              return CustomCheckboxButton(
                text: "msg_group_demonstrations".tr,
                value: trash,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesEightBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesEightBloc,
              AddFinancialandservicesEightState, bool?>(
            selector: (state) => state.peerToPeer,
            builder: (context, peerToPeer) {
              return CustomCheckboxButton(
                text: "lbl_peer_to_peer".tr,
                value: peerToPeer,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesEightBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesEightBloc,
              AddFinancialandservicesEightState, bool?>(
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
                      .read<AddFinancialandservicesEightBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 45.v,
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
