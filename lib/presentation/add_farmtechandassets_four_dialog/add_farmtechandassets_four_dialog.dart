import 'bloc/add_farmtechandassets_four_bloc.dart';
import 'models/add_farmtechandassets_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddFarmtechandassetsFourDialog extends StatelessWidget {
  const AddFarmtechandassetsFourDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmtechandassetsFourBloc>(
      create: (context) =>
          AddFarmtechandassetsFourBloc(AddFarmtechandassetsFourState(
        addFarmtechandassetsFourModelObj: AddFarmtechandassetsFourModel(),
      ))
            ..add(AddFarmtechandassetsFourInitialEvent()),
      child: AddFarmtechandassetsFourDialog(),
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
              "msg_add_farm_structure".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.animalDip,
            builder: (context, animalDip) {
              return CustomCheckboxButton(
                text: "lbl_animal_dip".tr,
                value: animalDip,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 37.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.animalCrush,
            builder: (context, animalCrush) {
              return CustomCheckboxButton(
                text: "lbl_animal_crush".tr,
                value: animalCrush,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.apiaryvalue,
            builder: (context, apiaryvalue) {
              return CustomCheckboxButton(
                text: "lbl_apiary".tr,
                value: apiaryvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.beeHouse,
            builder: (context, beeHouse) {
              return CustomCheckboxButton(
                text: "lbl_bee_house".tr,
                value: beeHouse,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.catteBoma,
            builder: (context, catteBoma) {
              return CustomCheckboxButton(
                text: "lbl_catte_boma".tr,
                value: catteBoma,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.feedStore,
            builder: (context, feedStore) {
              return CustomCheckboxButton(
                text: "lbl_feed_store".tr,
                value: feedStore,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.generalStore,
            builder: (context, generalStore) {
              return CustomCheckboxButton(
                text: "lbl_general_store".tr,
                value: generalStore,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.greenHouse,
            builder: (context, greenHouse) {
              return CustomCheckboxButton(
                text: "lbl_green_house".tr,
                value: greenHouse,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox7Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.hatcheryvalue,
            builder: (context, hatcheryvalue) {
              return CustomCheckboxButton(
                text: "lbl_hatchery".tr,
                value: hatcheryvalue,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox8Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.hayBailers,
            builder: (context, hayBailers) {
              return CustomCheckboxButton(
                text: "lbl_hay_bailers".tr,
                value: hayBailers,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox9Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.hayStore,
            builder: (context, hayStore) {
              return CustomCheckboxButton(
                text: "lbl_hay_store".tr,
                value: hayStore,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox10Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.loadingRamp,
            builder: (context, loadingRamp) {
              return CustomCheckboxButton(
                text: "lbl_loading_ramp".tr,
                value: loadingRamp,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox11Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.milkingParlor,
            builder: (context, milkingParlor) {
              return CustomCheckboxButton(
                text: "lbl_milking_parlour".tr,
                value: milkingParlor,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox12Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsFourBloc,
              AddFarmtechandassetsFourState, bool?>(
            selector: (state) => state.traditionalGran,
            builder: (context, traditionalGran) {
              return CustomCheckboxButton(
                text: "msg_traditional_granary".tr,
                value: traditionalGran,
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 14.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFarmtechandassetsFourBloc>()
                      .add(ChangeCheckBox13Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 28.v,
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
