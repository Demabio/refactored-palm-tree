import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';

import 'bloc/farmers_identification_three_bloc.dart';
import 'models/farmers_identification_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class FarmersIdentificationThreeScreen extends StatelessWidget {
  FarmersIdentificationThreeScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationThreeBloc>(
        create: (context) => FarmersIdentificationThreeBloc(
            FarmersIdentificationThreeState(
                farmersIdentificationThreeModelObj:
                    FarmersIdentificationThreeModel()))
          ..add(FarmersIdentificationThreeInitialEvent()),
        child: FarmersIdentificationThreeScreen());
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
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: CustomAppBar(
                  leadingWidth: 60.h,
                  leading: AppbarImage(
                      svgPath: ImageConstant.imgSort,
                      margin:
                          EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
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
                        padding: EdgeInsets.only(top: 15.v),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, bottom: 5.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocSelector<
                                          FarmersIdentificationThreeBloc,
                                          FarmersIdentificationThreeState,
                                          FarmersIdentificationThreeModel?>(
                                      selector: (state) => state
                                          .farmersIdentificationThreeModelObj,
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
                                          internalPadding: 0,
                                          showLoadingAnimation: true,
                                          stepRadius: 20,
                                          disableScroll: true,
                                          showStepBorder: true,
                                          alignment: Alignment.center,
                                          steps: [
                                            EasyStep(
                                              customStep: CircleAvatar(
                                                radius: 35,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: 25,
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
                                                                fontSize: 20,
                                                              ),
                                                            )
                                                          : Icon(Icons.check),
                                                ),
                                              ),
                                              title: 'Step 1',
                                            ),
                                            EasyStep(
                                              customStep: CircleAvatar(
                                                radius: 35,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: 25,
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
                                                                fontSize: 20,
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
                                                radius: 35,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: 25,
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
                                                                fontSize: 20,
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
                                  SizedBox(height: 11.v),
                                  Text("msg_individual_farmer2".tr,
                                      style:
                                          CustomTextStyles.titleMediumSemiBold),
                                  SizedBox(height: 20.v),
                                  Text("lbl_postal_code2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          FarmersIdentificationThreeBloc,
                                          FarmersIdentificationThreeState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.codevalueoneController,
                                      builder:
                                          (context, codevalueoneController) {
                                        return CustomTextFormField(
                                            autofocus: false,
                                            focusNode: node2,
                                            controller: codevalueoneController,
                                            hintText: "lbl_code".tr);
                                      }),
                                  SizedBox(height: 20.v),
                                  Text("msg_marital_status".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          FarmersIdentificationThreeBloc,
                                          FarmersIdentificationThreeState,
                                          FarmersIdentificationThreeModel?>(
                                      selector: (state) => state
                                          .farmersIdentificationThreeModelObj,
                                      builder: (context,
                                          farmersIdentificationThreeModelObj) {
                                        return CustomDropDown(
                                            focusNode: node3,
                                            autofocus: false,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            val:
                                                farmersIdentificationThreeModelObj
                                                    ?.selectedDropDownValue,
                                            icon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 10.v, 9.h, 15.v),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.h)),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdownPrimary)),
                                            hintText: "lbl_select".tr,
                                            items:
                                                farmersIdentificationThreeModelObj
                                                        ?.dropdownItemList ??
                                                    [],
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      FarmersIdentificationThreeBloc>()
                                                  .add(ChangeDropDownEvent(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(height: 20.v),
                                  Text("msg_formal_training".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          FarmersIdentificationThreeBloc,
                                          FarmersIdentificationThreeState,
                                          FarmersIdentificationThreeModel?>(
                                      selector: (state) => state
                                          .farmersIdentificationThreeModelObj,
                                      builder: (context,
                                          farmersIdentificationThreeModelObj) {
                                        return CustomDropDown(
                                            autofocus: false,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            val:
                                                farmersIdentificationThreeModelObj
                                                    ?.selectedDropDownValue1,
                                            icon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 10.v, 9.h, 15.v),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.h)),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdownPrimary)),
                                            hintText: "lbl_select".tr,
                                            items:
                                                farmersIdentificationThreeModelObj
                                                        ?.dropdownItemList1 ??
                                                    [],
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      FarmersIdentificationThreeBloc>()
                                                  .add(ChangeDropDown1Event(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(height: 20.v),
                                  Text("msg_formal_education2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          FarmersIdentificationThreeBloc,
                                          FarmersIdentificationThreeState,
                                          FarmersIdentificationThreeModel?>(
                                      selector: (state) => state
                                          .farmersIdentificationThreeModelObj,
                                      builder: (context,
                                          farmersIdentificationThreeModelObj) {
                                        return CustomDropDown(
                                            width: double.infinity,
                                            autofocus: false,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            val:
                                                farmersIdentificationThreeModelObj
                                                    ?.selectedDropDownValue2,
                                            icon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 10.v, 9.h, 15.v),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.h)),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdownPrimary)),
                                            hintText: "lbl_select".tr,
                                            items:
                                                farmersIdentificationThreeModelObj
                                                        ?.dropdownItemList2 ??
                                                    [],
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      FarmersIdentificationThreeBloc>()
                                                  .add(ChangeDropDown2Event(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(height: 20.v),
                                  Text("lbl_hh_size2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          FarmersIdentificationThreeBloc,
                                          FarmersIdentificationThreeState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.hhsizevalueoneController,
                                      builder:
                                          (context, hhsizevalueoneController) {
                                        return CustomTextFormField(
                                            focusNode: node1,
                                            autofocus: false,
                                            controller:
                                                hhsizevalueoneController,
                                            hintText: "lbl_hh_size3".tr,
                                            validator: (value) {
                                              if (!hhsize(value,
                                                  isRequired: true)) {
                                                return "Field is require: Max size is 30";
                                              } else {
                                                return null;
                                              }
                                            },
                                            textInputType: TextInputType.number,
                                            textInputAction:
                                                TextInputAction.done);
                                      }),
                                  SizedBox(height: 21.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: CustomOutlinedButton(
                                                text: "lbl_back".tr,
                                                margin:
                                                    EdgeInsets.only(right: 1.h),
                                                buttonStyle: CustomButtonStyles
                                                    .outlinePrimary,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .bodyLargePrimary_2,
                                                onTap: () {
                                                  goBack(context);
                                                })),
                                        Expanded(
                                            child: CustomElevatedButton(
                                                text: "lbl_next".tr,
                                                margin:
                                                    EdgeInsets.only(left: 1.h),
                                                onTap: () {
                                                  nextPage(context);
                                                }))
                                      ]),
                                  SizedBox(height: 12.v),
                                  CustomElevatedButton(
                                      text: "lbl_save".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(right: 10.h),
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
      context.read<FarmersIdentificationThreeBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationFourScreen);
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
      context.read<FarmersIdentificationThreeBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationTwoScreen);
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
    }
    if (_formKey.currentState!.validate()) {
      if (val == 2 && fiProgress.pageTwo == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.farmersIdentificationFourScreen);
      }
    }
  }

  /// Navigates to the farmersIdentificationTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationTwoScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationTwoScreen,
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

  /// Navigates to the farmersIdentificationTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationTwoScreen.
  onTapBack(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationTwoScreen,
    );
  }

  /// Navigates to the farmersIdentificationFourScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationFourScreen.
  onTapNext(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationFourScreen,
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
