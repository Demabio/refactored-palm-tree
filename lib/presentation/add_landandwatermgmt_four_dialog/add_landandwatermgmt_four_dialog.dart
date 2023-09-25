import 'bloc/add_landandwatermgmt_four_bloc.dart';
import 'models/add_landandwatermgmt_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddLandandwatermgmtFourDialog extends StatelessWidget {
  const AddLandandwatermgmtFourDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtFourBloc>(
      create: (context) =>
          AddLandandwatermgmtFourBloc(AddLandandwatermgmtFourState(
        addLandandwatermgmtFourModelObj: AddLandandwatermgmtFourModel(),
      ))
            ..add(AddLandandwatermgmtFourInitialEvent()),
      child: AddLandandwatermgmtFourDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 14.v,
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
              "msg_add_water_source".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.trash,
            builder: (context, trash) {
              return CustomCheckboxButton(
                text: "msg_natural_rivers_and".tr,
                value: trash,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 37.v,
                  right: 74.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.adjacentWaterBo,
            builder: (context, adjacentWaterBo) {
              return CustomCheckboxButton(
                text: "msg_adjacent_water_body".tr,
                value: adjacentWaterBo,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                  right: 29.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.localityWaterSu,
            builder: (context, localityWaterSu) {
              return CustomCheckboxButton(
                text: "msg_locality_water_supply".tr,
                value: localityWaterSu,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.manMadeDam,
            builder: (context, manMadeDam) {
              return CustomCheckboxButton(
                text: "lbl_man_made_dam".tr,
                value: manMadeDam,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.waterPan,
            builder: (context, waterPan) {
              return CustomCheckboxButton(
                text: "lbl_water_pan2".tr,
                value: waterPan,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.trashone,
            builder: (context, trashone) {
              return CustomCheckboxButton(
                text: "msg_shallow_well_or".tr,
                value: trashone,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                  right: 86.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.roadRunoff,
            builder: (context, roadRunoff) {
              return CustomCheckboxButton(
                text: "lbl_road_runoff".tr,
                value: roadRunoff,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
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
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox7Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.rainvalue,
            builder: (context, rainvalue) {
              return CustomCheckboxButton(
                text: "lbl_rain".tr,
                value: rainvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox8Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.harvestedWater,
            builder: (context, harvestedWater) {
              return CustomCheckboxButton(
                text: "lbl_harvested_water".tr,
                value: harvestedWater,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox9Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.trashtwo,
            builder: (context, trashtwo) {
              return CustomCheckboxButton(
                text: "msg_independent_water".tr,
                value: trashtwo,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                  right: 46.h,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox10Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddLandandwatermgmtFourBloc,
              AddLandandwatermgmtFourState, bool?>(
            selector: (state) => state.waterTrucking,
            builder: (context, waterTrucking) {
              return CustomCheckboxButton(
                text: "lbl_water_trucking2".tr,
                value: waterTrucking,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddLandandwatermgmtFourBloc>()
                      .add(ChangeCheckBox11Event(value: value));
                },
              );
            },
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              bottom: 6.v,
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
