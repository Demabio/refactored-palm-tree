import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/farmers_identification_one_bloc.dart';
import 'models/farmers_identification_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class FarmersIdentificationOneScreen extends StatelessWidget {
  FarmersIdentificationOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationOneBloc>(
        create: (context) => FarmersIdentificationOneBloc(
            FarmersIdentificationOneState(
                farmersIdentificationOneModelObj:
                    FarmersIdentificationOneModel()))
          ..add(FarmersIdentificationOneInitialEvent()),
        child: FarmersIdentificationOneScreen());
  }

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  int currentStep = 0;

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
                  margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                  onTap: () {
                    goToDetails(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "msg_farmers_identification".tr),
              styleType: Style.bgFill),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 9.v),
              child: Padding(
                padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocSelector<
                            FarmersIdentificationOneBloc,
                            FarmersIdentificationOneState,
                            FarmersIdentificationOneModel?>(
                        selector: (state) =>
                            state.farmersIdentificationOneModelObj,
                        builder: ((context, farmersIdentificationOneModelObj) {
                          return EasyStepper(
                            activeStep:
                                farmersIdentificationOneModelObj!.stepped,
                            onStepReached: (index) {
                              _navToStep(index, context,
                                  farmersIdentificationOneModelObj.fiProgress!);
                            },
                            direction: Axis.horizontal,
                            maxReachedStep: 3,
                            unreachedStepIconColor: theme.colorScheme.primary,
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
                                  backgroundColor: theme.colorScheme.primary,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: theme.colorScheme.primary,
                                    child: farmersIdentificationOneModelObj
                                                .stepped2 <=
                                            0
                                        ? Text(
                                            '1', // You can replace '1' with the desired number
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
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
                                  backgroundColor: theme.colorScheme.primary,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: theme.colorScheme.primary,
                                    child: farmersIdentificationOneModelObj
                                                .stepped2 <=
                                            1
                                        ? Text(
                                            '2', // You can replace '1' with the desired number
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
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
                                  backgroundColor: theme.colorScheme.primary,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: theme.colorScheme.primary,
                                    child: farmersIdentificationOneModelObj
                                                .stepped2 <=
                                            2
                                        ? Text(
                                            '3', // You can replace '1' with the desired number
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
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
                    Text("msg_individual_farmer".tr,
                        style: CustomTextStyles.titleMediumSemiBold),
                    SizedBox(height: 20.v),
                    Text("lbl_farmer_name2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1),
                    BlocSelector<
                            FarmersIdentificationOneBloc,
                            FarmersIdentificationOneState,
                            TextEditingController?>(
                        selector: (state) => state.nameController1,
                        builder: (context, nameController1) {
                          return CustomTextFormField(
                              focusNode: node3,
                              controller: nameController1,
                              autofocus: false,
                              hintText: "lbl_name".tr,
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                } else if (isNotEmpty(value)) {
                                  return "Field is required.";
                                }
                                return null;
                              },
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 12.v));
                        }),
                    SizedBox(height: 21.v),
                    Text("msg_national_id_number2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1),
                    BlocSelector<
                            FarmersIdentificationOneBloc,
                            FarmersIdentificationOneState,
                            TextEditingController?>(
                        selector: (state) => state.areaNumberController,
                        builder: (context, idnumberoneController) {
                          return CustomTextFormField(
                              focusNode: node1,
                              controller: idnumberoneController,
                              autofocus: false,
                              hintText: "lbl_id_number".tr,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                } else if (isNotEmpty(value)) {
                                  return "Field is required.";
                                }
                                return null;
                              });
                        }),
                    SizedBox(height: 31.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                          child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              margin: EdgeInsets.only(right: 1.h),
                              //onTap: () => goBack(context),
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargePrimary_1)),
                      Expanded(
                          child: CustomElevatedButton(
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(left: 1.h),
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
                              svgPath: ImageConstant.imgSaveWhiteA700)),
                      onTap: () {
                        saveDraft(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  nextPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<FarmersIdentificationOneBloc>().add(
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
      context.read<FarmersIdentificationOneBloc>().add(
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
            context, AppRoutes.farmersIdentificationTwoScreen);
      } else if (val == 2 &&
          fiProgress.pageOne == 1 &&
          fiProgress.pageTwo == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.farmersIdentificationThreeScreen);
      } else if (val == 3 &&
          fiProgress.pageThree == 1 &&
          fiProgress.pageTwo == 1 &&
          fiProgress.pageOne == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.farmersIdentificationFourScreen);
      }
    }
  }

  _successSaved(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
  }

  goBack(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.farmerRegistrationOneScreen);
  }

  /// Navigates to the farmersIdentificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationScreen.
  goToDetails(BuildContext context) {
// PrefUtils().setFarmerId(0);

    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.

  /// Navigates to the farmersIdentificationTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationTwoScreen.
  // onTapNext(BuildContext context) {
  //   NavigatorService.popAndPushNamed(
  //     AppRoutes.farmersIdentificationTwoScreen,
  //   );
  // }

  /// Navigates to the farmersIdentificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationScreen.
  onTapSave(BuildContext context) {
// PrefUtils().setFarmerId(0);

    NavigatorService.popAndPushNamed(
      AppRoutes.farmersIdentificationScreen,
    );
  }
}
