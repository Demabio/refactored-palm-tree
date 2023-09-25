import 'bloc/add_landandwatermgmt_three_bloc.dart';
import 'models/add_landandwatermgmt_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddLandandwatermgmtThreeDialog extends StatelessWidget {
  const AddLandandwatermgmtThreeDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtThreeBloc>(
      create: (context) =>
          AddLandandwatermgmtThreeBloc(AddLandandwatermgmtThreeState(
        addLandandwatermgmtThreeModelObj: AddLandandwatermgmtThreeModel(),
      ))
            ..add(AddLandandwatermgmtThreeInitialEvent()),
      child: AddLandandwatermgmtThreeDialog(),
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
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Text(
              "msg_add_land_practice".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.biogasProductio,
            builder: (context, biogasProductio) {
              return CustomCheckboxButton(
                text: "msg_biogas_production".tr,
                value: biogasProductio,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 38.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.mulchingvalue,
            builder: (context, mulchingvalue) {
              return CustomCheckboxButton(
                text: "lbl_mulching".tr,
                value: mulchingvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.trash,
            builder: (context, trash) {
              return CustomCheckboxButton(
                text: "msg_conservation_agriculture".tr,
                value: trash,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                  right: 79.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.terracingvalue,
            builder: (context, terracingvalue) {
              return CustomCheckboxButton(
                text: "lbl_terracing".tr,
                value: terracingvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.waterHarvesting,
            builder: (context, waterHarvesting) {
              return CustomCheckboxButton(
                text: "msg_water_harvesting".tr,
                value: waterHarvesting,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.fymCompostManur,
            builder: (context, fymCompostManur) {
              return CustomCheckboxButton(
                text: "msg_fym_compost_manure".tr,
                value: fymCompostManur,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.zaiPits,
            builder: (context, zaiPits) {
              return CustomCheckboxButton(
                text: "lbl_zai_pits".tr,
                value: zaiPits,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.cutOffDrains,
            builder: (context, cutOffDrains) {
              return CustomCheckboxButton(
                text: "lbl_cut_off_drains".tr,
                value: cutOffDrains,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox7Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.trashone,
            builder: (context, trashone) {
              return CustomCheckboxButton(
                text: "msg_contour_ploughing_ridging".tr,
                value: trashone,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                  right: 59.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox8Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.trashtwo,
            builder: (context, trashtwo) {
              return CustomCheckboxButton(
                text: "msg_integrated_pest".tr,
                value: trashtwo,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                  right: 40.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox9Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.minimumTillage,
            builder: (context, minimumTillage) {
              return CustomCheckboxButton(
                text: "lbl_minimum_tillage".tr,
                value: minimumTillage,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox10Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.deepRipping,
            builder: (context, deepRipping) {
              return CustomCheckboxButton(
                text: "lbl_deep_ripping".tr,
                value: deepRipping,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox11Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.manuringCompost,
            builder: (context, manuringCompost) {
              return CustomCheckboxButton(
                text: "msg_manuring_composting".tr,
                value: manuringCompost,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox12Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtThreeBloc,
              AddLandandwatermgmtThreeState, bool?>(
            selector: (state) => state.grassStrips,
            builder: (context, grassStrips) {
              return CustomCheckboxButton(
                text: "lbl_grass_strips".tr,
                value: grassStrips,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtThreeBloc>()
                      .add(ChangeCheckBox13Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 29.v,
              bottom: 7.v,
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
