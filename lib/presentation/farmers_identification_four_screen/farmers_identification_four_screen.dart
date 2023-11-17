import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/farmers_identification_four_bloc.dart';
import 'models/farmers_identification_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class FarmersIdentificationFourScreen extends StatelessWidget {
  FarmersIdentificationFourScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationFourBloc>(
        create: (context) => FarmersIdentificationFourBloc(
            FarmersIdentificationFourState(
                farmersIdentificationFourModelObj:
                    FarmersIdentificationFourModel()))
          ..add(FarmersIdentificationFourInitialEvent()),
        child: FarmersIdentificationFourScreen());
  }

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () {
        NavigatorService.popAndPushNamed(
            AppRoutes.farmersIdentificationThreeScreen);
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
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
                        goToDetails(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_farmers_identification".tr),
                  styleType: Style.bgFill),
              body: Form(
                key: _formKey,
                child: SizedBox(
                    width: mediaQueryData.size.width,
                    child: SingleChildScrollView(
                        padding:
                            EdgeInsets.only(top: DeviceExt((9 / 411) * 100).w),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: DeviceExt((16 / 841) * 100).h,
                                right: DeviceExt((16 / 841) * 100).h,
                                bottom: DeviceExt((5 / 411) * 100).w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocSelector<
                                          FarmersIdentificationFourBloc,
                                          FarmersIdentificationFourState,
                                          FarmersIdentificationFourModel?>(
                                      selector: (state) => state
                                          .farmersIdentificationFourModelObj,
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
                                                    .fiProgress!);
                                          },
                                          direction: Axis.horizontal,
                                          unreachedStepIconColor:
                                              theme.colorScheme.primary,
                                          finishedStepIconColor: Colors.orange,
                                          activeStepTextColor: Colors.black87,
                                          finishedStepTextColor: Colors.black87,
                                          fitWidth: true,
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
                                                    DeviceExt((35 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: DeviceExt(
                                                          (25 / 841) * 100)
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
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    DeviceExt(
                                                                            1.8)
                                                                        .h,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.check,
                                                              size: DeviceExt(5)
                                                                  .h,
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
                                                    DeviceExt((35 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: DeviceExt(
                                                          (25 / 841) * 100)
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
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    DeviceExt(
                                                                            1.8)
                                                                        .h,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.check,
                                                              size: DeviceExt(5)
                                                                  .h,
                                                            ),
                                                ),
                                              ),

                                              customTitle: Text("Step 2".tr,
                                                  textAlign: TextAlign.center,
                                                  style: CustomTextStyles
                                                      .titleMediumBlack90018),
                                              //topTitle: true,
                                            ),
                                            EasyStep(
                                              customStep: CircleAvatar(
                                                radius:
                                                    DeviceExt((35 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: DeviceExt(
                                                          (25 / 841) * 100)
                                                      .h,
                                                  backgroundColor:
                                                      theme.colorScheme.primary,
                                                  child:
                                                      farmersIdentificationOneModelObj
                                                                  .stepped2 <=
                                                              2
                                                          ? Text(
                                                              '3', // You can replace '1' with the desired number
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    DeviceExt(
                                                                            1.8)
                                                                        .h,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.check,
                                                              size: DeviceExt(5)
                                                                  .h,
                                                            ),
                                                ),
                                              ),
                                              customTitle: Text("Step 3".tr,
                                                  textAlign: TextAlign.center,
                                                  style: CustomTextStyles
                                                      .titleMediumBlack90018),
                                            ),
                                          ],
                                        );
                                      })),
                                  SizedBox(
                                      height: DeviceExt((11 / 411) * 100).w),
                                  Text("msg_respondent_details".tr,
                                      style:
                                          CustomTextStyles.titleMediumSemiBold),
                                  SizedBox(
                                      height: DeviceExt((18 / 411) * 100).w),
                                  Text("msg_is_the_farmer_the".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          FarmersIdentificationFourBloc,
                                          FarmersIdentificationFourState,
                                          FarmersIdentificationFourModel?>(
                                      selector: (state) => state
                                          .farmersIdentificationFourModelObj,
                                      builder: (context,
                                          farmersIdentificationFourModelObj) {
                                        return CustomDropDown(
                                            autofocus: false,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            val: farmersIdentificationFourModelObj
                                                ?.selectedDropDownValue,
                                            icon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    DeviceExt((30 / 841) * 100)
                                                        .h,
                                                    DeviceExt((10 / 411) * 100)
                                                        .w,
                                                    DeviceExt((9 / 841) * 100)
                                                        .h,
                                                    DeviceExt((15 / 411) * 100)
                                                        .w),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                        DeviceExt((10 / 841) * 100)
                                                            .h)),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdownPrimary)),
                                            hintText: "lbl_select".tr,
                                            items: farmersIdentificationFourModelObj
                                                    ?.dropdownItemList ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      FarmersIdentificationFourBloc>()
                                                  .add(ChangeDropDownEvent(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((19 / 411) * 100).w),
                                  BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                    selector: (state) =>
                                        state.farmersIdentificationFourModelObj,
                                    builder: (context,
                                        farmersIdentificationFourModelObj) {
                                      return Visibility(
                                        visible:
                                            !farmersIdentificationFourModelObj!
                                                .isFarmer,
                                        child: Text("msg_relationship_to".tr,
                                            style: CustomTextStyles
                                                .labelMediumPrimary_1),
                                      );
                                    },
                                  ),
                                  BlocSelector<
                                          FarmersIdentificationFourBloc,
                                          FarmersIdentificationFourState,
                                          FarmersIdentificationFourModel?>(
                                      selector: (state) => state
                                          .farmersIdentificationFourModelObj,
                                      builder: (context,
                                          farmersIdentificationFourModelObj) {
                                        return Visibility(
                                          visible:
                                              !farmersIdentificationFourModelObj!
                                                  .isFarmer,
                                          child: CustomDropDown(
                                              autofocus: false,
                                              validator: (value) {
                                                if (value == null &&
                                                    farmersIdentificationFourModelObj
                                                            .selectedDropDownValue!
                                                            .id ==
                                                        1) {
                                                  return "Field is required";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              val: farmersIdentificationFourModelObj
                                                  .selectedDropDownValue1,
                                              icon: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      DeviceExt((30 / 841) * 100)
                                                          .h,
                                                      DeviceExt((10 / 411) * 100)
                                                          .w,
                                                      DeviceExt((9 / 841) * 100)
                                                          .h,
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
                                              items:
                                                  farmersIdentificationFourModelObj
                                                      .dropdownItemList1,
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        FarmersIdentificationFourBloc>()
                                                    .add(ChangeDropDown1Event(
                                                        value: value));
                                              }),
                                        );
                                      }),
                                  SizedBox(
                                      height: DeviceExt((20 / 411) * 100).w),
                                  BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                    selector: (state) =>
                                        state.farmersIdentificationFourModelObj,
                                    builder: (context,
                                        farmersIdentificationFourModelObj) {
                                      return Visibility(
                                        visible:
                                            !farmersIdentificationFourModelObj!
                                                .isFarmer,
                                        child: Text("Respondent name (*)",
                                            style: CustomTextStyles
                                                .labelMediumPrimary_1),
                                      );
                                    },
                                  ),
                                  BlocSelector<
                                          FarmersIdentificationFourBloc,
                                          FarmersIdentificationFourState,
                                          FarmersIdentificationFourState>(
                                      selector: (state) => state,
                                      builder: (context, state) {
                                        return Visibility(
                                          visible: !state
                                              .farmersIdentificationFourModelObj!
                                              .isFarmer,
                                          child: CustomTextFormField(
                                              focusNode: node3,
                                              controller: state.respame,
                                              autofocus: false,
                                              hintText: "lbl_name".tr,
                                              textInputType: TextInputType.text,
                                              hintStyle: CustomTextStyles
                                                  .titleMediumBluegray40003,
                                              validator: (value) {
                                                if (!isName(value?.trimRight(),
                                                    isRequired: true)) {
                                                  return "Please enter valid Name(Two names at least)";
                                                } else if (isNotEmpty(value)) {
                                                  return "Field is required.";
                                                }
                                                return null;
                                              },
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      DeviceExt(
                                                              (16 / 841) * 100)
                                                          .h,
                                                      DeviceExt(
                                                              (13 / 411) * 100)
                                                          .w,
                                                      DeviceExt(
                                                              (16 / 841) * 100)
                                                          .h,
                                                      DeviceExt(
                                                              (12 / 411) * 100)
                                                          .w)),
                                        );
                                      }),
                                  SizedBox(
                                      height: DeviceExt((21 / 411) * 100).w),
                                  BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                    selector: (state) =>
                                        state.farmersIdentificationFourModelObj,
                                    builder: (context,
                                        farmersIdentificationFourModelObj) {
                                      return Visibility(
                                        visible:
                                            !farmersIdentificationFourModelObj!
                                                .isFarmer,
                                        child: Text(
                                            "Respondent ID Number (*)".tr,
                                            style: CustomTextStyles
                                                .labelMediumPrimary_1),
                                      );
                                    },
                                  ),
                                  BlocSelector<
                                          FarmersIdentificationFourBloc,
                                          FarmersIdentificationFourState,
                                          FarmersIdentificationFourState>(
                                      selector: (state) => state,
                                      builder: (context, state) {
                                        return Visibility(
                                          visible: !state
                                              .farmersIdentificationFourModelObj!
                                              .isFarmer,
                                          child: CustomTextFormField(
                                              focusNode: node1,
                                              controller: state.respid,
                                              autofocus: false,
                                              hintText: "lbl_id_number".tr,
                                              textInputType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.done,
                                              validator: (value) {
                                                if (!isID(value,
                                                    isRequired: true)) {
                                                  return "Please enter valid number";
                                                } else if (isNotEmpty(value)) {
                                                  return "Field is required.";
                                                }
                                                return null;
                                              }),
                                        );
                                      }),
                                  SizedBox(
                                      height: DeviceExt((31 / 411) * 100).w),
                                  BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                    selector: (state) =>
                                        state.farmersIdentificationFourModelObj,
                                    builder: (context,
                                        farmersIdentificationFourModelObj) {
                                      return Visibility(
                                        visible:
                                            !farmersIdentificationFourModelObj!
                                                .isFarmer,
                                        child: Text(
                                            "Respondent Mobile Number (*)".tr,
                                            style: CustomTextStyles
                                                .labelMediumPrimary_1),
                                      );
                                    },
                                  ),
                                  BlocSelector<
                                          FarmersIdentificationFourBloc,
                                          FarmersIdentificationFourState,
                                          FarmersIdentificationFourState>(
                                      selector: (state) => state,
                                      builder: (context, state) {
                                        return Visibility(
                                          visible: !state
                                              .farmersIdentificationFourModelObj!
                                              .isFarmer,
                                          child: CustomTextFormField(
                                              focusNode: node5,
                                              controller: state.respMob,
                                              autofocus: false,
                                              hintText: "Mobile Number".tr,
                                              textInputType:
                                                  TextInputType.phone,
                                              hintStyle: CustomTextStyles
                                                  .titleMediumBluegray40003,
                                              validator: (value) {
                                                if (!isPhone(value,
                                                    isRequired: true)) {
                                                  return "Please enter valid text";
                                                } else if (isNotEmpty(value)) {
                                                  return "Field is required.";
                                                }
                                                return null;
                                              },
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      DeviceExt(
                                                              (16 / 841) * 100)
                                                          .h,
                                                      DeviceExt(
                                                              (13 / 411) * 100)
                                                          .w,
                                                      DeviceExt(
                                                              (16 / 841) * 100)
                                                          .h,
                                                      DeviceExt(
                                                              (12 / 411) * 100)
                                                          .w)),
                                        );
                                      }),
                                  SizedBox(
                                      height: DeviceExt((21 / 411) * 100).w),
                                  CustomOutlinedButton(
                                    text: "lbl_back".tr,
                                  
                                    onTap: () => goBack(context),
                                    isDisabled: true,
                                    buttonStyle: CustomButtonStyles
                                    .fillPrimaryTL10,
                                  ),
                                  SizedBox(
                                      height: DeviceExt((12 / 411) * 100).w),
                                  CustomElevatedButton(
                                      text: "lbl_save".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(
                                              right: DeviceExt((10 / 841) * 100)
                                                  .h),
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgSaveWhiteA700)),
                                      onTap: () {
                                        saveDraft(context);
                                      })
                                ])))),
              ))),
    );
  }

  nextPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<FarmersIdentificationFourBloc>().add(
            NextTapEvent(
              createSuccessful: () {
                _success(context);
              },
              createFailed: () {
                _failed(context);
              },
            ),
          );
    }
  }

  _success(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationTwoScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<FarmersIdentificationFourBloc>().add(
            SaveTapEvent(
              createSuccessful: () {
                _successSaved(context);
              },
              createFailed: () {
                _failed(context);
              },
            ),
          );
    }
  }

  _successSaved(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
  }

  goBack(BuildContext context) {
    NavigatorService.popAndPushNamed(
        AppRoutes.farmersIdentificationThreeScreen);
  }

  goToDetails(BuildContext context) {
// PrefUtils().setFarmerId(0);

    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationScreen,
    );
  }

  _navToStep(int val, BuildContext context, FIProgress fiProgress) {
    if (val == 0) {
      Navigator.popAndPushNamed(
          context, AppRoutes.farmersIdentificationTwoScreen);
    } else if (val == 1) {
      Navigator.popAndPushNamed(
          context, AppRoutes.farmersIdentificationThreeScreen);
    }
  }

  /// Navigates to the farmersIdentificationThreeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationThreeScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationThreeScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapImgArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the farmersIdentificationThreeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationThreeScreen.
  onTapRowback(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationThreeScreen,
    );
  }

  /// Navigates to the farmersIdentificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationScreen.
  onTapSave(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationScreen,
    );
  }
}
