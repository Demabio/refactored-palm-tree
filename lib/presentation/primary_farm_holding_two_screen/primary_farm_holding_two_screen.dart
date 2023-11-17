import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/widgets/enterprises_widget.dart';

import 'bloc/primary_farm_holding_two_bloc.dart';
import 'models/primary_farm_holding_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class PrimaryFarmHoldingTwoScreen extends StatelessWidget {
  PrimaryFarmHoldingTwoScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<PrimaryFarmHoldingTwoBloc>(
        create: (context) => PrimaryFarmHoldingTwoBloc(
            PrimaryFarmHoldingTwoState(
                primaryFarmHoldingTwoModelObj: PrimaryFarmHoldingTwoModel()))
          ..add(PrimaryFarmHoldingTwoInitialEvent()),
        child: PrimaryFarmHoldingTwoScreen());
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
                  leadingWidth: DeviceExt((60 / 841) * 100).h,
                  leading: AppbarImage(
                      svgPath: ImageConstant.imgSort,
                      margin: EdgeInsets.only(
                          left: DeviceExt((16 / 841) * 100).h,
                          top: DeviceExt((3 / 411) * 100).w,
                          bottom: DeviceExt((11 / 411) * 100).w),
                      onTap: () {
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "Farm Holding".tr),
                  styleType: Style.bgFill),
              body: Form(
                key: _formKey,
                child: SizedBox(
                    width: mediaQueryData.size.width,
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
                                          PrimaryFarmHoldingTwoBloc,
                                          PrimaryFarmHoldingTwoState,
                                          PrimaryFarmHoldingTwoModel?>(
                                      selector: (state) =>
                                          state.primaryFarmHoldingTwoModelObj,
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
                                          stepRadius:
                                              DeviceExt((25 / 841) * 100).h,
                                          disableScroll: true,
                                          showStepBorder: true,
                                          alignment: Alignment.center,
                                          steps: [
                                            EasyStep(
                                              customStep: CircleAvatar(
                                                radius:
                                                    DeviceExt((35 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: DeviceExt(
                                                          (25 / 841) * 100)
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
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    DeviceExt(
                                                                            1.8)
                                                                        .h,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.check,
                                                              size: DeviceExt(5)
                                                                  .h,
                                                            ),
                                                ),
                                              ),
                                              customTitle: Text("Step 1".tr,
                                                  textAlign: TextAlign.center,
                                                  style: CustomTextStyles
                                                      .titleMediumBlack90018),
                                            ),
                                            EasyStep(
                                              customStep: CircleAvatar(
                                                radius:
                                                    DeviceExt((35 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: DeviceExt(
                                                          (25 / 841) * 100)
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
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    DeviceExt(
                                                                            1.8)
                                                                        .h,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.check,
                                                              size: DeviceExt(5)
                                                                  .h,
                                                            ),
                                                ),
                                              ),

                                              customTitle: Text("Step 2".tr,
                                                  textAlign: TextAlign.center,
                                                  style: CustomTextStyles
                                                      .titleMediumBlack90018),
                                              //topTitle: true,
                                            ),
                                          ],
                                        );
                                      })),
                                  // Text("lbl_production_type".tr,
                                  //     style:
                                  //         CustomTextStyles.titleMediumSemiBold),

                                  SizedBox(
                                      height: DeviceExt((19 / 411) * 100).w),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((14 / 841) * 100).h,
                                          top: DeviceExt((15 / 411) * 100).w),
                                      child: Text(
                                          "msg_main_farm_enterprises".tr,
                                          style: CustomTextStyles
                                              .titleMediumSemiBold)),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((14 / 841) * 100).h,
                                          top: DeviceExt((16 / 411) * 100).w),
                                      child: Row(children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: DeviceExt((1 / 411) * 100)
                                                    .w),
                                            child: Text("lbl_accuracy".tr,
                                                style: CustomTextStyles
                                                    .labelLargePrimary)),
                                        Spacer(),
                                        BlocSelector<
                                                PrimaryFarmHoldingTwoBloc,
                                                PrimaryFarmHoldingTwoState,
                                                PrimaryFarmHoldingTwoState?>(
                                            selector: (state) => state,
                                            builder: (context, state) {
                                              return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: DeviceExt(
                                                              (87 / 841) * 100)
                                                          .h),
                                                  child: Text(
                                                      "${state?.accuracy} metres",
                                                      style: CustomTextStyles
                                                          .labelLargePrimary));
                                            }),
                                      ])),
                                  SizedBox(
                                      height: DeviceExt((15 / 411) * 100).w),
                                  Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_longitude2".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary_1),
                                              BlocSelector<
                                                      PrimaryFarmHoldingTwoBloc,
                                                      PrimaryFarmHoldingTwoState,
                                                      TextEditingController?>(
                                                  selector: (state) =>
                                                      state.titleoneController,
                                                  builder: (context,
                                                      titleoneController) {
                                                    return CustomTextFormField(
                                                        width: DeviceExt(
                                                                (150 / 841) *
                                                                    100)
                                                            .h,
                                                        autofocus: false,
                                                        focusNode: node1,
                                                        controller:
                                                            titleoneController,
                                                        hintText:
                                                            "lbl_longitude3".tr,
                                                        validator: (value) {
                                                          if (!isNumeric(value,
                                                              isRequired:
                                                                  true)) {
                                                            return "Please enter valid input";
                                                          }
                                                          return null;
                                                        },
                                                        textInputType:
                                                            TextInputType
                                                                .number,
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                horizontal:
                                                                    DeviceExt((4 /
                                                                                841) *
                                                                            100)
                                                                        .h,
                                                                vertical: DeviceExt(
                                                                        (11 / 411) *
                                                                            100)
                                                                    .w));
                                                  })
                                            ]),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left:
                                                    DeviceExt((13 / 841) * 100)
                                                        .h),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("lbl_latitude2".tr,
                                                      style: CustomTextStyles
                                                          .labelMediumPrimary_1),
                                                  BlocSelector<
                                                          PrimaryFarmHoldingTwoBloc,
                                                          PrimaryFarmHoldingTwoState,
                                                          TextEditingController?>(
                                                      selector: (state) => state
                                                          .titlethreeController,
                                                      builder: (context,
                                                          titlethreeController) {
                                                        return CustomTextFormField(
                                                            width: DeviceExt(
                                                                    (150 / 841) *
                                                                        100)
                                                                .h,
                                                            autofocus: false,
                                                            focusNode: node2,
                                                            controller:
                                                                titlethreeController,
                                                            validator: (value) {
                                                              if (!isNumeric(
                                                                  value,
                                                                  isRequired:
                                                                      true)) {
                                                                return "Please enter valid input";
                                                              }
                                                              return null;
                                                            },
                                                            textInputType:
                                                                TextInputType
                                                                    .number,
                                                            hintText:
                                                                "lbl_latitude3"
                                                                    .tr,
                                                            contentPadding: EdgeInsets.symmetric(
                                                                horizontal:
                                                                    DeviceExt((4 /
                                                                                841) *
                                                                            100)
                                                                        .h,
                                                                vertical: DeviceExt(
                                                                        (11 / 411) *
                                                                            100)
                                                                    .w));
                                                      })
                                                ])),
                                      ]),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: DeviceExt((15 / 411) * 100).w),
                                    child: CustomElevatedButton(
                                        height: DeviceExt((50 / 411) * 100).w,
                                        width: DeviceExt((150 / 841) * 100).h,
                                        text: "lbl_set_location".tr,
                                        buttonTextStyle: CustomTextStyles
                                            .bodySmallPoppinsWhiteA700,
                                        onTap: () {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(GetLocation(
                                                createFailed: () =>
                                                    closedialog(context),
                                                createSuccessful: () =>
                                                    closedialog(context),
                                              ));
                                        }),
                                  ),
                                  SizedBox(
                                      height: DeviceExt((37 / 411) * 100).w),
                                  Text("msg_legal_status_of2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          PrimaryFarmHoldingTwoBloc,
                                          PrimaryFarmHoldingTwoState,
                                          PrimaryFarmHoldingTwoModel?>(
                                      selector: (state) =>
                                          state.primaryFarmHoldingTwoModelObj,
                                      builder: (context,
                                          primaryFarmHoldingTwoModelObj) {
                                        return CustomDropDown(
                                            icon: Container(
                                                margin: EdgeInsets.only(
                                                    left: DeviceExt(
                                                            (30 / 841) * 100)
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
                                            val: primaryFarmHoldingTwoModelObj
                                                ?.selectedDropDownValue,
                                            items: primaryFarmHoldingTwoModelObj
                                                    ?.dropdownItemList ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      PrimaryFarmHoldingTwoBloc>()
                                                  .add(ChangeDropDownEvent(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((37 / 411) * 100).w),
                                  Text("msg_lr_no_certificate_lease2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          PrimaryFarmHoldingTwoBloc,
                                          PrimaryFarmHoldingTwoState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.titlesevenController,
                                      builder: (context, titlesevenController) {
                                        return CustomTextFormField(
                                            focusNode: node3,
                                            autofocus: false,
                                            controller: titlesevenController,
                                            hintText: "lbl_info".tr,
                                            textInputAction:
                                                TextInputAction.done);
                                      }),
                                  SizedBox(
                                      height: DeviceExt((37 / 411) * 100).w),
                                  Text("msg_do_you_have_another2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          PrimaryFarmHoldingTwoBloc,
                                          PrimaryFarmHoldingTwoState,
                                          PrimaryFarmHoldingTwoModel?>(
                                      selector: (state) =>
                                          state.primaryFarmHoldingTwoModelObj,
                                      builder: (context,
                                          primaryFarmHoldingTwoModelObj) {
                                        return CustomDropDown(
                                            icon: Container(
                                                margin: EdgeInsets.only(
                                                    left: DeviceExt(
                                                            (30 / 841) * 100)
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
                                            val: primaryFarmHoldingTwoModelObj
                                                ?.selectedDropDownValue1,
                                            items: primaryFarmHoldingTwoModelObj
                                                    ?.dropdownItemList1 ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      PrimaryFarmHoldingTwoBloc>()
                                                  .add(ChangeDropDown1Event(
                                                      value: value));
                                            });
                                      }),
                                  BlocSelector<PrimaryFarmHoldingTwoBloc,
                                          PrimaryFarmHoldingTwoState, bool?>(
                                      selector: (state) => state.checked,
                                      builder: (context, checked) {
                                        return Container(
                                          width: DeviceExt((266 / 841) * 100).h,
                                          margin: EdgeInsets.only(
                                              left:
                                                  DeviceExt((14 / 841) * 100).h,
                                              top:
                                                  DeviceExt((13 / 411) * 100).w,
                                              right: DeviceExt((60 / 841) * 100)
                                                  .h),
                                          child: Text(
                                            "msg_what_enterprises".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: checked!
                                                ? CustomTextStyles
                                                    .labelMediumPrimary_1red
                                                : CustomTextStyles
                                                    .labelMediumPrimary_1,
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                      height: DeviceExt((12 / 411) * 100).w),
                                  BlocSelector<
                                      PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState,
                                      PrimaryFarmHoldingTwoModel?>(
                                    selector: (state) =>
                                        state.primaryFarmHoldingTwoModelObj,
                                    builder: (context,
                                        primaryFarmHoldingTwoModelObj) {
                                      return Column(
                                        children: List<Widget>.generate(
                                          primaryFarmHoldingTwoModelObj
                                                  ?.enterprises.length ??
                                              0,
                                          (index) {
                                            EnterpriseModel model =
                                                primaryFarmHoldingTwoModelObj
                                                        ?.enterprises[index] ??
                                                    EnterpriseModel();

                                            return EnterprisesItemWidget(
                                              model,
                                              onSelect: (value) {
                                                context
                                                    .read<
                                                        PrimaryFarmHoldingTwoBloc>()
                                                    .add(
                                                        ChangeEnterprisesCheckbox(
                                                            value: index,
                                                            selected: value));
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                      height: DeviceExt((12 / 411) * 100).w),
                                  CustomOutlinedButton(
                                      text: "lbl_back".tr,
                                      
                                      buttonStyle: CustomButtonStyles
                                          .outlinePrimary,
                                      buttonTextStyle:
                                          CustomTextStyles
                                              .bodyLargePrimary_2,
                                      onTap: () {
                                        goBack(context);
                                      }),
                                  SizedBox(
                                      height: DeviceExt((12 / 411) * 100).w),
                                  CustomElevatedButton(
                                      text: "lbl_save".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(
                                              right: DeviceExt((10 / 841) * 100)
                                                  .h),
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
      context.read<PrimaryFarmHoldingTwoBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.primaryFarmHoldingScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong, Kindly confirm all fields are filled.")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PrimaryFarmHoldingTwoBloc>().add(
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
    if (val == 0 && pfProgress.pageOne == 1) {
      Navigator.popAndPushNamed(context, AppRoutes.primaryFarmHoldingOneScreen);
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.primaryFarmHoldingScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.primaryFarmHoldingOneScreen);
  }

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.primaryFarmHoldingOneScreen,
    );
  }

  /// Navigates to the mapScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the mapScreen.
  onTapSetlocation(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.mapScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapBack(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.primaryFarmHoldingOneScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingScreen.
  onTapSave(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.primaryFarmHoldingScreen,
    );
  }

  closedialog(BuildContext context) async {
    String label = "Location Services";
    String body = "Kindly Enable Location Services";

    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialogTwo.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  nolocation(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              content: Container(
                width: DeviceExt((330 / 841) * 100).h,
                padding: EdgeInsets.symmetric(
                  horizontal: DeviceExt((16 / 841) * 100).h,
                  vertical: DeviceExt((6 / 411) * 100).w,
                ),
                decoration: AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: DeviceExt((30 / 411) * 100).w),
                    Text(
                      "Farmer Id Number: ${PrefUtils().getFarmerIdNo()}".tr,
                      style: CustomTextStyles.bodyLargePrimary_2,
                    ),
                    SizedBox(height: DeviceExt((10 / 411) * 100).w),
                    Text(
                      "Kindly Enable Location Services",
                      style: CustomTextStyles.bodyMediumPoppinsBlack900,
                    ),
                    SizedBox(height: DeviceExt((51 / 411) * 100).w),
                    Expanded(
                      child: CustomOutlinedButton(
                        text: "Close".tr,
                        onTap: () => Navigator.pop(context),
                        margin: EdgeInsets.only(
                            right: DeviceExt((4 / 841) * 100).h),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
