import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/add_farm_holding_one_bloc.dart';
import 'models/add_farm_holding_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
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
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_add_farm_holding".tr),
                  styleType: Style.bgFill),
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      padding:
                          EdgeInsets.only(top: DeviceExt((5 / 411) * 100).w),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt((16 / 841) * 100).h,
                              right: DeviceExt((16 / 841) * 100).h,
                              bottom: DeviceExt((5 / 411) * 100).w),
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
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceExt((13 / 841) * 100).h,
                                        top: DeviceExt((13 / 411) * 100).w),
                                    child: Text("msg_farm_enterprises".tr,
                                        style: CustomTextStyles
                                            .titleMediumSemiBold)),
                                SizedBox(height: DeviceExt((27 / 411) * 100).w),
                                Text("msg_descriptive_name2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
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
                                            if (!isText(value,
                                                isRequired: true)) {
                                              return "Please enter valid text";
                                            }
                                            return null;
                                          });
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Text("msg_total_land_size".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
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
                                          validator: (value) {
                                            if (!isNumeric(value,
                                                isRequired: true)) {
                                              return "Please enter valid input";
                                            }
                                            return null;
                                          },
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Text("lbl_area_unit2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
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
                                              margin: EdgeInsets.only(
                                                  left:
                                                      DeviceExt((30 / 841) * 100)
                                                          .h),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          DeviceExt((10 / 841) * 100)
                                                              .h)),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPrimary)),
                                          hintText: "lbl_select".tr,
                                          validator: (value) {
                                            if (value == null) {
                                              return "Field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          val: addFarmHoldingOneModelObj
                                              ?.selectedDropDownValue,
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
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Text("msg_size_of_land_under2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        AddFarmHoldingOneBloc,
                                        AddFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.sizeoneController,
                                    builder: (context, sizeoneController) {
                                      return CustomTextFormField(
                                          controller: sizeoneController,
                                          autofocus: false,
                                          focusNode: node3,
                                          hintText: "lbl_size".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
                                Text("msg_total_land_area2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
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
                                          validator: (value) {
                                            if (!isNumeric(value,
                                                isRequired: true)) {
                                              return "Please enter valid input";
                                            }
                                            return null;
                                          },
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: DeviceExt((33 / 411) * 100).w),
                                Text("msg_size_of_land_leased2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
                                BlocSelector<
                                        AddFarmHoldingOneBloc,
                                        AddFarmHoldingOneState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.sizetwoController,
                                    builder: (context, sizetwoController) {
                                      return CustomTextFormField(
                                          controller: sizetwoController,
                                          autofocus: false,
                                          focusNode: node5,
                                          hintText:
                                              "msg_size_of_land_leased2".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003);
                                    }),
                                SizedBox(height: DeviceExt((33 / 411) * 100).w),
                                Text("msg_size_of_land_lying2".tr,
                                    style:
                                        CustomTextStyles.labelMediumPrimary_1),
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
                                          hintText:
                                              "msg_size_of_land_lying2".tr,
                                          hintStyle: CustomTextStyles
                                              .titleMediumBluegray40003,
                                          textInputAction:
                                              TextInputAction.done);
                                    }),
                                SizedBox(height: DeviceExt((32 / 411) * 100).w),
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
                                              buttonTextStyle: CustomTextStyles
                                                  .bodyLargePrimary_1)),
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
                                SizedBox(height: DeviceExt((12 / 411) * 100).w),
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
      context.read<AddFarmHoldingOneBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.addFarmHoldingTwoScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddFarmHoldingOneBloc>().add(
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
      if (val == 1 && pfProgress.pageOne == 1) {
        Navigator.popAndPushNamed(context, AppRoutes.addFarmHoldingTwoScreen);
      }
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addFarmHoldingScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addFarmHoldingScreen);
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
