import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_four_dialog/add_landandwatermgmt_four_dialog.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_three_dialog/add_landandwatermgmt_three_dialog.dart';

import 'bloc/add_landandwatermgmt_one_bloc.dart';
import 'models/add_landandwatermgmt_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

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
            leadingWidth: 60.h,
            leading: AppbarImage(
              svgPath: ImageConstant.imgSort,
              onTap: () => goBack(context),
              margin: EdgeInsets.only(
                left: 16.h,
                top: 3.v,
                bottom: 11.v,
              ),
            ),
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
                padding: EdgeInsets.only(top: 5.v),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    right: 16.h,
                    bottom: 5.v,
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
                      SizedBox(height: 22.v),
                      // Container(
                      //   width: 319.h,
                      //   margin: EdgeInsets.only(
                      //     top: 18.v,
                      //     right: 24.h,
                      //   ),
                      //   child: Text(
                      //     "msg_what_sustainable2".tr,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: theme.textTheme.titleSmall,
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
                                top: 15.v,
                                right: 16.h,
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
                          left: 82.h,
                          top: 41.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 17.v),
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
                              margin: EdgeInsets.only(left: 30.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.h,
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
                      SizedBox(height: 17.v),
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
                              margin: EdgeInsets.only(left: 30.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.h,
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
                      SizedBox(height: 17.v),
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
                              margin: EdgeInsets.only(left: 30.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.h,
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
                        width: 315.h,
                        margin: EdgeInsets.only(
                          top: 17.v,
                          right: 27.h,
                        ),
                        child: Text(
                          "msg_what_is_the_main2".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      BlocSelector<AddLandandwatermgmtOneBloc,
                              AddLandandwatermgmtOneState, List<CheckBoxList>?>(
                          selector: (state) => state.s,
                          builder: (context, list) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 15.v,
                                right: 16.h,
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
                          left: 82.h,
                          top: 67.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 18.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              margin: EdgeInsets.only(right: 1.h),
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargePrimary_1,
                            ),
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              text: "lbl_next".tr,
                              onTap: () => nextPage(context),
                              margin: EdgeInsets.only(left: 1.h),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.v),
                      CustomElevatedButton(
                        text: "lbl_save".tr,
                        onTap: () => saveDraft(context),
                        leftIcon: Container(
                          margin: EdgeInsets.only(right: 10.h),
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

  saveDraft(BuildContext context) {
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
