import 'package:cupertino_stepper/cupertino_stepper.dart';

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
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
            body: SizedBox(
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
                                  selector: (state) =>
                                      state.farmersIdentificationThreeModelObj,
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
                              Text("msg_individual_farmer2".tr,
                                  style: CustomTextStyles.titleMediumSemiBold),
                              SizedBox(height: 20.v),
                              Text("lbl_postal_code2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationThreeBloc,
                                      FarmersIdentificationThreeState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.codevalueoneController,
                                  builder: (context, codevalueoneController) {
                                    return CustomTextFormField(
                                        autofocus: false,
                                        focusNode: node2,
                                        controller: codevalueoneController,
                                        hintText: "lbl_code".tr);
                                  }),
                              SizedBox(height: 20.v),
                              Text("msg_marital_status".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationThreeBloc,
                                      FarmersIdentificationThreeState,
                                      FarmersIdentificationThreeModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationThreeModelObj,
                                  builder: (context,
                                      farmersIdentificationThreeModelObj) {
                                    return CustomDropDown(
                                        focusNode: node3,
                                        autofocus: false,
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
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationThreeBloc,
                                      FarmersIdentificationThreeState,
                                      FarmersIdentificationThreeModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationThreeModelObj,
                                  builder: (context,
                                      farmersIdentificationThreeModelObj) {
                                    return CustomDropDown(
                                        autofocus: false,
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
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationThreeBloc,
                                      FarmersIdentificationThreeState,
                                      FarmersIdentificationThreeModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationThreeModelObj,
                                  builder: (context,
                                      farmersIdentificationThreeModelObj) {
                                    return CustomDropDown(
                                        width: double.infinity,
                                        autofocus: false,
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
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationThreeBloc,
                                      FarmersIdentificationThreeState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.hhsizevalueoneController,
                                  builder: (context, hhsizevalueoneController) {
                                    return CustomTextFormField(
                                        focusNode: node1,
                                        autofocus: false,
                                        controller: hhsizevalueoneController,
                                        hintText: "lbl_hh_size3".tr,
                                        textInputType: TextInputType.number,
                                        textInputAction: TextInputAction.done);
                                  }),
                              SizedBox(height: 21.v),
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
                                          svgPath:
                                              ImageConstant.imgSaveWhiteA700)),
                                  onTap: () {
                                    onTapSave(context);
                                  })
                            ]))))));
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context,
      FarmersIdentificationThreeModel? farmersIdentificationThreeModel) {
    final canCancel = farmersIdentificationThreeModel!.stepped > 0;
    final canContinue = farmersIdentificationThreeModel.stepped < 3;
    return CupertinoStepper(
      type: type,
      currentStep: farmersIdentificationThreeModel.stepped,
      onStepTapped: (step) {
        //Best place to save and get scope identity and store in pref
        //Validation checks

        context
            .read<FarmersIdentificationThreeBloc>()
            .add(OnSteppedEvent(value: step));
      },
      onStepCancel: canCancel
          ? () {
              context
                  .read<FarmersIdentificationThreeBloc>()
                  .add(StepDownEvent());
            }
          : null,
      onStepContinue: canContinue
          ? () {
              context.read<FarmersIdentificationThreeBloc>().add(StepUpEvent());
            }
          : null,
      steps: [
        _buildStep(
          title: Text('1'),
          state: farmersIdentificationThreeModel.page1!,
          addcallback: () {},
        ),
        _buildStep(
          title: Text('2'),
          state: farmersIdentificationThreeModel.page2!,
        ),
        _buildStep(
          title: Text('3'),
          state: farmersIdentificationThreeModel.page3!,
        ),
        _buildStep(
          title: Text('4'),
          state: farmersIdentificationThreeModel.page4!,
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

  /// Navigates to the farmersIdentificationTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationTwoScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
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
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationTwoScreen,
    );
  }

  /// Navigates to the farmersIdentificationFourScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationFourScreen.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationFourScreen,
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
