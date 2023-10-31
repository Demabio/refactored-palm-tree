import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/widgets/enterprises_widget.dart';

import 'bloc/add_farm_holding_two_bloc.dart';
import 'models/add_farm_holding_two_model.dart';
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
class AddFarmHoldingTwoScreen extends StatelessWidget {
  AddFarmHoldingTwoScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmHoldingTwoBloc>(
        create: (context) => AddFarmHoldingTwoBloc(AddFarmHoldingTwoState(
            addFarmHoldingTwoModelObj: AddFarmHoldingTwoModel()))
          ..add(AddFarmHoldingTwoInitialEvent()),
        child: AddFarmHoldingTwoScreen());
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
                  leadingWidth: 60.h,
                  leading: AppbarImage(
                      svgPath: ImageConstant.imgSort,
                      margin:
                          EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                      onTap: () {
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_add_farm_holding".tr),
                  styleType: Style.bgFill),
              body: Form(
                key: _formKey,
                child: SizedBox(
                    width: mediaQueryData.size.width,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 5.v),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, bottom: 5.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocSelector<
                                          AddFarmHoldingTwoBloc,
                                          AddFarmHoldingTwoState,
                                          AddFarmHoldingTwoModel?>(
                                      selector: (state) =>
                                          state.addFarmHoldingTwoModelObj,
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
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 14.h, top: 15.v),
                                      child: Text("msg_farm_enterprises".tr,
                                          style: CustomTextStyles
                                              .titleMediumSemiBold)),
                                  SizedBox(height: 54.v),
                                  Text("msg_legal_status_of2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          AddFarmHoldingTwoBloc,
                                          AddFarmHoldingTwoState,
                                          AddFarmHoldingTwoModel?>(
                                      selector: (state) =>
                                          state.addFarmHoldingTwoModelObj,
                                      builder:
                                          (context, addFarmHoldingTwoModelObj) {
                                        return CustomDropDown(
                                            icon: Container(
                                                margin:
                                                    EdgeInsets.only(left: 30.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.h)),
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
                                            val: addFarmHoldingTwoModelObj
                                                ?.selectedDropDownValue,
                                            items: addFarmHoldingTwoModelObj
                                                    ?.dropdownItemList ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddFarmHoldingTwoBloc>()
                                                  .add(ChangeDropDownEvent(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(height: 25.v),
                                  Text("msg_lr_no_certificate_lease2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<
                                          AddFarmHoldingTwoBloc,
                                          AddFarmHoldingTwoState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.titlethreeController,
                                      builder: (context, titlethreeController) {
                                        return CustomTextFormField(
                                            autofocus: false,
                                            focusNode: node1,
                                            controller: titlethreeController,
                                            hintText: "lbl_info".tr,
                                            textInputAction:
                                                TextInputAction.done);
                                      }),
                                  SizedBox(height: 25.v),
                                  BlocSelector<AddFarmHoldingTwoBloc,
                                          AddFarmHoldingTwoState, bool?>(
                                      selector: (state) => state.checked,
                                      builder: (context, checked) {
                                        return Container(
                                          width: 266.h,
                                          margin: EdgeInsets.only(
                                              left: 14.h,
                                              top: 13.v,
                                              right: 60.h),
                                          child: Text(
                                            "msg_what_enterprises".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: checked!
                                                ? CustomTextStyles
                                                    .labelMediumPrimary_1red
                                                : CustomTextStyles
                                                    .labelMediumPrimary_1,
                                          ),
                                        );
                                      }),
                                  BlocSelector<
                                      AddFarmHoldingTwoBloc,
                                      AddFarmHoldingTwoState,
                                      AddFarmHoldingTwoModel?>(
                                    selector: (state) =>
                                        state.addFarmHoldingTwoModelObj,
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
                                                        AddFarmHoldingTwoBloc>()
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
                                  SizedBox(height: 16.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: CustomOutlinedButton(
                                                text: "lbl_back".tr,
                                                margin:
                                                    EdgeInsets.only(right: 1.h),
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
                                                margin:
                                                    EdgeInsets.only(left: 1.h),
                                                buttonStyle: CustomButtonStyles
                                                    .fillPrimaryTL10))
                                      ]),
                                  SizedBox(height: 12.v),
                                  CustomElevatedButton(
                                      text: "lbl_save".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(right: 10.h),
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
      context.read<AddFarmHoldingTwoBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.addFarmHoldingScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong, Kindly confirm all fields are filled.")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddFarmHoldingTwoBloc>().add(
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
      Navigator.popAndPushNamed(context, AppRoutes.addFarmHoldingOneScreen);
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addFarmHoldingScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addFarmHoldingOneScreen);
  }

  /// Navigates to the addFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addFarmHoldingOneScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addFarmHoldingOneScreen,
    );
  }

  /// Navigates to the addFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addFarmHoldingOneScreen.
  onTapBack(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addFarmHoldingOneScreen,
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
