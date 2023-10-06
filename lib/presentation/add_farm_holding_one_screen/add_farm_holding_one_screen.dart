import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/add_farm_holding_one_bloc.dart';
import 'models/add_farm_holding_one_model.dart';
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
class AddFarmHoldingOneScreen extends StatelessWidget {
  AddFarmHoldingOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmHoldingOneBloc>(
        create: (context) => AddFarmHoldingOneBloc(AddFarmHoldingOneState(
            addFarmHoldingOneModelObj: AddFarmHoldingOneModel()))
          ..add(AddFarmHoldingOneInitialEvent()),
        child: AddFarmHoldingOneScreen());
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
                title: AppbarSubtitle1(text: "msg_add_farm_holding".tr),
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
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      AddFarmHoldingOneModel?>(
                                  selector: (state) =>
                                      state.addFarmHoldingOneModelObj,
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
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 13.h, top: 13.v),
                                  child: Text("msg_farm_enterprises".tr,
                                      style: CustomTextStyles
                                          .titleMediumSemiBold)),
                              SizedBox(height: 27.v),
                              Text("msg_descriptive_name2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      TextEditingController?>(
                                  selector: (state) => state.nameController,
                                  builder: (context, nameController) {
                                    return CustomTextFormField(
                                        controller: nameController,
                                        autofocus: false,
                                        focusNode: node1,
                                        hintText: "lbl_name".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003,
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        });
                                  }),
                              SizedBox(height: 32.v),
                              Text("msg_total_land_size".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      TextEditingController?>(
                                  selector: (state) => state.sizeController,
                                  builder: (context, sizeController) {
                                    return CustomTextFormField(
                                        controller: sizeController,
                                        autofocus: false,
                                        focusNode: node2,
                                        hintText: "lbl_size".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003);
                                  }),
                              SizedBox(height: 32.v),
                              Text("lbl_area_unit2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      AddFarmHoldingOneModel?>(
                                  selector: (state) =>
                                      state.addFarmHoldingOneModelObj,
                                  builder:
                                      (context, addFarmHoldingOneModelObj) {
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
                                        items: addFarmHoldingOneModelObj
                                                ?.dropdownItemList ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<AddFarmHoldingOneBloc>()
                                              .add(ChangeDropDownEvent(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 32.v),
                              Text("msg_size_of_land_under2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      TextEditingController?>(
                                  selector: (state) => state.sizeoneController,
                                  builder: (context, sizeoneController) {
                                    return CustomTextFormField(
                                        controller: sizeoneController,
                                        autofocus: false,
                                        focusNode: node3,
                                        hintText: "lbl_size".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003);
                                  }),
                              SizedBox(height: 32.v),
                              Text("msg_total_land_area2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      TextEditingController?>(
                                  selector: (state) => state.areaController,
                                  builder: (context, areaController) {
                                    return CustomTextFormField(
                                        controller: areaController,
                                        autofocus: false,
                                        focusNode: node4,
                                        hintText: "lbl_area".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003);
                                  }),
                              SizedBox(height: 33.v),
                              Text("msg_size_of_land_leased2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      TextEditingController?>(
                                  selector: (state) => state.sizetwoController,
                                  builder: (context, sizetwoController) {
                                    return CustomTextFormField(
                                        controller: sizetwoController,
                                        autofocus: false,
                                        focusNode: node5,
                                        hintText: "msg_size_of_land_leased2".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003);
                                  }),
                              SizedBox(height: 33.v),
                              Text("msg_size_of_land_lying2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      AddFarmHoldingOneBloc,
                                      AddFarmHoldingOneState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.sizethreeController,
                                  builder: (context, sizethreeController) {
                                    return CustomTextFormField(
                                        controller: sizethreeController,
                                        autofocus: false,
                                        focusNode: node6,
                                        hintText: "msg_size_of_land_lying2".tr,
                                        hintStyle: CustomTextStyles
                                            .titleMediumBluegray40003,
                                        textInputAction: TextInputAction.done);
                                  }),
                              SizedBox(height: 32.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomOutlinedButton(
                                            text: "lbl_back".tr,
                                            margin: EdgeInsets.only(right: 1.h),
                                            buttonStyle: CustomButtonStyles
                                                .outlinePrimaryTL10,
                                            buttonTextStyle: CustomTextStyles
                                                .bodyLargePrimary_1)),
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
      AddFarmHoldingOneModel? primaryFarmHoldingOneModel) {
    final canCancel = primaryFarmHoldingOneModel!.stepped > 0;
    final canContinue = primaryFarmHoldingOneModel.stepped < 3;
    return CupertinoStepper(
      type: type,
      currentStep: primaryFarmHoldingOneModel.stepped,
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
              onTapNextC(context, primaryFarmHoldingOneModel.stepped - 1);
            }
          : null,
      onStepContinue: canContinue
          ? () {
              //   context.read<FarmersIdentificationFourBloc>().add(StepUpEvent());
              //Chosen
              onTapNextC(context, primaryFarmHoldingOneModel.stepped + 1);
            }
          : null,
      steps: [
        _buildStep(
          title: Text('1'),
          state: primaryFarmHoldingOneModel.page1!,
          addcallback: () {},
        ),
        _buildStep(
          title: Text('2'),
          state: primaryFarmHoldingOneModel.page2!,
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
        AppRoutes.primaryFarmHoldingOneScreen,
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
        AppRoutes.primaryFarmHoldingTwoScreen,
      );
    }
  }

  /// Navigates to the addFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addFarmHoldingScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addFarmHoldingScreen,
    );
  }

  /// Navigates to the addFarmHoldingTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addFarmHoldingTwoScreen.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addFarmHoldingTwoScreen,
    );
  }

  /// Navigates to the addFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addFarmHoldingScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addFarmHoldingScreen,
    );
  }
}
