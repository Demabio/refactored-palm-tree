import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_five_dialog/add_landandwatermgmt_five_dialog.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_seven_dialog/add_landandwatermgmt_seven_dialog.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/add_landandwatermgmt_six_screen.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/widgets/membership_widget.dart';

import 'bloc/add_landandwatermgmt_two_bloc.dart';
import 'models/add_landandwatermgmt_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AddLandandwatermgmtTwoScreen extends StatelessWidget {
  AddLandandwatermgmtTwoScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtTwoBloc>(
      create: (context) =>
          AddLandandwatermgmtTwoBloc(AddLandandwatermgmtTwoState(
        addLandandwatermgmtTwoModelObj: AddLandandwatermgmtTwoModel(),
      ))
            ..add(AddLandandwatermgmtTwoInitialEvent()),
      child: AddLandandwatermgmtTwoScreen(),
    );
  }

  FocusNode node = FocusNode();
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
                  goB(context);
                }),
            centerTitle: true,
            title: AppbarSubtitle4(
              text: "msg_land_and_water_management2".tr,
            ),
            styleType: Style.bgFill,
          ),
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: DeviceExt((5 / 411) * 100).w),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: DeviceExt((16 / 841) * 100).h,
                    right: DeviceExt((16 / 841) * 100).h,
                    bottom: DeviceExt((5 / 411) * 100).w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocSelector<
                              AddLandandwatermgmtTwoBloc,
                              AddLandandwatermgmtTwoState,
                              AddLandandwatermgmtTwoModel?>(
                          selector: (state) =>
                              state.addLandandwatermgmtTwoModelObj,
                          builder:
                              ((context, farmersIdentificationOneModelObj) {
                            return EasyStepper(
                              activeStep:
                                  farmersIdentificationOneModelObj!.stepped,
                              onStepReached: (index) {
                                _navToStep(
                                    index,
                                    context,
                                    farmersIdentificationOneModelObj
                                        .lwProgress!);
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
                                    backgroundColor: theme.colorScheme.primary,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor:
                                          theme.colorScheme.primary,
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
                                      backgroundColor:
                                          theme.colorScheme.primary,
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
                              ],
                            );
                          })),
                      SizedBox(height: DeviceExt((45 / 411) * 100).w),
                      Text(
                        "msg_do_you_undertake2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddLandandwatermgmtTwoBloc,
                          AddLandandwatermgmtTwoState,
                          AddLandandwatermgmtTwoModel?>(
                        selector: (state) =>
                            state.addLandandwatermgmtTwoModelObj,
                        builder: (context, addLandandwatermgmtTwoModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLandandwatermgmtTwoModelObj
                                ?.selectedDropDownValue,
                            items: addLandandwatermgmtTwoModelObj
                                    ?.dropdownItemList ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddLandandwatermgmtTwoBloc>()
                                  .add(ChangeDropDownEvent(value: value));
                            },
                          );
                        },
                      ),
                      BlocSelector<
                              AddLandandwatermgmtTwoBloc,
                              AddLandandwatermgmtTwoState,
                              AddLandandwatermgmtTwoModel?>(
                          selector: (state) =>
                              state.addLandandwatermgmtTwoModelObj,
                          builder: (context, list) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: DeviceExt((15 / 411) * 100).w,
                                right: DeviceExt((16 / 841) * 100).h,
                              ),
                              child: Visibility(
                                visible: list?.selectedDropDownValue?.id == 1,
                                child: Column(
                                  children: [
                                    BlocSelector<AddLandandwatermgmtTwoBloc,
                                            AddLandandwatermgmtTwoState, bool?>(
                                        selector: (state) => state.checka,
                                        builder: (context, checked) {
                                          return Text(
                                            "msg_if_yes_what_type2".tr,
                                            style: checked!
                                                ? CustomTextStyles
                                                    .labelMediumPrimary_1red
                                                : CustomTextStyles
                                                    .labelMediumPrimary_1,
                                          );
                                        }),
                                    BlocSelector<
                                            AddLandandwatermgmtTwoBloc,
                                            AddLandandwatermgmtTwoState,
                                            List<CheckBoxList>?>(
                                        selector: (state) => state.u,
                                        builder: (context, list) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              top:
                                                  DeviceExt((15 / 411) * 100).w,
                                              right:
                                                  DeviceExt((16 / 841) * 100).h,
                                            ),
                                            child: Column(
                                              children: List<Widget>.generate(
                                                list?.length ?? 0,
                                                (index) {
                                                  CheckBoxList model =
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
                                      text: "msg_add_undertaken_irrigation".tr,
                                      onTap: () => addIrrigation(context),
                                      margin: EdgeInsets.only(
                                        left: DeviceExt((82 / 841) * 100).h,
                                        top: DeviceExt((9 / 411) * 100).w,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(
                                        height: DeviceExt((17 / 411) * 100).w),
                                    BlocSelector<AddLandandwatermgmtTwoBloc,
                                            AddLandandwatermgmtTwoState, bool?>(
                                        selector: (state) => state.checkb,
                                        builder: (context, checked) {
                                          return Text(
                                            "msg_type_and_name_of2".tr,
                                            style: checked!
                                                ? CustomTextStyles
                                                    .labelMediumPrimary_1red
                                                : CustomTextStyles
                                                    .labelMediumPrimary_1,
                                          );
                                        }),
                                    BlocSelector<
                                            AddLandandwatermgmtTwoBloc,
                                            AddLandandwatermgmtTwoState,
                                            List<CheckBoxList>?>(
                                        selector: (state) => state.p,
                                        builder: (context, list) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              top:
                                                  DeviceExt((15 / 411) * 100).w,
                                              right:
                                                  DeviceExt((16 / 841) * 100).h,
                                            ),
                                            child: Column(
                                              children: List<Widget>.generate(
                                                list?.length ?? 0,
                                                (index) {
                                                  CheckBoxList model =
                                                      list![index];

                                                  return MembershipItemWidget(
                                                    model,
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }),
                                    CustomElevatedButton(
                                      text: "msg_add_irrigation_project".tr,
                                      onTap: () =>
                                          addIrrigationProject(context),
                                      margin: EdgeInsets.only(
                                        left: DeviceExt((82 / 841) * 100).h,
                                        top: DeviceExt((31 / 411) * 100).w,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(
                                        height: DeviceExt((17 / 411) * 100).w),
                                    Container(
                                      width: DeviceExt((244 / 841) * 100).h,
                                      margin: EdgeInsets.only(
                                        top: DeviceExt((17 / 411) * 100).w,
                                        right: DeviceExt((98 / 841) * 100).h,
                                      ),
                                      child: Text(
                                        "msg_for_irrigation_schemes".tr,
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .labelMediumPrimary_1,
                                      ),
                                    ),
                                    BlocSelector<
                                            AddLandandwatermgmtTwoBloc,
                                            AddLandandwatermgmtTwoState,
                                            List<CheckBoxList>?>(
                                        selector: (state) => state.b,
                                        builder: (context, list) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              top:
                                                  DeviceExt((15 / 411) * 100).w,
                                              right:
                                                  DeviceExt((16 / 841) * 100).h,
                                            ),
                                            child: Column(
                                              children: List<Widget>.generate(
                                                list?.length ?? 0,
                                                (index) {
                                                  CheckBoxList model =
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
                                      text: "msg_add_implementing".tr,
                                      onTap: () => addImplementing(context),
                                      margin: EdgeInsets.only(
                                        left: DeviceExt((82 / 841) * 100).h,
                                        top: DeviceExt((7 / 411) * 100).w,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(
                                        height: DeviceExt((17 / 411) * 100).w),
                                    Text(
                                      "msg_total_area_under".tr,
                                      style:
                                          CustomTextStyles.labelMediumPrimary_1,
                                    ),
                                    BlocSelector<
                                        AddLandandwatermgmtTwoBloc,
                                        AddLandandwatermgmtTwoState,
                                        TextEditingController?>(
                                      selector: (state) =>
                                          state.areavalueoneController,
                                      builder:
                                          (context, areavalueoneController) {
                                        return CustomTextFormField(
                                          focusNode: node,
                                          autofocus: false,
                                          textInputType: TextInputType.number,
                                          controller: areavalueoneController,
                                          validator: (value) {
                                            if (!isNumeric(value,
                                                isRequired: true)) {
                                              return "Field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          hintText: "lbl_area".tr,
                                          textInputAction: TextInputAction.done,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                        height: DeviceExt((17 / 411) * 100).w),
                                    Text(
                                      "lbl_unit_of_area2".tr,
                                      style:
                                          CustomTextStyles.labelMediumPrimary_1,
                                    ),
                                    BlocSelector<
                                        AddLandandwatermgmtTwoBloc,
                                        AddLandandwatermgmtTwoState,
                                        AddLandandwatermgmtTwoModel?>(
                                      selector: (state) =>
                                          state.addLandandwatermgmtTwoModelObj,
                                      builder: (context,
                                          addLandandwatermgmtTwoModelObj) {
                                        return CustomDropDown(
                                          icon: Container(
                                            margin: EdgeInsets.only(
                                                left:
                                                    DeviceExt((30 / 841) * 100)
                                                        .h),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                DeviceExt((10 / 841) * 100).h,
                                              ),
                                            ),
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowdownPrimary,
                                            ),
                                          ),
                                          hintText: "lbl_select".tr,
                                          val: addLandandwatermgmtTwoModelObj
                                              ?.selectedDropDownValue1,
                                          items: addLandandwatermgmtTwoModelObj
                                                  ?.dropdownItemList1 ??
                                              [],
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    AddLandandwatermgmtTwoBloc>()
                                                .add(ChangeDropDown1Event(
                                                    value: value));
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      // Text(
                      //   "msg_type_and_name_of2".tr,
                      //   style: CustomTextStyles.labelMediumPrimary_1,
                      // ),

                      SizedBox(height: DeviceExt((18 / 411) * 100).w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              onTap: () => goB(context),
                              margin: EdgeInsets.only(
                                  right: DeviceExt((1 / 841) * 100).h),
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargePrimary_1,
                            ),
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              isDisabled: true,
                              buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(
                                  left: DeviceExt((1 / 841) * 100).h),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: DeviceExt((12 / 411) * 100).w),
                      CustomElevatedButton(
                        text: "lbl_save".tr,
                        onTap: () => saveDraft(context),
                        leftIcon: Container(
                          margin: EdgeInsets.only(
                              right: DeviceExt((10 / 841) * 100).h),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSaveWhiteA700,
                          ),
                        ),
                      ),
                    ],
                  ),
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
      context.read<AddLandandwatermgmtTwoBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.landandwatermgmtScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddLandandwatermgmtTwoBloc>().add(
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

  _navToStep(int val, BuildContext context, LWProgress pfProgress) {
    if (val == 0) {
      Navigator.popAndPushNamed(
          context, AppRoutes.addLandandwatermgmtOneScreen);
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.landandwatermgmtScreen);
  }

  goB(BuildContext context) {
    context.read<AddLandandwatermgmtTwoBloc>().add(
          GoBackEvent(
            createFailed: () => null,
            createSuccessful: () => goBack(context),
          ),
        );
  }

  goBack(BuildContext context) {
    context.read<AddLandandwatermgmtTwoBloc>().add(
          ClearEvent(),
        );
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addLandandwatermgmtOneScreen);
  }

  addIrrigation(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddLandandwatermgmtFiveDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddLandandwatermgmtTwoBloc>().add(
          CheckOneEvent(),
        );
  }

  addIrrigationProject(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddLandandwatermgmtSixScreen.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddLandandwatermgmtTwoBloc>().add(
          CheckTwoEvent(),
        );
  }

  addImplementing(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddLandandwatermgmtSevenDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddLandandwatermgmtTwoBloc>().add(
          CheckThreeEvent(),
        );
  }
}
