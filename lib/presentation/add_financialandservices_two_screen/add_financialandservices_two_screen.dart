import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_financialandservices_eight_dialog/add_financialandservices_eight_dialog.dart';
import 'package:kiamis_app/presentation/add_financialandservices_seven_dialog/add_financialandservices_seven_dialog.dart';

import 'bloc/add_financialandservices_two_bloc.dart';
import 'models/add_financialandservices_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class AddFinancialandservicesTwoScreen extends StatelessWidget {
  AddFinancialandservicesTwoScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesTwoBloc>(
      create: (context) =>
          AddFinancialandservicesTwoBloc(AddFinancialandservicesTwoState(
        addFinancialandservicesTwoModelObj: AddFinancialandservicesTwoModel(),
      ))
            ..add(AddFinancialandservicesTwoInitialEvent()),
      child: AddFinancialandservicesTwoScreen(),
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
              onTap: () => goB(context),
              margin: EdgeInsets.only(
                left: 16.h,
                top: 3.v,
                bottom: 11.v,
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle4(
              text: "msg_financial_and_services2".tr,
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
                              AddFinancialandservicesTwoBloc,
                              AddFinancialandservicesTwoState,
                              AddFinancialandservicesTwoModel?>(
                          selector: (state) =>
                              state.addFinancialandservicesTwoModelObj,
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
                                        .fsProgress!);
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
                      SizedBox(height: 45.v),
                      Text(
                        "msg_do_you_insure_your5".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddFinancialandservicesTwoBloc,
                          AddFinancialandservicesTwoState,
                          AddFinancialandservicesTwoModel?>(
                        selector: (state) =>
                            state.addFinancialandservicesTwoModelObj,
                        builder: (context, addFinancialandservicesTwoModelObj) {
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
                            val: addFinancialandservicesTwoModelObj
                                ?.selectedDropDownValue,
                            items: addFinancialandservicesTwoModelObj
                                    ?.dropdownItemList ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddFinancialandservicesTwoBloc>()
                                  .add(ChangeDropDownEvent(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_do_you_insure_your6".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddFinancialandservicesTwoBloc,
                          AddFinancialandservicesTwoState,
                          AddFinancialandservicesTwoModel?>(
                        selector: (state) =>
                            state.addFinancialandservicesTwoModelObj,
                        builder: (context, addFinancialandservicesTwoModelObj) {
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
                            val: addFinancialandservicesTwoModelObj
                                ?.selectedDropDownValue1,
                            items: addFinancialandservicesTwoModelObj
                                    ?.dropdownItemList1 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddFinancialandservicesTwoBloc>()
                                  .add(ChangeDropDown1Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_do_you_keep_written2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddFinancialandservicesTwoBloc,
                          AddFinancialandservicesTwoState,
                          AddFinancialandservicesTwoModel?>(
                        selector: (state) =>
                            state.addFinancialandservicesTwoModelObj,
                        builder: (context, addFinancialandservicesTwoModelObj) {
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
                            val: addFinancialandservicesTwoModelObj
                                ?.selectedDropDownValue2,
                            items: addFinancialandservicesTwoModelObj
                                    ?.dropdownItemList2 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddFinancialandservicesTwoBloc>()
                                  .add(ChangeDropDown2Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_do_you_insure_your7".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddFinancialandservicesTwoBloc,
                          AddFinancialandservicesTwoState,
                          AddFinancialandservicesTwoModel?>(
                        selector: (state) =>
                            state.addFinancialandservicesTwoModelObj,
                        builder: (context, addFinancialandservicesTwoModelObj) {
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
                            val: addFinancialandservicesTwoModelObj
                                ?.selectedDropDownValue3,
                            items: addFinancialandservicesTwoModelObj
                                    ?.dropdownItemList3 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddFinancialandservicesTwoBloc>()
                                  .add(ChangeDropDown3Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_do_you_insure_your8".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddFinancialandservicesTwoBloc,
                          AddFinancialandservicesTwoState,
                          AddFinancialandservicesTwoModel?>(
                        selector: (state) =>
                            state.addFinancialandservicesTwoModelObj,
                        builder: (context, addFinancialandservicesTwoModelObj) {
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
                            val: addFinancialandservicesTwoModelObj
                                ?.selectedDropDownValue4,
                            items: addFinancialandservicesTwoModelObj
                                    ?.dropdownItemList4 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddFinancialandservicesTwoBloc>()
                                  .add(ChangeDropDown4Event(value: value));
                            },
                          );
                        },
                      ),

                      SizedBox(height: 17.v),
                      Text(
                        "msg_soil_seeds_and".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_extension_access".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddFinancialandservicesTwoBloc,
                          AddFinancialandservicesTwoState,
                          AddFinancialandservicesTwoModel?>(
                        selector: (state) =>
                            state.addFinancialandservicesTwoModelObj,
                        builder: (context, addFinancialandservicesTwoModelObj) {
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
                            val: addFinancialandservicesTwoModelObj
                                ?.selectedDropDownValue5,
                            items: addFinancialandservicesTwoModelObj
                                    ?.dropdownItemList5 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddFinancialandservicesTwoBloc>()
                                  .add(ChangeDropDown5Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 18.v),
                      // Text(
                      //   "msg_if_yes_from_where".tr,
                      //   style: theme.textTheme.titleSmall,
                      // ),
                      // CustomElevatedButton(
                      //   text: "msg_add_extension_access".tr,
                      //   onTap: () => addAccess(context),
                      //   margin: EdgeInsets.only(
                      //     left: 82.h,
                      //     top: 30.v,
                      //   ),
                      //   alignment: Alignment.centerRight,
                      // ),
                      BlocSelector<
                              AddFinancialandservicesTwoBloc,
                              AddFinancialandservicesTwoState,
                              AddFinancialandservicesTwoModel?>(
                          selector: (state) =>
                              state.addFinancialandservicesTwoModelObj,
                          builder: (context, list) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 15.v,
                                right: 16.h,
                              ),
                              child: Visibility(
                                visible: list?.selectedDropDownValue5?.id == 1,
                                child: Column(
                                  children: [
                                    // Container(
                                    //   width: 302.h,
                                    //   margin: EdgeInsets.only(
                                    //     top: 15.v,
                                    //     right: 40.h,
                                    //   ),
                                    //   child: Text(
                                    //     "msg_if_yes_from_where".tr,
                                    //     maxLines: 2,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     style: theme.textTheme.titleSmall,
                                    //   ),
                                    // ),
                                    BlocSelector<
                                            AddFinancialandservicesTwoBloc,
                                            AddFinancialandservicesTwoState,
                                            bool?>(
                                        selector: (state) => state.checkb,
                                        builder: (context, checked) {
                                          return Text(
                                            "msg_if_yes_which_groups_farmer".tr,
                                            style: checked!
                                                ? CustomTextStyles
                                                    .labelMediumPrimary_1red
                                                : CustomTextStyles
                                                    .labelMediumPrimary_1,
                                          );
                                        }),
                                    BlocSelector<
                                            AddFinancialandservicesTwoBloc,
                                            AddFinancialandservicesTwoState,
                                            List<CheckBoxList>?>(
                                        selector: (state) => state.e,
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
                                      text: "msg_add_extension_access".tr,
                                      onTap: () => addAccess(context),
                                      margin: EdgeInsets.only(
                                        left: 82.h,
                                        top: 30.v,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      Container(
                        width: 309.h,
                        margin: EdgeInsets.only(
                          top: 17.v,
                          right: 33.h,
                        ),
                        child: Text(
                          "msg_what_is_the_mode2".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      BlocSelector<
                              AddFinancialandservicesTwoBloc,
                              AddFinancialandservicesTwoState,
                              List<CheckBoxList>?>(
                          selector: (state) => state.m,
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
                        text: "lbl_add_mode".tr,
                        onTap: () => addMode(context),
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 8.v,
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
                              onTap: () => goB(context),
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
                              margin: EdgeInsets.only(left: 1.h),
                              isDisabled: true,
                              buttonStyle: CustomButtonStyles.fillPrimaryTL10,
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
      context.read<AddFinancialandservicesTwoBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.financialandservicesScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddFinancialandservicesTwoBloc>().add(
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

  _navToStep(int val, BuildContext context, FSProgress pfProgress) {
    if (val == 0) {
      Navigator.popAndPushNamed(
          context, AppRoutes.addFinancialandservicesOneScreen);
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.financialandservicesScreen);
  }

  goB(BuildContext context) {
    context.read<AddFinancialandservicesTwoBloc>().add(
          GoBackEvent(
            createFailed: () => null,
            createSuccessful: () => goBack(context),
          ),
        );
  }

  goBack(BuildContext context) {
    if (PrefUtils().getFound()) {
      context.read<AddFinancialandservicesTwoBloc>().add(
            ClearEvent(),
          );
      //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
      Navigator.popAndPushNamed(context, AppRoutes.financialandservicesScreen);
    } else {
      context.read<AddFinancialandservicesTwoBloc>().add(
            ClearEvent(),
          );
      //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
      Navigator.popAndPushNamed(
          context, AppRoutes.addFinancialandservicesOneScreen);
    }
  }

  addAccess(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesSevenDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFinancialandservicesTwoBloc>().add(
          CheckTwoEvent(),
        );
  }

  addMode(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesEightDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFinancialandservicesTwoBloc>().add(
          CheckThreeEvent(),
        );
  }
}
