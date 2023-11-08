import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_four_dialog/add_landandwatermgmt_four_dialog.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_three_dialog/add_landandwatermgmt_three_dialog.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';

import 'bloc/add_landandwatermgmt_one_bloc.dart';
import 'models/add_landandwatermgmt_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AddLandandwatermgmtOneScreen extends StatelessWidget {
  AddLandandwatermgmtOneScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtOneBloc>(
      create: (context) =>
          AddLandandwatermgmtOneBloc(AddLandandwatermgmtOneState(
        addLandandwatermgmtOneModelObj: AddLandandwatermgmtOneModel(),
      ))
            ..add(AddLandandwatermgmtOneInitialEvent()),
      child: AddLandandwatermgmtOneScreen(),
    );
  }

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
                              AddLandandwatermgmtOneBloc,
                              AddLandandwatermgmtOneState,
                              AddLandandwatermgmtOneModel?>(
                          selector: (state) =>
                              state.addLandandwatermgmtOneModelObj,
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
                      SizedBox(height: DeviceExt((22 / 411) * 100).w),
                      // Container(
                      //   width: DeviceExt((319/841)*100).h,
                      //   margin: EdgeInsets.only(
                      //     top: DeviceExt(( 18/411)*100).w,
                      //     right: DeviceExt((24/841)*100).h,
                      //   ),
                      //   child: Text(
                      //     "msg_what_sustainable2".tr,
                      //     maxLines: 10,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: CustomTextStyles.labelMediumPrimary_1,
                      //   ),
                      // ),
                      BlocSelector<AddLandandwatermgmtOneBloc,
                              AddLandandwatermgmtOneState, bool?>(
                          selector: (state) => state.checka,
                          builder: (context, checked) {
                            return Text(
                              "msg_what_sustainable2".tr,
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      BlocSelector<AddLandandwatermgmtOneBloc,
                              AddLandandwatermgmtOneState, List<CheckBoxList>?>(
                          selector: (state) => state.p,
                          builder: (context, list) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: DeviceExt((15 / 411) * 100).w,
                                right: DeviceExt((16 / 841) * 100).h,
                              ),
                              child: Column(
                                children: List<Widget>.generate(
                                  list?.length ?? 0,
                                  (index) {
                                    CheckBoxList model = list![index];

                                    return InputsWidget(
                                      model,
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                      CustomElevatedButton(
                        text: "lbl_add_practice".tr,
                        onTap: () => addPractice(context),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((41 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((17 / 411) * 100).w),
                      Text(
                        "msg_have_you_benefited2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddLandandwatermgmtOneBloc,
                          AddLandandwatermgmtOneState,
                          AddLandandwatermgmtOneModel?>(
                        selector: (state) =>
                            state.addLandandwatermgmtOneModelObj,
                        builder: (context, addLandandwatermgmtOneModelObj) {
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
                            val: addLandandwatermgmtOneModelObj
                                ?.selectedDropDownValue,
                            items: addLandandwatermgmtOneModelObj
                                    ?.dropdownItemList ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddLandandwatermgmtOneBloc>()
                                  .add(ChangeDropDownEvent(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((17 / 411) * 100).w),
                      Text(
                        "msg_do_you_use_lime2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddLandandwatermgmtOneBloc,
                          AddLandandwatermgmtOneState,
                          AddLandandwatermgmtOneModel?>(
                        selector: (state) =>
                            state.addLandandwatermgmtOneModelObj,
                        builder: (context, addLandandwatermgmtOneModelObj) {
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
                            val: addLandandwatermgmtOneModelObj
                                ?.selectedDropDownValue1,
                            items: addLandandwatermgmtOneModelObj
                                    ?.dropdownItemList1 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddLandandwatermgmtOneBloc>()
                                  .add(ChangeDropDown1Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((17 / 411) * 100).w),
                      Text(
                        "msg_have_you_done_soil2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddLandandwatermgmtOneBloc,
                          AddLandandwatermgmtOneState,
                          AddLandandwatermgmtOneModel?>(
                        selector: (state) =>
                            state.addLandandwatermgmtOneModelObj,
                        builder: (context, addLandandwatermgmtOneModelObj) {
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
                            val: addLandandwatermgmtOneModelObj
                                ?.selectedDropDownValue2,
                            items: addLandandwatermgmtOneModelObj
                                    ?.dropdownItemList2 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddLandandwatermgmtOneBloc>()
                                  .add(ChangeDropDown2Event(value: value));
                            },
                          );
                        },
                      ),
                      Container(
                        width: DeviceExt((315 / 841) * 100).h,
                        margin: EdgeInsets.only(
                          top: DeviceExt((17 / 411) * 100).w,
                          right: DeviceExt((27 / 841) * 100).h,
                        ),
                        child: Text(
                          "msg_what_is_the_main2".tr,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                      ),
                      BlocSelector<AddLandandwatermgmtOneBloc,
                              AddLandandwatermgmtOneState, List<CheckBoxList>?>(
                          selector: (state) => state.s,
                          builder: (context, list) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: DeviceExt((15 / 411) * 100).w,
                                right: DeviceExt((16 / 841) * 100).h,
                              ),
                              child: Column(
                                children: List<Widget>.generate(
                                  list?.length ?? 0,
                                  (index) {
                                    CheckBoxList model = list![index];

                                    return InputsWidget(
                                      model,
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                      CustomElevatedButton(
                        text: "lbl_add_source".tr,
                        onTap: () => addSource(context),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((67 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((18 / 411) * 100).w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              margin: EdgeInsets.only(
                                  right: DeviceExt((1 / 841) * 100).h),
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              isDisabled: true,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargePrimary_1,
                            ),
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              text: "lbl_next".tr,
                              onTap: () => nextPage(context),
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
      context.read<AddLandandwatermgmtOneBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.addLandandwatermgmtTwoScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) async {
    String label = "Save to Draft";
    String body = "Do you want to stop and save details to draft?";
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialog.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    if (_formKey.currentState!.validate()) {
      context.read<AddLandandwatermgmtOneBloc>().add(
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
    if (_formKey.currentState!.validate()) {
      if (val == 1 && pfProgress.pageOne == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.addLandandwatermgmtTwoScreen);
      }
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.landandwatermgmtScreen);
  }

  goB(BuildContext context) {
    context.read<AddLandandwatermgmtOneBloc>().add(
          GoBackEvent(
            createFailed: () => null,
            createSuccessful: () => goBack(context),
          ),
        );
  }

  goBack(BuildContext context) {
    context.read<AddLandandwatermgmtOneBloc>().add(
          ClearEvent(),
        );

    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.landandwatermgmtScreen);
  }

  addPractice(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddLandandwatermgmtThreeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddLandandwatermgmtOneBloc>().add(
          CheckOneEvent(),
        );
  }

  addSource(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddLandandwatermgmtFourDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddLandandwatermgmtOneBloc>().add(
          CheckTwoEvent(),
        );
  }
}
