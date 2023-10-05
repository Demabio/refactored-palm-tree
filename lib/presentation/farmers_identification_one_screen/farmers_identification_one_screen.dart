import 'package:cupertino_stepper/cupertino_stepper.dart';
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
import 'package:kiamis_app/widgets/custom_floating_text_field.dart';
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
    return BlocBuilder<FarmersIdentificationOneBloc,
        FarmersIdentificationOneState>(builder: (context, state) {
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
                          return SizedBox(
                            height: 150.v,
                            width: double.infinity,
                            child: _buildStepper(StepperType.horizontal,
                                context, farmersIdentificationOneModelObj),
                          );
                        })),
                    SizedBox(height: 13.v),
                    Text("msg_enumaration_geography".tr,
                        style: CustomTextStyles.titleMediumSemiBold),
                    SizedBox(height: 19.v),
                    Text("Village Unit".tr,
                        style: CustomTextStyles.labelMediumPrimary_1),
                    BlocSelector<
                            FarmersIdentificationOneBloc,
                            FarmersIdentificationOneState,
                            TextEditingController?>(
                        selector: (state) => state.nameController,
                        builder: (context, nameController) {
                          return CustomTextFormField(
                              focusNode: node4,
                              controller: nameController,
                              autofocus: false,
                              hintText: "msg_village_unit_name2".tr,
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              },
                              contentPadding:
                                  EdgeInsets.fromLTRB(12.h, 16.v, 12.h, 9.v));
                        }),
                    SizedBox(height: 20.v),
                    Text("msg_enumerator_area2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1),
                    BlocSelector<
                            FarmersIdentificationOneBloc,
                            FarmersIdentificationOneState,
                            TextEditingController?>(
                        selector: (state) => state.areaNumberController,
                        builder: (context, areaNumberController) {
                          return CustomTextFormField(
                              focusNode: node1,
                              controller: areaNumberController,
                              autofocus: false,
                              hintText: "lbl_area_number".tr,
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              },
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 12.v));
                        }),
                    SizedBox(height: 21.v),
                    Text("Shopping Center".tr,
                        style: CustomTextStyles.labelMediumPrimary_1),
                    BlocSelector<
                            FarmersIdentificationOneBloc,
                            FarmersIdentificationOneState,
                            TextEditingController?>(
                        selector: (state) => state.shoppingCenterController,
                        builder: (context, shoppingCenterController) {
                          return CustomTextFormField(
                              focusNode: node2,
                              controller: shoppingCenterController,
                              autofocus: false,
                              hintText: "lbl_shopping_center".tr,
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.h, 15.v, 16.h, 10.v));
                        }),
                    SizedBox(height: 20.v),
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
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              },
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 12.v));
                        }),
                    SizedBox(height: 31.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                          child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              margin: EdgeInsets.only(right: 1.h),
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargePrimary_1)),
                      Expanded(
                          child: CustomElevatedButton(
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(left: 1.h),
                              onTap: () {
                                //  onTapNext(context);
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
                        onTapSave(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context,
      FarmersIdentificationOneModel? farmersIdentificationOneModel) {
    final canCancel = farmersIdentificationOneModel!.stepped > 0;
    final canContinue = farmersIdentificationOneModel.stepped < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) {
        //Best place to save and get scope identity and store in pref
        // context
        //     .read<FarmersIdentificationOneBloc>()
        //     .add(OnSteppedEvent(value: step));

        onTapNextC(context, step);
      },
      onStepCancel: canCancel
          ? () {
              //  context.read<FarmersIdentificationOneBloc>().add(StepDownEvent());
              onTapNextC(context, farmersIdentificationOneModel.stepped - 1);
            }
          : null,
      onStepContinue: canContinue
          ? () {
              // context.read<FarmersIdentificationOneBloc>().add(StepUpEvent());
              onTapNextC(context, farmersIdentificationOneModel.stepped + 1);
            }
          : null,
      steps: [
        _buildStep(
          title: Text('1'),
          state: farmersIdentificationOneModel.page1!,
          addcallback: () {},
        ),
        _buildStep(
          title: Text('2'),
          state: farmersIdentificationOneModel.page2!,
        ),
        _buildStep(
          title: Text('3'),
          state: farmersIdentificationOneModel.page3!,
        ),
        _buildStep(
          title: Text('4'),
          state: farmersIdentificationOneModel.page4!,
        ),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    VoidCallback? addcallback,
    VoidCallback? editcallback,
  }) {
    return Step(
      title: title,
      // subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
          maxWidth: double.infinity,
          maxHeight: 1,
          child: SizedBox(
            height: 1,
            width: 1,
          )),
    );
  }

  onTapNextC(BuildContext context, int step) {
    if (step == 0) {
      NavigatorService.popAndPushNamed(
        AppRoutes.farmersIdentificationOneScreen,
      );
    } else if (step == 1) {
      NavigatorService.popAndPushNamed(
        AppRoutes.farmersIdentificationTwoScreen,
      );
    } else if (step == 2) {
      NavigatorService.popAndPushNamed(
        AppRoutes.farmersIdentificationThreeScreen,
      );
    } else {
      NavigatorService.popAndPushNamed(
        AppRoutes.farmersIdentificationFourScreen,
      );
    }
  }

  /// Navigates to the farmersIdentificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationScreen,
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

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapImgArrowleftthree(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the farmersIdentificationTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationTwoScreen.
  // onTapNext(BuildContext context) {
  //   NavigatorService.pushNamed(
  //     AppRoutes.farmersIdentificationTwoScreen,
  //   );
  // }

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
