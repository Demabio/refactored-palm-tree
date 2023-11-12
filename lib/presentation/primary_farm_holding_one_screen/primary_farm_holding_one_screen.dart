import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/primary_farm_holding_one_bloc.dart';
import 'models/primary_farm_holding_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore_for_file: must_be_immutable
class PrimaryFarmHoldingOneScreen extends StatelessWidget {
  PrimaryFarmHoldingOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<PrimaryFarmHoldingOneBloc>(
        create: (context) => PrimaryFarmHoldingOneBloc(
            PrimaryFarmHoldingOneState(
                primaryFarmHoldingOneModelObj: PrimaryFarmHoldingOneModel()))
          ..add(PrimaryFarmHoldingOneInitialEvent()),
        child: PrimaryFarmHoldingOneScreen());
  }

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  FocusNode node6 = FocusNode();
  FocusNode node7 = FocusNode();
  FocusNode node8 = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: CustomAppBar(
                  height: Device.orientation == Orientation.portrait
                      ? 15.w
                      : DeviceExt(15).h,
                  leadingWidth: DeviceExt((60 / 841) * 100).h,
                  leading: CustomImageView(
                      svgPath: ImageConstant.imgSort,
                      height: Device.orientation == Orientation.portrait
                          ? DeviceExt(5).h
                          : 5.w,
                      width: Device.orientation == Orientation.portrait
                          ? DeviceExt(5).h
                          : 5.w,
                      onTap: () {
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "Farm Holding".tr),
                  styleType: Style.bgFill),
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      padding:
                          EdgeInsets.only(top: DeviceExt((5 / 411) * 100).w),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt((16 / 841) * 100).h,
                              right: DeviceExt((16 / 841) * 100).h,
                              bottom: DeviceExt((5 / 411) * 100).w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingOneModelObj,
                                    builder: ((context,
                                        farmersIdentificationOneModelObj) {
                                      return EasyStepper(
                                        activeStep:
                                            farmersIdentificationOneModelObj!
                                                .stepped,
                                        onStepReached: (index) {
                                          _navToStep(
                                              index,
                                              context,
                                              farmersIdentificationOneModelObj
                                                  .pfProgress!);
                                        },
                                        direction: Axis.horizontal,
                                        unreachedStepIconColor:
                                            theme.colorScheme.secondary,
                                        finishedStepIconColor: Colors.orange,
                                        activeStepTextColor: Colors.black87,
                                        finishedStepTextColor: Colors.black87,
                                        internalPadding: 0,
                                        showLoadingAnimation: true,
                                        stepRadius:
                                            DeviceExt((25 / 841) * 100).h,
                                        disableScroll: true,
                                        showStepBorder: true,
                                        alignment: Alignment.center,
                                        steps: [
                                          EasyStep(
                                            customStep: CircleAvatar(
                                              radius:
                                                  DeviceExt((35 / 841) * 100).h,
                                              backgroundColor:
                                                  theme.colorScheme.primary,
                                              child: CircleAvatar(
                                                radius:
                                                    DeviceExt((25 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child:
                                                    farmersIdentificationOneModelObj
                                                                .stepped2 <=
                                                            0
                                                        ? Text(
                                                            '1', // You can replace '1' with the desired number
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  DeviceExt(1.8)
                                                                      .h,
                                                            ),
                                                          )
                                                        : Icon(
                                                            Icons.check,
                                                            size:
                                                                DeviceExt(5).h,
                                                          ),
                                              ),
                                            ),
                                            customTitle: Text("Step 1".tr,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleMediumBlack90018),
                                          ),
                                          EasyStep(
                                            customStep: CircleAvatar(
                                              radius:
                                                  DeviceExt((35 / 841) * 100).h,
                                              backgroundColor:
                                                  theme.colorScheme.primary,
                                              child: CircleAvatar(
                                                radius:
                                                    DeviceExt((25 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child:
                                                    farmersIdentificationOneModelObj
                                                                .stepped2 <=
                                                            1
                                                        ? Text(
                                                            '2', // You can replace '1' with the desired number
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  DeviceExt(1.8)
                                                                      .h,
                                                            ),
                                                          )
                                                        : Icon(
                                                            Icons.check,
                                                            size:
                                                                DeviceExt(5).h,
                                                          ),
                                              ),
                                            ),

                                            customTitle: Text("Step 2".tr,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleMediumBlack90018),
                                            //topTitle: true,
                                          ),
                                        ],
                                      );
                                    })),
                                SizedBox(height: DeviceExt((13 / 411) * 100).w),
                                Text("msg_enumaration_geography".tr,
                                    style:
                                        CustomTextStyles.titleMediumSemiBold),
                                SizedBox(height: DeviceExt((19 / 411) * 100).w),
                                Text("Village Unit".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) => state.vil,
                                    builder: (context, nameController) {
                                      return CustomTextFormField(
                                          focusNode: node7,
                                          controller: nameController,
                                          autofocus: false,
                                          hintText: "msg_village_unit_name2".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003,
                                          validator: (value) {
                                            if (!isText(value)) {
                                              return "Please enter valid text";
                                            }
                                            return null;
                                          },
                                          contentPadding: EdgeInsets.fromLTRB(
                                              DeviceExt((12 / 841) * 100).h,
                                              DeviceExt((16 / 411) * 100).w,
                                              DeviceExt((12 / 841) * 100).h,
                                              DeviceExt((9 / 411) * 100).w));
                                    }),
                                SizedBox(height: DeviceExt((21 / 411) * 100).w),
                                Text("Shopping Center".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) => state.shop,
                                    builder:
                                        (context, shoppingCenterController) {
                                      return CustomTextFormField(
                                          focusNode: node8,
                                          controller: shoppingCenterController,
                                          autofocus: false,
                                          hintText: "lbl_shopping_center".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              DeviceExt((16 / 841) * 100).h,
                                              DeviceExt((15 / 411) * 100).w,
                                              DeviceExt((16 / 841) * 100).h,
                                              DeviceExt((10 / 411) * 100).w));
                                    }),
                                SizedBox(height: DeviceExt((20 / 411) * 100).w),
                                SizedBox(height: DeviceExt((11 / 411) * 100).w),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceExt((13 / 841) * 100).h,
                                        top: DeviceExt((13 / 411) * 100).w),
                                    child: Text("msg_main_farm_enterprises".tr,
                                        style: CustomTextStyles
                                            .titleMediumSemiBold)),
                                SizedBox(height: DeviceExt((27 / 411) * 100).w),
                                Text("msg_descriptive_name2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) => state.nameController,
                                    builder: (context, nameController) {
                                      return CustomTextFormField(
                                        autofocus: false,
                                        focusNode: node1,
                                        controller: nameController,
                                        hintText: "lbl_name".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003,
                                        validator: (value) {
                                          if (!isText(value,
                                              isRequired: true)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        },
                                      );
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Text("msg_total_land_size".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) => state.sizeController,
                                    builder: (context, sizeController) {
                                      return CustomTextFormField(
                                          controller: sizeController,
                                          autofocus: false,
                                          validator: (value) {
                                            if (!isNumeric(value,
                                                isRequired: true)) {
                                              return "Please enter valid input";
                                            }
                                            return null;
                                          },
                                          textInputType: TextInputType.number,
                                          focusNode: node2,
                                          hintText: "lbl_size".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Text("lbl_area_unit2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingOneModelObj,
                                    builder: (context,
                                        primaryFarmHoldingOneModelObj) {
                                      return CustomDropDown(
                                          icon: Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      DeviceExt((30 / 841) * 100)
                                                          .h),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          DeviceExt((10 / 841) * 100)
                                                              .h)),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPrimary)),
                                          hintText: "lbl_select".tr,
                                          validator: (value) {
                                            if (value == null) {
                                              return "Field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          val: primaryFarmHoldingOneModelObj
                                              ?.selectedDropDownValue,
                                          items: primaryFarmHoldingOneModelObj
                                                  ?.dropdownItemList ??
                                              [],
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    PrimaryFarmHoldingOneBloc>()
                                                .add(ChangeDropDownEvent(
                                                    value: value));
                                          });
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Text("msg_aquaculture_production2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingOneModelObj,
                                    builder: (context,
                                        primaryFarmHoldingTwoModelObj) {
                                      return CustomDropDown(
                                          autofocus: false,
                                          validator: (value) {
                                            if (value == null) {
                                              return "Field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          val: primaryFarmHoldingTwoModelObj
                                              ?.selectedDropDownValue4,
                                          icon: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  DeviceExt((30 / 841) * 100).h,
                                                  DeviceExt((10 / 411) * 100).w,
                                                  DeviceExt((9 / 841) * 100).h,
                                                  DeviceExt((15 / 411) * 100)
                                                      .w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          DeviceExt((10 / 841) * 100)
                                                              .h)),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPrimary)),
                                          hintText: "lbl_select".tr,
                                          items: primaryFarmHoldingTwoModelObj
                                                  ?.dropdownItemList4 ??
                                              [],
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    PrimaryFarmHoldingOneBloc>()
                                                .add(ChangeDropDown4Event(
                                                    value: value));
                                          });
                                    }),
                                SizedBox(height: DeviceExt((20 / 411) * 100).w),
                                Text("msg_crop_production2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingOneModelObj,
                                    builder: (context,
                                        primaryFarmHoldingTwoModelObj) {
                                      return CustomDropDown(
                                          autofocus: false,
                                          validator: (value) {
                                            if (value == null) {
                                              return "Field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          val: primaryFarmHoldingTwoModelObj
                                              ?.selectedDropDownValue2,
                                          icon: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  DeviceExt((30 / 841) * 100).h,
                                                  DeviceExt((10 / 411) * 100).w,
                                                  DeviceExt((9 / 841) * 100).h,
                                                  DeviceExt((15 / 411) * 100)
                                                      .w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          DeviceExt((10 / 841) * 100)
                                                              .h)),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPrimary)),
                                          hintText: "lbl_select".tr,
                                          items: primaryFarmHoldingTwoModelObj
                                                  ?.dropdownItemList2 ??
                                              [],
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    PrimaryFarmHoldingOneBloc>()
                                                .add(ChangeDropDown2Event(
                                                    value: value));
                                          });
                                    }),
                                SizedBox(height: DeviceExt((19 / 411) * 100).w),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingOneModelObj,
                                    builder: (context,
                                        primaryFarmHoldingOneModelObj) {
                                      return Visibility(
                                        visible: primaryFarmHoldingOneModelObj
                                                    ?.selectedDropDownValue2
                                                    ?.id ==
                                                1
                                            ? true
                                            : false,
                                        child: Text(
                                            "msg_size_of_land_under2".tr,
                                            style: CustomTextStyles
                                                .labelMediumPrimary_1),
                                      );
                                    }),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneState>(
                                    selector: (state) => state,
                                    builder: (context, state) {
                                      return Visibility(
                                        visible: state
                                                    .primaryFarmHoldingOneModelObj
                                                    ?.selectedDropDownValue2
                                                    ?.id ==
                                                1
                                            ? true
                                            : false,
                                        child: CustomTextFormField(
                                            controller: state.sizeoneController,
                                            autofocus: false,
                                            focusNode: node3,
                                            hintText: "lbl_size".tr,
                                            validator: (value) {
                                              if (!isNumeric(value,
                                                  isRequired: true)) {
                                                return "Please enter valid input";
                                              }
                                              return null;
                                            },
                                            textInputType: TextInputType.number,
                                            hintStyle: CustomTextStyles
                                                .titleMediumBluegray40003),
                                      );
                                    }),
                                SizedBox(height: DeviceExt((19 / 411) * 100).w),
                                Text("msg_livestock_production2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingOneModelObj,
                                    builder: (context,
                                        primaryFarmHoldingOneModelObj) {
                                      return CustomDropDown(
                                          autofocus: false,
                                          validator: (value) {
                                            if (value == null) {
                                              return "Field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          val: primaryFarmHoldingOneModelObj
                                              ?.selectedDropDownValue3,
                                          icon: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  DeviceExt((30 / 841) * 100).h,
                                                  DeviceExt((10 / 411) * 100).w,
                                                  DeviceExt((9 / 841) * 100).h,
                                                  DeviceExt((15 / 411) * 100)
                                                      .w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          DeviceExt((10 / 841) * 100)
                                                              .h)),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPrimary)),
                                          hintText: "lbl_select".tr,
                                          items: primaryFarmHoldingOneModelObj
                                                  ?.dropdownItemList3 ??
                                              [],
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    PrimaryFarmHoldingOneBloc>()
                                                .add(ChangeDropDown3Event(
                                                    value: value));
                                          });
                                    }),
                                SizedBox(height: DeviceExt((19 / 411) * 100).w),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingOneModelObj,
                                    builder: (context,
                                        primaryFarmHoldingOneModelObj) {
                                      return Visibility(
                                        visible: primaryFarmHoldingOneModelObj
                                                    ?.selectedDropDownValue3
                                                    ?.id ==
                                                1
                                            ? true
                                            : false,
                                        child: Text("msg_total_land_area2".tr,
                                            style: CustomTextStyles
                                                .labelMediumPrimary_1),
                                      );
                                    }),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        PrimaryFarmHoldingOneState>(
                                    selector: (state) => state,
                                    builder: (context, state) {
                                      return Visibility(
                                        visible: state
                                                    .primaryFarmHoldingOneModelObj
                                                    ?.selectedDropDownValue3
                                                    ?.id ==
                                                1
                                            ? true
                                            : false,
                                        child: CustomTextFormField(
                                            controller: state.areaController,
                                            focusNode: node4,
                                            autofocus: false,
                                            hintText: "lbl_area".tr,
                                            validator: (value) {
                                              if (!isNumeric(value,
                                                  isRequired: true)) {
                                                return "Please enter valid input";
                                              }
                                              return null;
                                            },
                                            textInputType: TextInputType.number,
                                            hintStyle: CustomTextStyles
                                                .titleMediumBluegray40003),
                                      );
                                    }),
                                SizedBox(height: DeviceExt((18 / 411) * 100).w),
                                Text("msg_size_of_land_leased2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.sizeLandLeasedController,
                                    builder:
                                        (context, sizeLandLeasedController) {
                                      return CustomTextFormField(
                                          controller: sizeLandLeasedController,
                                          autofocus: false,
                                          focusNode: node5,
                                          textInputType: TextInputType.number,
                                          hintText:
                                              "msg_size_of_land_leased2".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: DeviceExt((18 / 411) * 100).w),
                                Text("msg_size_of_land_lying2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.sizeLandIdleController,
                                    builder: (context, sizeLandIdleController) {
                                      return CustomTextFormField(
                                          controller: sizeLandIdleController,
                                          autofocus: false,
                                          focusNode: node6,
                                          textInputType: TextInputType.number,
                                          hintText:
                                              "msg_size_of_land_lying2".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003,
                                          textInputAction:
                                              TextInputAction.done);
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: CustomOutlinedButton(
                                        text: "lbl_back".tr,
                                        margin: EdgeInsets.only(
                                            right:
                                                DeviceExt((1 / 841) * 100).h),
                                        buttonStyle: CustomButtonStyles
                                            .outlinePrimaryTL10,
                                        buttonTextStyle:
                                            CustomTextStyles.bodyLargePrimary_1,
                                        isDisabled: true,
                                      )),
                                      Expanded(
                                          child: CustomElevatedButton(
                                              text: "lbl_next".tr,
                                              margin: EdgeInsets.only(
                                                  left:
                                                      DeviceExt((1 / 841) * 100)
                                                          .h),
                                              onTap: () {
                                                nextPage(context);
                                              }))
                                    ]),
                                SizedBox(height: DeviceExt((12 / 411) * 100).w),
                                CustomElevatedButton(
                                    text: "lbl_save".tr,
                                    leftIcon: Container(
                                        margin: EdgeInsets.only(
                                            right:
                                                DeviceExt((10 / 841) * 100).h),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgSaveWhiteA700)),
                                    onTap: () {
                                      saveDraft(context);
                                    })
                              ])))))),
    );
  }

  nextPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PrimaryFarmHoldingOneBloc>().add(
            NextTapEvent(
              createSuccessful: () {
                _success(context);
              },
              createFailed: () {
                _failed(context);
              },
              validation: () {
                closedialog(context, "Farm Size Exceeded",
                    "Land sizes entered exceed the stated farm size.");
              },
            ),
          );
    }
  }

  _success(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.primaryFarmHoldingTwoScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) async {
    String label = "Save to Draft";
    String body = "Do you want to stop and save details to draft?";
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialog.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    if (_formKey.currentState!.validate()) {
      context.read<PrimaryFarmHoldingOneBloc>().add(
            SaveTapEvent(
              createSuccessful: () {
                _successSaved(context);
              },
              createFailed: () {
                _failed(context);
              },
              validation: () {
                closedialog(context, "Farm Size Exceeded",
                    "Land sizes entered exceed the stated farm size.");
              },
            ),
          );
    }
  }

  closedialog(BuildContext context, String label, String body) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialogTwo.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  _navToStep(int val, BuildContext context, PFProgress pfProgress) {
    if (_formKey.currentState!.validate()) {
      if (val == 1 && pfProgress.pageOne == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.primaryFarmHoldingTwoScreen);
      }
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.primaryFarmHoldingScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.primaryFarmHoldingScreen);
  }

  /// Navigates to the primaryFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.primaryFarmHoldingScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingTwoScreen.
  onTapNext(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.primaryFarmHoldingTwoScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingScreen.
  onTapSave(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.primaryFarmHoldingScreen,
    );
  }
}
