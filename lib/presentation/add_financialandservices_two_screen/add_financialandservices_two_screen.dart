import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:kiamis_app/presentation/add_financialandservices_eight_dialog/add_financialandservices_eight_dialog.dart';
import 'package:kiamis_app/presentation/add_financialandservices_seven_dialog/add_financialandservices_seven_dialog.dart';
import 'package:kiamis_app/presentation/add_financialandservices_six_dialog/add_financialandservices_six_dialog.dart';

import 'bloc/add_financialandservices_two_bloc.dart';
import 'models/add_financialandservices_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class AddFinancialandservicesTwoScreen extends StatelessWidget {
  const AddFinancialandservicesTwoScreen({Key? key})
      : super(
          key: key,
        );

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

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leadingWidth: 60.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgSort,
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
        body: SizedBox(
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
                      builder: ((context, farmersIdentificationOneModelObj) {
                        return SizedBox(
                          height: 150.v,
                          width: double.infinity,
                          child: _buildStepper(StepperType.horizontal, context,
                              farmersIdentificationOneModelObj),
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
                  SizedBox(height: 18.v),
                  Text(
                    "msg_agricultural_info".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 255.h,
                    margin: EdgeInsets.only(
                      top: 16.v,
                      right: 87.h,
                    ),
                    child: Text(
                      "If Yes, What are your main source of information on good agricultural practices (GAP) ?"
                          .tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "Add Source".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 9.v,
                    ),
                    alignment: Alignment.centerRight,
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
                  Text(
                    "msg_if_yes_from_where".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  CustomElevatedButton(
                    text: "msg_add_extension_access".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 30.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
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
                  CustomElevatedButton(
                    text: "lbl_add_mode".tr,
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
                          margin: EdgeInsets.only(right: 1.h),
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                          buttonTextStyle: CustomTextStyles.bodyLargePrimary_1,
                        ),
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                          text: "lbl_next".tr,
                          margin: EdgeInsets.only(left: 1.h),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.v),
                  CustomElevatedButton(
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
    );
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context,
      AddFinancialandservicesTwoModel? primaryFarmHoldingOneModel) {
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
        AppRoutes.addFinancialandservicesOneScreen,
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
        AppRoutes.addFinancialandservicesTwoScreen,
      );
    }
  }

  addSource(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesSixDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addAccess(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesSevenDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addMode(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesEightDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
