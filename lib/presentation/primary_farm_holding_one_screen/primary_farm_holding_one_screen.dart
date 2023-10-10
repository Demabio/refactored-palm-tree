import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/primary_farm_holding_one_bloc.dart';
import 'models/primary_farm_holding_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_floating_text_field.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

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
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_primary_farm_holding".tr),
                  styleType: Style.bgFill),
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.h, right: 16.h, bottom: 5.v),
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
                                                              color:
                                                                  Colors.white,
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
                                                              color:
                                                                  Colors.white,
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
                                        ],
                                      );
                                    })),
                                SizedBox(height: 11.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 13.h, top: 13.v),
                                    child: Text("msg_main_farm_enterprises".tr,
                                        style: CustomTextStyles
                                            .titleMediumSemiBold)),
                                SizedBox(height: 27.v),
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
                                SizedBox(height: 32.v),
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
                                SizedBox(height: 32.v),
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
                                              margin:
                                                  EdgeInsets.only(left: 30.h),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.h)),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPrimary)),
                                          hintText: "lbl_select".tr,
                                          validator: (value) {
                                            if (value == null) {
                                              return "Field is required";
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
                                SizedBox(height: 32.v),
                                Text("msg_size_of_land_under2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.sizeoneController,
                                    builder: (context, sizeoneController) {
                                      return CustomTextFormField(
                                          controller: sizeoneController,
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
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: 32.v),
                                Text("msg_total_land_area2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        PrimaryFarmHoldingOneBloc,
                                        PrimaryFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) => state.areaController,
                                    builder: (context, areaController) {
                                      return CustomTextFormField(
                                          controller: areaController,
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
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: 33.v),
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
                                SizedBox(height: 33.v),
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
                                SizedBox(height: 32.v),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: CustomOutlinedButton(
                                              text: "lbl_back".tr,
                                              margin:
                                                  EdgeInsets.only(right: 1.h),
                                              buttonStyle: CustomButtonStyles
                                                  .outlinePrimaryTL10,
                                              buttonTextStyle: CustomTextStyles
                                                  .bodyLargePrimary_1)),
                                      Expanded(
                                          child: CustomElevatedButton(
                                              text: "lbl_next".tr,
                                              margin:
                                                  EdgeInsets.only(left: 1.h),
                                              onTap: () {
                                                onTapNext(context);
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
                                      onTapSave(context);
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

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PrimaryFarmHoldingOneBloc>().add(
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

  _navToStep(int val, BuildContext context, PFProgress pfProgress) {
    if (_formKey.currentState!.validate()) {
      if (val == 0 && pfProgress.pageOne == 1) {
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
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingTwoScreen.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingTwoScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingScreen,
    );
  }
}
