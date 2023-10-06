import 'package:cupertino_stepper/cupertino_stepper.dart';
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
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class AddLandandwatermgmtOneScreen extends StatelessWidget {
  const AddLandandwatermgmtOneScreen({Key? key})
      : super(
          key: key,
        );

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
            text: "msg_land_and_water_management2".tr,
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
                          AddLandandwatermgmtOneBloc,
                          AddLandandwatermgmtOneState,
                          AddLandandwatermgmtOneModel?>(
                      selector: (state) => state.addLandandwatermgmtOneModelObj,
                      builder: ((context, farmersIdentificationOneModelObj) {
                        return SizedBox(
                          height: 150.v,
                          width: double.infinity,
                          child: _buildStepper(StepperType.horizontal, context,
                              farmersIdentificationOneModelObj),
                        );
                      })),
                  SizedBox(height: 22.v),
                  Text(
                    "msg_aquaculture_type2".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 319.h,
                    margin: EdgeInsets.only(
                      top: 18.v,
                      right: 24.h,
                    ),
                    child: Text(
                      "msg_what_sustainable2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
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
                    selector: (state) => state.addLandandwatermgmtOneModelObj,
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
                        items:
                            addLandandwatermgmtOneModelObj?.dropdownItemList ??
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
                    selector: (state) => state.addLandandwatermgmtOneModelObj,
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
                        items:
                            addLandandwatermgmtOneModelObj?.dropdownItemList1 ??
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
                    selector: (state) => state.addLandandwatermgmtOneModelObj,
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
                        items:
                            addLandandwatermgmtOneModelObj?.dropdownItemList2 ??
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
      AddLandandwatermgmtOneModel? primaryFarmHoldingOneModel) {
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
        AppRoutes.addLandandwatermgmtOneScreen,
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
        AppRoutes.addLandandwatermgmtTwoScreen,
      );
    }
  }

  addPractice(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddLandandwatermgmtThreeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addSource(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddLandandwatermgmtFourDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
