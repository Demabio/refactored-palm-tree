import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_crop_fertiliser_dialog/add_crop_fertiliser_dialog.dart';
import 'package:kiamis_app/presentation/add_crop_fertilisersource_dialog/add_crop_fertilisersource_dialog.dart';
import 'package:kiamis_app/presentation/add_crop_pesticide_dialog/add_crop_pesticide_dialog.dart';

import 'bloc/add_crop_two_bloc.dart';
import 'models/add_crop_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AddCropTwoScreen extends StatelessWidget {
  AddCropTwoScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
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
                  title: AppbarSubtitle1(text: "lbl_add_new_crop".tr),
                  styleType: Style.bgFill),
              body: Form(
                key: _formKey,
                child: SizedBox(
                    width: mediaQueryData.size.width,
                    child: SingleChildScrollView(
                        padding:
                            EdgeInsets.only(top: DeviceExt((10 / 411) * 100).w),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: DeviceExt((16 / 841) * 100).h,
                                right: DeviceExt((16 / 841) * 100).h,
                                bottom: DeviceExt((5 / 411) * 100).w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
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
                                                    .caProgressDB!);
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
                                          ],
                                        );
                                      })),
                                  SizedBox(
                                      height: DeviceExt((11 / 411) * 100).w),
                                  Text("lbl_purpose2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
                                      builder: (context, addCropTwoModelObj) {
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
                                            val: addCropTwoModelObj
                                                ?.selectedDropDownValue,
                                            items: addCropTwoModelObj
                                                    ?.dropdownItemList ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropTwoBloc>()
                                                  .add(ChangeDropDownEvent(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((35 / 411) * 100).w),
                                  Text("msg_production_system".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
                                      builder: (context, addCropTwoModelObj) {
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
                                            val: addCropTwoModelObj
                                                ?.selectedDropDownValue1,
                                            items: addCropTwoModelObj
                                                    ?.dropdownItemList1 ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropTwoBloc>()
                                                  .add(ChangeDropDown1Event(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((35 / 411) * 100).w),
                                  Text("msg_water_source".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
                                      builder: (context, addCropTwoModelObj) {
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
                                            val: addCropTwoModelObj
                                                ?.selectedDropDownValue2,
                                            items: addCropTwoModelObj
                                                    ?.dropdownItemList2 ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropTwoBloc>()
                                                  .add(ChangeDropDown2Event(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((35 / 411) * 100).w),
                                  Text("msg_use_pesticide".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
                                      builder: (context, addCropTwoModelObj) {
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
                                            val: addCropTwoModelObj
                                                ?.selectedDropDownValue3,
                                            items: addCropTwoModelObj
                                                    ?.dropdownItemList3 ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropTwoBloc>()
                                                  .add(ChangeDropDown3Event(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((35 / 411) * 100).w),
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
                                      builder: (context, list) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: DeviceExt((15 / 411) * 100).w,
                                            right:
                                                DeviceExt((16 / 841) * 100).h,
                                          ),
                                          child: Visibility(
                                            visible: list
                                                    ?.selectedDropDownValue3
                                                    ?.id ==
                                                1,
                                            child: Column(
                                              children: [
                                                BlocSelector<AddCropTwoBloc,
                                                        AddCropTwoState, bool?>(
                                                    selector: (state) =>
                                                        state.checkedP,
                                                    builder:
                                                        (context, checked) {
                                                      return Text(
                                                        "If yes, Which other chemical interventions do you use on the crops? (*)"
                                                            .tr,
                                                        style: checked!
                                                            ? CustomTextStyles
                                                                .labelMediumPrimary_1red
                                                            : CustomTextStyles
                                                                .labelMediumPrimary_1,
                                                      );
                                                    }),
                                                BlocSelector<
                                                        AddCropTwoBloc,
                                                        AddCropTwoState,
                                                        List<CheckBoxList>?>(
                                                    selector: (state) =>
                                                        state.p,
                                                    builder: (context, list) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: DeviceExt(
                                                                  (15 / 411) *
                                                                      100)
                                                              .w,
                                                          right: DeviceExt(
                                                                  (16 / 841) *
                                                                      100)
                                                              .h,
                                                        ),
                                                        child: Column(
                                                          children: List<
                                                              Widget>.generate(
                                                            list?.length ?? 0,
                                                            (index) {
                                                              CheckBoxList
                                                                  model =
                                                                  list![index];

                                                              return InputsWidget(
                                                                model,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                CustomElevatedButton(
                                                  text: "Add Pesticide Used".tr,
                                                  onTap: () =>
                                                      addPesticide(context),
                                                  margin: EdgeInsets.only(
                                                    left: DeviceExt(
                                                            (82 / 841) * 100)
                                                        .h,
                                                    top: DeviceExt(
                                                            (9 / 411) * 100)
                                                        .w,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                      height: DeviceExt((12 / 411) * 100).w),
                                  Text("msg_use_fertilizer".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
                                      builder: (context, addCropTwoModelObj) {
                                        return CustomDropDown(
                                            icon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    DeviceExt((30 / 841) * 100)
                                                        .h,
                                                    DeviceExt((11 / 411) * 100)
                                                        .w,
                                                    DeviceExt((1 / 841) * 100)
                                                        .h,
                                                    DeviceExt((14 / 411) * 100)
                                                        .w),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
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
                                            val: addCropTwoModelObj
                                                ?.selectedDropDownValue4,
                                            items: addCropTwoModelObj
                                                    ?.dropdownItemList4 ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropTwoBloc>()
                                                  .add(ChangeDropDown4Event(
                                                      value: value));
                                            });
                                      }),
                                  BlocSelector<AddCropTwoBloc, AddCropTwoState,
                                          AddCropTwoModel?>(
                                      selector: (state) =>
                                          state.addCropTwoModelObj,
                                      builder: (context, list) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: DeviceExt((15 / 411) * 100).w,
                                            right:
                                                DeviceExt((16 / 841) * 100).h,
                                          ),
                                          child: Visibility(
                                            visible: list
                                                    ?.selectedDropDownValue4
                                                    ?.id ==
                                                1,
                                            child: Column(
                                              children: [
                                                BlocSelector<AddCropTwoBloc,
                                                        AddCropTwoState, bool?>(
                                                    selector: (state) =>
                                                        state.checkedA,
                                                    builder:
                                                        (context, checked) {
                                                      return Text(
                                                        "If yes, Which fertiliser types do you use? (*)",
                                                        style: checked!
                                                            ? CustomTextStyles
                                                                .labelMediumPrimary_1red
                                                            : CustomTextStyles
                                                                .labelMediumPrimary_1,
                                                      );
                                                    }),
                                                SizedBox(
                                                    height: DeviceExt(
                                                            (17 / 411) * 100)
                                                        .w),
                                                BlocSelector<
                                                        AddCropTwoBloc,
                                                        AddCropTwoState,
                                                        List<CheckBoxList>?>(
                                                    selector: (state) =>
                                                        state.a,
                                                    builder: (context, list) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: DeviceExt(
                                                                  (15 / 411) *
                                                                      100)
                                                              .w,
                                                          right: DeviceExt(
                                                                  (16 / 841) *
                                                                      100)
                                                              .h,
                                                        ),
                                                        child: Column(
                                                          children: List<
                                                              Widget>.generate(
                                                            list?.length ?? 0,
                                                            (index) {
                                                              CheckBoxList
                                                                  model =
                                                                  list![index];

                                                              return InputsWidget(
                                                                model,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                SizedBox(
                                                    height: DeviceExt(
                                                            (17 / 411) * 100)
                                                        .w),
                                                CustomElevatedButton(
                                                  text:
                                                      "Add Fertiliser Used".tr,
                                                  onTap: () =>
                                                      addFertiliser(context),
                                                  margin: EdgeInsets.only(
                                                    left: DeviceExt(
                                                            (82 / 841) * 100)
                                                        .h,
                                                    top: DeviceExt(
                                                            (9 / 411) * 100)
                                                        .w,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                ),
                                                SizedBox(
                                                    height: DeviceExt(
                                                            (17 / 411) * 100)
                                                        .w),
                                                BlocSelector<AddCropTwoBloc,
                                                        AddCropTwoState, bool?>(
                                                    selector: (state) =>
                                                        state.checkedS,
                                                    builder:
                                                        (context, checked) {
                                                      return Text(
                                                        "If yes, Where did you source the fertiliser? (*)"
                                                            .tr,
                                                        style: checked!
                                                            ? CustomTextStyles
                                                                .labelMediumPrimary_1red
                                                            : CustomTextStyles
                                                                .labelMediumPrimary_1,
                                                      );
                                                    }),
                                                SizedBox(
                                                    height: DeviceExt(
                                                            (17 / 411) * 100)
                                                        .w),
                                                BlocSelector<
                                                        AddCropTwoBloc,
                                                        AddCropTwoState,
                                                        List<CheckBoxList>?>(
                                                    selector: (state) =>
                                                        state.s,
                                                    builder: (context, list) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: DeviceExt(
                                                                  (15 / 411) *
                                                                      100)
                                                              .w,
                                                          right: DeviceExt(
                                                                  (16 / 841) *
                                                                      100)
                                                              .h,
                                                        ),
                                                        child: Column(
                                                          children: List<
                                                              Widget>.generate(
                                                            list?.length ?? 0,
                                                            (index) {
                                                              CheckBoxList
                                                                  model =
                                                                  list![index];

                                                              return InputsWidget(
                                                                model,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                SizedBox(
                                                    height: DeviceExt(
                                                            (17 / 411) * 100)
                                                        .w),
                                                CustomElevatedButton(
                                                  text: "Add Fertiliser Source"
                                                      .tr,
                                                  onTap: () =>
                                                      addFertiliserSource(
                                                          context),
                                                  margin: EdgeInsets.only(
                                                    left: DeviceExt(
                                                            (82 / 841) * 100)
                                                        .h,
                                                    top: DeviceExt(
                                                            (7 / 411) * 100)
                                                        .w,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                      height: DeviceExt((17 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: CustomOutlinedButton(
                                                text: "lbl_back".tr,
                                                margin: EdgeInsets.only(
                                                    right: DeviceExt(
                                                            (1 / 841) * 100)
                                                        .h),
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
                                          margin: EdgeInsets.only(
                                              left:
                                                  DeviceExt((1 / 841) * 100).h),
                                          isDisabled: true,
                                          buttonStyle: CustomButtonStyles
                                              .fillPrimaryTL10,
                                        ))
                                      ]),
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
      context.read<AddCropTwoBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.addCropTwoScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddCropTwoBloc>().add(
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

  _navToStep(int val, BuildContext context, CAProgress caProgress) {
    if (val == 0 && caProgress.pageOne == 1) {
      Navigator.popAndPushNamed(context, AppRoutes.addCropOneScreen);
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.cropAgricultureScreen);
  }

  goBack(BuildContext context) {
    context.read<AddCropTwoBloc>().add(
          ClearEvent(),
        );
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addCropOneScreen);
  }

  /// Navigates to the addCropOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropOneScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addCropOneScreen,
    );
  }

  /// Navigates to the addCropOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropOneScreen.
  onTapBack(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addCropOneScreen,
    );
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  onTapSave(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }

  addPesticide(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddCropPesticideDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddCropTwoBloc>().add(
          CheckOneEvent(),
        );
  }

  addFertiliser(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddCropFertiliserDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddCropTwoBloc>().add(
          CheckTwoEvent(),
        );
  }

  addFertiliserSource(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddCropFertiliserSourceDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddCropTwoBloc>().add(
          CheckThreeEvent(),
        );
  }
}
