import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';

import 'bloc/farmers_identification_two_bloc.dart';
import 'models/farmers_identification_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class FarmersIdentificationTwoScreen extends StatelessWidget {
  FarmersIdentificationTwoScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationTwoBloc>(
        create: (context) => FarmersIdentificationTwoBloc(
            FarmersIdentificationTwoState(
                farmersIdentificationTwoModelObj:
                    FarmersIdentificationTwoModel()))
          ..add(FarmersIdentificationTwoInitialEvent()),
        child: FarmersIdentificationTwoScreen());
  }

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  FocusNode node6 = FocusNode();
  FocusNode node7 = FocusNode();
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
                        goToDetails(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_farmers_identification".tr),
                  styleType: Style.bgFill),
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: ((9 / 411) * 100).w),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt((16 / 841) * 100).h,
                              right: DeviceExt((16 / 841) * 100).h,
                              bottom: ((5 / 411) * 100).w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocSelector<
                                        FarmersIdentificationTwoBloc,
                                        FarmersIdentificationTwoState,
                                        FarmersIdentificationTwoModel?>(
                                    selector: (state) =>
                                        state.farmersIdentificationTwoModelObj,
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
                                            theme.colorScheme.secondary,
                                        finishedStepIconColor: Colors.orange,
                                        activeStepTextColor: Colors.black87,
                                        finishedStepTextColor: Colors.black87,
                                        internalPadding: 0,
                                        fitWidth: true,
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
                                                            size: DeviceExt(1.8)
                                                                .h,
                                                          ),
                                              ),
                                            ),
                                            title: 'Step 1',
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
                                                        : Icon(Icons.check),
                                              ),
                                            ),

                                            title: 'Step 2',
                                            //topTitle: true,
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
                                                            2
                                                        ? Text(
                                                            '3', // You can replace '1' with the desired number
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
                                                        : Icon(Icons.check),
                                              ),
                                            ),
                                            title: 'Step 3',
                                          ),
                                        ],
                                      );
                                    })),
                                SizedBox(height: ((11 / 411) * 100).w),

                                Text("msg_individual_farmer".tr,
                                    style:
                                        CustomTextStyles.titleMediumSemiBold),
                                SizedBox(height: ((20 / 411) * 100).w),
                                Text("lbl_farmer_name2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        FarmersIdentificationTwoBloc,
                                        FarmersIdentificationTwoState,
                                        TextEditingController?>(
                                    selector: (state) => state.name,
                                    builder: (context, nameController1) {
                                      return CustomTextFormField(
                                        focusNode: node6,
                                        controller: nameController1,
                                        autofocus: false,
                                        textInputType: TextInputType.name,
                                        hintText: "lbl_name".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003,
                                        validator: (value) {
                                          if (!isName(value?.trimRight())) {
                                            return "Please enter valid Name(Two names at least)";
                                          } else if (isNotEmpty(value)) {
                                            return "Field is required.";
                                          }
                                          return null;
                                        },
                                      );
                                    }),
                                SizedBox(height: ((21 / 411) * 100).w),

                                Text("msg_national_id_number2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        FarmersIdentificationTwoBloc,
                                        FarmersIdentificationTwoState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.idnumberoneController,
                                    builder: (context, idnumberoneController) {
                                      return CustomTextFormField(
                                          focusNode: node7,
                                          controller: idnumberoneController,
                                          autofocus: false,
                                          hintText: "lbl_id_number".tr,
                                          textInputType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          validator: (value) {
                                            if (!isID(value)) {
                                              return "Please enter valid number";
                                            } else if (isNotEmpty(value)) {
                                              return "Field is required.";
                                            }
                                            return null;
                                          });
                                    }),
                                SizedBox(height: ((31 / 411) * 100).w),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: ((17 / 411) * 100).w,
                                        right: DeviceExt((18 / 841) * 100).h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("msg_year_of_birth".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary_1),
                                                BlocSelector<
                                                        FarmersIdentificationTwoBloc,
                                                        FarmersIdentificationTwoState,
                                                        FarmersIdentificationTwoModel?>(
                                                    selector: (state) => state
                                                        .farmersIdentificationTwoModelObj,
                                                    builder: (context,
                                                        farmersIdentificationTwoModelObj) {
                                                      return CustomDropDown(
                                                          width:
                                                              DeviceExt((160 / 841) * 100)
                                                                  .h,
                                                          autofocus: false,
                                                          val: farmersIdentificationTwoModelObj
                                                              ?.selectedDropDownValue,
                                                          icon: Container(
                                                              margin: EdgeInsets.fromLTRB(
                                                                  DeviceExt((30 / 841) * 100)
                                                                      .h,
                                                                  ((10 / 411) * 100)
                                                                      .w,
                                                                  DeviceExt((7 / 841) * 100)
                                                                      .h,
                                                                  ((15 / 411) * 100)
                                                                      .w),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          DeviceExt((10 / 411) * 100)
                                                                              .h)),
                                                              child: CustomImageView(
                                                                  svgPath: ImageConstant.imgArrowdownPrimary)),
                                                          hintText: "lbl_year".tr,
                                                          items: farmersIdentificationTwoModelObj?.dropdownItemList ?? [],
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Field is required";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          contentPadding: EdgeInsets.only(left: DeviceExt((7 / 841) * 100).h, top: ((13 / 411) * 100).w, bottom: ((13 / 411) * 100).w),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    FarmersIdentificationTwoBloc>()
                                                                .add(ChangeDropDownEvent(
                                                                    value:
                                                                        value));
                                                          });
                                                    })
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("lbl_sex2".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary_1),
                                                BlocSelector<
                                                        FarmersIdentificationTwoBloc,
                                                        FarmersIdentificationTwoState,
                                                        FarmersIdentificationTwoModel?>(
                                                    selector: (state) => state
                                                        .farmersIdentificationTwoModelObj,
                                                    builder: (context,
                                                        farmersIdentificationTwoModelObj) {
                                                      return CustomDropDown(
                                                          width:
                                                              DeviceExt((160 / 841) * 100)
                                                                  .h,
                                                          autofocus: false,
                                                          val: farmersIdentificationTwoModelObj
                                                              ?.selectedDropDownValue1,
                                                          icon: Container(
                                                              margin: EdgeInsets.fromLTRB(
                                                                  DeviceExt((30 / 841) * 100)
                                                                      .h,
                                                                  ((10 / 411) * 100)
                                                                      .w,
                                                                  DeviceExt((8 / 841) * 100)
                                                                      .h,
                                                                  ((15 / 411) * 100)
                                                                      .w),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          DeviceExt((10 / 411) * 100)
                                                                              .h)),
                                                              child: CustomImageView(
                                                                  svgPath: ImageConstant.imgArrowdownPrimary)),
                                                          hintText: "lbl_sex3".tr,
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Field is required";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          items: farmersIdentificationTwoModelObj?.dropdownItemList1 ?? [],
                                                          contentPadding: EdgeInsets.only(left: DeviceExt((8 / 841) * 100).h, top: ((13 / 411) * 100).w, bottom: ((13 / 411) * 100).w),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    FarmersIdentificationTwoBloc>()
                                                                .add(ChangeDropDown1Event(
                                                                    value:
                                                                        value));
                                                          });
                                                    })
                                              ])
                                        ])),
                                SizedBox(height: ((17 / 411) * 100).w),
                                // Text("msg_national_id_number2".tr,
                                //     style: CustomTextStyles.labelMediumPrimary_1),
                                // BlocSelector<
                                //         FarmersIdentificationTwoBloc,
                                //         FarmersIdentificationTwoState,
                                //         TextEditingController?>(
                                //     selector: (state) =>
                                //         state.idnumberoneController,
                                //     builder: (context, idnumberoneController) {
                                //       return CustomTextFormField(
                                //           focusNode: node1,
                                //           controller: idnumberoneController,
                                //           autofocus: false,
                                //           hintText: "lbl_id_number".tr,
                                //           textInputType: TextInputType.number,
                                //           validator: (value) {
                                //             if (!isNumeric(value)) {
                                //               return "Please enter valid number";
                                //             }
                                //             return null;
                                //           });
                                //     }),
                                SizedBox(height: ((17 / 411) * 100).w),
                                Text("msg_mobile_number".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        FarmersIdentificationTwoBloc,
                                        FarmersIdentificationTwoState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.mobileNumberController,
                                    builder: (context, mobileNumberController) {
                                      return CustomTextFormField(
                                          focusNode: node2,
                                          autofocus: false,
                                          controller: mobileNumberController,
                                          hintText: "lbl_mobile_number2".tr,
                                          textInputType: TextInputType.phone,
                                          validator: (value) {
                                            if (!isPhone(
                                              value,
                                              isRequired: true,
                                            )) {
                                              return "Please enter valid phone number";
                                            }
                                            return null;
                                          });
                                    }),
                                SizedBox(height: ((17 / 411) * 100).w),
                                Text("lbl_email2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        FarmersIdentificationTwoBloc,
                                        FarmersIdentificationTwoState,
                                        TextEditingController?>(
                                    selector: (state) => state.emailController,
                                    builder: (context, emailController) {
                                      return CustomTextFormField(
                                          focusNode: node3,
                                          autofocus: false,
                                          controller: emailController,
                                          hintText: "lbl_email2".tr,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidEmail(value,
                                                    isRequired: false))) {
                                              return "Please enter valid email";
                                            }
                                            return null;
                                          });
                                    }),
                                SizedBox(height: ((17 / 411) * 100).w),
                                Text("lbl_postal_address2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        FarmersIdentificationTwoBloc,
                                        FarmersIdentificationTwoState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.addressController,
                                    builder: (context, addressController) {
                                      return CustomTextFormField(
                                          focusNode: node4,
                                          autofocus: false,
                                          controller: addressController,
                                          hintText: "lbl_address".tr,
                                          textInputAction:
                                              TextInputAction.done);
                                    }),
                                SizedBox(height: ((28 / 411) * 100).w),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: CustomOutlinedButton(
                                              text: "lbl_back".tr,
                                              margin: EdgeInsets.only(
                                                  right:
                                                      DeviceExt((1 / 841) * 100)
                                                          .h),
                                              buttonStyle: CustomButtonStyles
                                                  .outlinePrimaryTL10,
                                              isDisabled: true,
                                              buttonTextStyle: CustomTextStyles
                                                  .bodyLargePrimary_2,
                                              onTap: () {
                                                goBack(context);
                                              })),
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
                                SizedBox(height: ((12 / 411) * 100).w),
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
      context.read<FarmersIdentificationTwoBloc>().add(
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
    NavigatorService.popAndPushNamed(
        AppRoutes.farmersIdentificationThreeScreen);
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
      context.read<FarmersIdentificationTwoBloc>().add(
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

  _navToStep(int val, BuildContext context, FIProgress fiProgress) {
    if (_formKey.currentState!.validate()) {
      if (val == 1 && fiProgress.pageOne == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.farmersIdentificationThreeScreen);
      } else if (val == 2 &&
          fiProgress.pageTwo == 1 &&
          fiProgress.pageOne == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.farmersIdentificationFourScreen);
      }
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.farmersIdentificationScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(
        context, AppRoutes.farmersIdentificationOneScreen);
  }

  goToDetails(BuildContext context) {
// PrefUtils().setFarmerId(0);

    // NavigatorService.popAndPushNamed(
    //   AppRoutes.farmersIdentificationScreen,
    // );
    Navigator.popAndPushNamed(context, AppRoutes.farmersIdentificationScreen);
  }

  /// Navigates to the farmersIdentificationOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationOneScreen.
  onTapSortone(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.farmersIdentificationOneScreen,
    // );
    Navigator.popAndPushNamed(
        context, AppRoutes.farmersIdentificationOneScreen);
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

  /// Navigates to the farmersIdentificationOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationOneScreen.
  onTapBack(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationOneScreen,
    );
  }

  /// Navigates to the farmersIdentificationThreeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationThreeScreen.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationThreeScreen,
    );
  }

  /// Navigates to the farmersIdentificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationScreen,
    );
  }
}
