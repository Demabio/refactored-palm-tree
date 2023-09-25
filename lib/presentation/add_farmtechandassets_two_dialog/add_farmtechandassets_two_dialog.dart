import 'bloc/add_farmtechandassets_two_bloc.dart';
import 'models/add_farmtechandassets_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddFarmtechandassetsTwoDialog extends StatelessWidget {
  const AddFarmtechandassetsTwoDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmtechandassetsTwoBloc>(
      create: (context) =>
          AddFarmtechandassetsTwoBloc(AddFarmtechandassetsTwoState(
        addFarmtechandassetsTwoModelObj: AddFarmtechandassetsTwoModel(),
      ))
            ..add(AddFarmtechandassetsTwoInitialEvent()),
      child: AddFarmtechandassetsTwoDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 24.v,
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
              "lbl_add_powersource".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddFarmtechandassetsTwoBloc,
              AddFarmtechandassetsTwoState, bool?>(
            selector: (state) => state.animalDraft,
            builder: (context, animalDraft) {
              return CustomCheckboxButton(
                text: "lbl_animal_draft2".tr,
                value: animalDraft,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 37.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsTwoBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsTwoBloc,
              AddFarmtechandassetsTwoState, bool?>(
            selector: (state) => state.gridElectricity,
            builder: (context, gridElectricity) {
              return CustomCheckboxButton(
                text: "msg_grid_electricity".tr,
                value: gridElectricity,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsTwoBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsTwoBloc,
              AddFarmtechandassetsTwoState, bool?>(
            selector: (state) => state.manualvalue,
            builder: (context, manualvalue) {
              return CustomCheckboxButton(
                text: "lbl_manual".tr,
                value: manualvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsTwoBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsTwoBloc,
              AddFarmtechandassetsTwoState, bool?>(
            selector: (state) => state.trash,
            builder: (context, trash) {
              return CustomCheckboxButton(
                text: "msg_motorized_fossil".tr,
                value: trash,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsTwoBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsTwoBloc,
              AddFarmtechandassetsTwoState, bool?>(
            selector: (state) => state.othervalue,
            builder: (context, othervalue) {
              return CustomCheckboxButton(
                text: "lbl_other".tr,
                value: othervalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsTwoBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsTwoBloc,
              AddFarmtechandassetsTwoState, bool?>(
            selector: (state) => state.solarvalue,
            builder: (context, solarvalue) {
              return CustomCheckboxButton(
                text: "lbl_solar".tr,
                value: solarvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsTwoBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsTwoBloc,
              AddFarmtechandassetsTwoState, bool?>(
            selector: (state) => state.windvalue,
            builder: (context, windvalue) {
              return CustomCheckboxButton(
                text: "lbl_wind".tr,
                value: windvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsTwoBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 30.v,
              bottom: 15.v,
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
