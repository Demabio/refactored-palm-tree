import 'package:cupertino_stepper/cupertino_stepper.dart';

import 'bloc/add_crop_two_bloc.dart';
import 'models/add_crop_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class AddCropTwoScreen extends StatelessWidget {
  AddCropTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AddCropTwoBloc>(
        create: (context) => AddCropTwoBloc(
            AddCropTwoState(addCropTwoModelObj: AddCropTwoModel()))
          ..add(AddCropTwoInitialEvent()),
        child: AddCropTwoScreen());
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
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                leadingWidth: 60.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgSort,
                    margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                    onTap: () {
                      onTapSortone(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_add_new_crop".tr),
                styleType: Style.bgFill),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                      AddCropTwoModel?>(
                                  selector: (state) => state.addCropTwoModelObj,
                                  builder: ((context,
                                      farmersIdentificationOneModelObj) {
                                    return SizedBox(
                                      height: 150.v,
                                      width: double.infinity,
                                      child: _buildStepper(
                                          StepperType.horizontal,
                                          context,
                                          farmersIdentificationOneModelObj),
                                    );
                                  })),
                              SizedBox(height: 11.v),
                              Text("lbl_purpose2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                      AddCropTwoModel?>(
                                  selector: (state) => state.addCropTwoModelObj,
                                  builder: (context, addCropTwoModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.only(left: 30.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropTwoModelObj
                                                ?.dropdownItemList ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropTwoBloc>().add(
                                              ChangeDropDownEvent(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 35.v),
                              Text("msg_production_system".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                      AddCropTwoModel?>(
                                  selector: (state) => state.addCropTwoModelObj,
                                  builder: (context, addCropTwoModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.only(left: 30.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropTwoModelObj
                                                ?.dropdownItemList1 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropTwoBloc>().add(
                                              ChangeDropDown1Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 35.v),
                              Text("msg_water_source".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                      AddCropTwoModel?>(
                                  selector: (state) => state.addCropTwoModelObj,
                                  builder: (context, addCropTwoModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.only(left: 30.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropTwoModelObj
                                                ?.dropdownItemList2 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropTwoBloc>().add(
                                              ChangeDropDown2Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 35.v),
                              Text("msg_use_pesticide".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                      AddCropTwoModel?>(
                                  selector: (state) => state.addCropTwoModelObj,
                                  builder: (context, addCropTwoModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.only(left: 30.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropTwoModelObj
                                                ?.dropdownItemList3 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropTwoBloc>().add(
                                              ChangeDropDown3Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 35.v),
                              Text("msg_use_fertilizer".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                      AddCropTwoModel?>(
                                  selector: (state) => state.addCropTwoModelObj,
                                  builder: (context, addCropTwoModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 11.v, 1.h, 14.v),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropTwoModelObj
                                                ?.dropdownItemList4 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropTwoBloc>().add(
                                              ChangeDropDown4Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 36.v),
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
                                              onTapBack(context);
                                            })),
                                    Expanded(
                                        child: CustomElevatedButton(
                                            text: "lbl_next".tr,
                                            margin: EdgeInsets.only(left: 1.h),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL10))
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
                                    onTapSave(context);
                                  })
                            ]))))));
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context,
      AddCropTwoModel? addCropTwoModel) {
    final canCancel = addCropTwoModel!.stepped > 0;
    final canContinue = addCropTwoModel.stepped < 3;
    return CupertinoStepper(
      type: type,
      currentStep: addCropTwoModel.stepped,
      onStepTapped: (step) {
        //Best place to save and get scope identity and store in pref
        //Validation checks

        // context
        //     .read<FarmersIdentificationFourBloc>()
        //     .add(OnSteppedEvent(value: step));

        //chosen
        onTapNextC(context, step);
      },
      onStepCancel: canCancel
          ? () {
              // context
              //     .read<FarmersIdentificationFourBloc>()
              //     .add(StepDownEvent());
              //Chosen
              onTapNextC(context, addCropTwoModel.stepped - 1);
            }
          : null,
      onStepContinue: canContinue
          ? () {
              //   context.read<FarmersIdentificationFourBloc>().add(StepUpEvent());
              //Chosen
              onTapNextC(context, addCropTwoModel.stepped + 1);
            }
          : null,
      steps: [
        _buildStep(
          title: Text('1'),
          state: addCropTwoModel.page1!,
          addcallback: () {},
        ),
        _buildStep(
          title: Text('2'),
          state: addCropTwoModel.page2!,
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
        AppRoutes.addCropOneScreen,
      );
      // } else if (step == 1) {
      //   NavigatorService.popAndPushNamed(
      //     AppRoutes.primaryFarmHoldingTwoScreen,
      //   );
      // } else if (step == 2) {
      //   NavigatorService.popAndPushNamed(
      //     AppRoutes.farmersIdentificationThreeScreen,
      //   );
    } else {
      NavigatorService.popAndPushNamed(
        AppRoutes.addCropTwoScreen,
      );
    }
  }

  /// Navigates to the addCropOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropOneScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addCropOneScreen,
    );
  }

  /// Navigates to the addCropOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropOneScreen.
  onTapBack(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addCropOneScreen,
    );
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }
}
