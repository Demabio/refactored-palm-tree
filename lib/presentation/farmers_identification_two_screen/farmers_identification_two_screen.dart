import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'bloc/farmers_identification_two_bloc.dart';
import 'models/farmers_identification_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
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
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: CustomAppBar(
                leadingWidth: 60.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgSort,
                    margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                    onTap: () {
                      onTapSortone(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "msg_farmers_identification".tr),
                styleType: Style.bgFill),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 9.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, bottom: 5.v),
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
                                                              .stepped <=
                                                          0
                                                      ? Text(
                                                          '1', // You can replace '1' with the desired number
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                              .stepped <=
                                                          1
                                                      ? Text(
                                                          '2', // You can replace '1' with the desired number
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                              .stepped <=
                                                          2
                                                      ? Text(
                                                          '3', // You can replace '1' with the desired number
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        )
                                                      : Icon(Icons.check),
                                            ),
                                          ),
                                          title: 'Step 3',
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
                                                              .stepped <=
                                                          3
                                                      ? Text(
                                                          '4', // You can replace '1' with the desired number
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        )
                                                      : Icon(Icons.check),
                                            ),
                                          ),
                                          title: 'Step 4',
                                          // topTitle: true,
                                        ),
                                      ],
                                    );
                                  })),
                              SizedBox(height: 11.v),
                              Text("msg_individual_farmer".tr,
                                  style: CustomTextStyles.titleMediumSemiBold),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 17.v, right: 18.h),
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
                                                        width: 160.h,
                                                        autofocus: false,
                                                        icon: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    30.h,
                                                                    10.v,
                                                                    7.h,
                                                                    15.v),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        10.h)),
                                                            child: CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgArrowdownPrimary)),
                                                        hintText: "lbl_year".tr,
                                                        items: farmersIdentificationTwoModelObj
                                                                ?.dropdownItemList ??
                                                            [],
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return "Field is required";
                                                          }
                                                        },
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 7.h,
                                                                top: 13.v,
                                                                bottom: 13.v),
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
                                                        width: 160.h,
                                                        autofocus: false,
                                                        icon: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    30.h,
                                                                    10.v,
                                                                    8.h,
                                                                    15.v),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        10.h)),
                                                            child: CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgArrowdownPrimary)),
                                                        hintText: "lbl_sex3".tr,
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return "Field is required";
                                                          }
                                                        },
                                                        items: farmersIdentificationTwoModelObj
                                                                ?.dropdownItemList1 ??
                                                            [],
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 8.h,
                                                                top: 13.v,
                                                                bottom: 13.v),
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
                              SizedBox(height: 17.v),
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
                              SizedBox(height: 17.v),
                              Text("msg_mobile_number".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
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
                                          if (!isValidPhone(
                                            value,
                                            isRequired: true,
                                          )) {
                                            return "Please enter valid phone number";
                                          }
                                          return null;
                                        });
                                  }),
                              SizedBox(height: 17.v),
                              Text("lbl_email2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
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
                              SizedBox(height: 17.v),
                              Text("lbl_postal_address2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationTwoBloc,
                                      FarmersIdentificationTwoState,
                                      TextEditingController?>(
                                  selector: (state) => state.addressController,
                                  builder: (context, addressController) {
                                    return CustomTextFormField(
                                        focusNode: node4,
                                        autofocus: false,
                                        controller: addressController,
                                        hintText: "lbl_address".tr,
                                        textInputAction: TextInputAction.done);
                                  }),
                              SizedBox(height: 28.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomOutlinedButton(
                                            text: "lbl_back".tr,
                                            margin: EdgeInsets.only(right: 1.h),
                                            buttonStyle: CustomButtonStyles
                                                .outlinePrimary,
                                            buttonTextStyle: CustomTextStyles
                                                .bodyLargePrimary_2,
                                            onTap: () {
                                              goBack(context);
                                            })),
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
                                          svgPath:
                                              ImageConstant.imgSaveWhiteA700)),
                                  onTap: () {
                                    saveDraft(context);
                                  })
                            ]))))));
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
    NavigatorService.pushNamed(AppRoutes.farmersIdentificationThreeScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) {
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

  _successSaved(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.farmersIdentificationScreen);
  }

  goBack(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the farmersIdentificationOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationOneScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationOneScreen,
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
