import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/add_aquaculture_six_dialog.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';

import '../add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'bloc/add_aquaculture_two_bloc.dart';
import 'models/add_aquaculture_two_model.dart';
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
class AddAquacultureTwoScreen extends StatelessWidget {
  AddAquacultureTwoScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureTwoBloc>(
      create: (context) => AddAquacultureTwoBloc(AddAquacultureTwoState(
        addAquacultureTwoModelObj: AddAquacultureTwoModel(),
      ))
        ..add(AddAquacultureTwoInitialEvent()),
      child: AddAquacultureTwoScreen(),
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
              onTap: () => goBack(context),
              svgPath: ImageConstant.imgSort,
              margin: EdgeInsets.only(
                left: 16.h,
                top: 3.v,
                bottom: 11.v,
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle1(
              text: "lbl_aquaculture2".tr,
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
                      BlocSelector<AddAquacultureTwoBloc,
                              AddAquacultureTwoState, AddAquacultureTwoModel?>(
                          selector: (state) => state.addAquacultureTwoModelObj,
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
                                        .aqProgress!);
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
                      BlocSelector<AddAquacultureTwoBloc,
                              AddAquacultureTwoState, bool?>(
                          selector: (state) => state.checked,
                          builder: (context, checked) {
                            return Text(
                              "msg_what_are_your_main3".tr,
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      BlocSelector<AddAquacultureTwoBloc,
                              AddAquacultureTwoState, List<CheckBoxList>?>(
                          selector: (state) => state.inputs,
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
                        text: "lbl_add_main_inputs".tr,
                        onTap: () => addMainInputs(context),
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 106.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_do_you_utilize_fertilizers2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddAquacultureTwoBloc,
                          AddAquacultureTwoState, AddAquacultureTwoModel?>(
                        selector: (state) => state.addAquacultureTwoModelObj,
                        builder: (context, addAquacultureTwoModelObj) {
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
                              }
                            },
                            val: addAquacultureTwoModelObj
                                ?.selectedDropDownValue,
                            items:
                                addAquacultureTwoModelObj?.dropdownItemList ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddAquacultureTwoBloc>()
                                  .add(ChangeDropDownEvent(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_which_is_your_production2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddAquacultureTwoBloc,
                          AddAquacultureTwoState, AddAquacultureTwoModel?>(
                        selector: (state) => state.addAquacultureTwoModelObj,
                        builder: (context, addAquacultureTwoModelObj) {
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
                              }
                            },
                            val: addAquacultureTwoModelObj
                                ?.selectedDropDownValue1,
                            items:
                                addAquacultureTwoModelObj?.dropdownItemList1 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddAquacultureTwoBloc>()
                                  .add(ChangeDropDown1Event(value: value));
                            },
                          );
                        },
                      ),
                      Container(
                        width: 321.h,
                        margin: EdgeInsets.only(
                          top: 17.v,
                          right: 21.h,
                        ),
                        child: Text(
                          "Have you benefited from Economic Stimulus Programme(ESP)? (*)"
                              .tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                      ),
                      SizedBox(height: 4.v),
                      BlocSelector<AddAquacultureTwoBloc,
                          AddAquacultureTwoState, AddAquacultureTwoModel?>(
                        selector: (state) => state.addAquacultureTwoModelObj,
                        builder: (context, addAquacultureTwoModelObj) {
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
                            val: addAquacultureTwoModelObj
                                ?.selectedDropDownValue2,
                            items:
                                addAquacultureTwoModelObj?.dropdownItemList2 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddAquacultureTwoBloc>()
                                  .add(ChangeDropDown2Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 18.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              onTap: () => goBack(context),
                              margin: EdgeInsets.only(right: 1.h),
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
                              margin: EdgeInsets.only(left: 1.h),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.v),
                      CustomElevatedButton(
                        onTap: () => saveDraft(context),
                        text: "lbl_save".tr,
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
      context.read<AddAquacultureTwoBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.aquacultureScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong, Kindly confirm all fields are filled.")));
  }

  saveDraft(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<AddAquacultureTwoBloc>().add(
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

  _navToStep(int val, BuildContext context, AQProgress pfProgress) {
    if (val == 0 && pfProgress.pageOne == 1) {
      Navigator.popAndPushNamed(context, AppRoutes.addAquacultureOneScreen);
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.aquacultureScreen);
  }

  goBack(BuildContext context) {
    context.read<AddAquacultureTwoBloc>().add(
          ClearEvent(),
        );
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addAquacultureOneScreen);
  }

  addMainInputs(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddAquacultureSixDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddAquacultureTwoBloc>().add(
          CheckThreeEvent(),
        );
  }
}
