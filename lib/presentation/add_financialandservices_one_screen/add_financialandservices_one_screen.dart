import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:kiamis_app/presentation/add_financialandservices_eight_dialog/add_financialandservices_eight_dialog.dart';
import 'package:kiamis_app/presentation/add_financialandservices_five_screen/add_financialandservices_five_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/add_financialandservices_four_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_seven_dialog/add_financialandservices_seven_dialog.dart';
import 'package:kiamis_app/presentation/add_financialandservices_six_dialog/add_financialandservices_six_dialog.dart';
import 'package:kiamis_app/presentation/add_financialandservices_three_dialog/add_financialandservices_three_dialog.dart';

import 'bloc/add_financialandservices_one_bloc.dart';
import 'models/add_financialandservices_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

class AddFinancialandservicesOneScreen extends StatelessWidget {
  const AddFinancialandservicesOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesOneBloc>(
      create: (context) =>
          AddFinancialandservicesOneBloc(AddFinancialandservicesOneState(
        addFinancialandservicesOneModelObj: AddFinancialandservicesOneModel(),
      ))
            ..add(AddFinancialandservicesOneInitialEvent()),
      child: AddFinancialandservicesOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                          AddFinancialandservicesOneBloc,
                          AddFinancialandservicesOneState,
                          AddFinancialandservicesOneModel?>(
                      selector: (state) =>
                          state.addFinancialandservicesOneModelObj,
                      builder: ((context, farmersIdentificationOneModelObj) {
                        return SizedBox(
                          height: 150.v,
                          width: double.infinity,
                          child: _buildStepper(StepperType.horizontal, context,
                              farmersIdentificationOneModelObj),
                        );
                      })),
                  SizedBox(height: 20.v),
                  Text(
                    "msg_financial_livelihood".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 297.h,
                    margin: EdgeInsets.only(
                      top: 20.v,
                      right: 45.h,
                    ),
                    child: Text(
                      "msg_what_are_your_main4".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_financial_source".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 42.v,
                    ),
                    alignment: Alignment.centerRight,
                    onTap: () => addSource(context),
                  ),
                  Container(
                    width: 306.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 36.h,
                    ),
                    child: Text(
                      "msg_percentage_of_household2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelMediumPrimary_1,
                    ),
                  ),
                  SizedBox(height: 4.v),
                  BlocSelector<AddFinancialandservicesOneBloc,
                      AddFinancialandservicesOneState, TextEditingController?>(
                    selector: (state) => state.selectvalueoneController,
                    builder: (context, selectvalueoneController) {
                      return CustomTextFormField(
                        controller: selectvalueoneController,
                        autofocus: false,
                        focusNode: FocusNode(),
                        hintText: "Percent".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                      );
                    },
                  ),
                  SizedBox(height: 18.v),
                  Text(
                    "msg_cooperative_groups".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 270.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 72.h,
                    ),
                    child: Text(
                      "msg_do_you_belong_to2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelMediumPrimary_1,
                    ),
                  ),
                  SizedBox(height: 3.v),
                  BlocSelector<
                      AddFinancialandservicesOneBloc,
                      AddFinancialandservicesOneState,
                      AddFinancialandservicesOneModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesOneModelObj,
                    builder: (context, addFinancialandservicesOneModelObj) {
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
                        items: addFinancialandservicesOneModelObj
                                ?.dropdownItemList ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesOneBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        },
                      );
                    },
                  ),
                  Container(
                    width: 302.h,
                    margin: EdgeInsets.only(
                      top: 15.v,
                      right: 40.h,
                    ),
                    child: Text(
                      "msg_if_yes_which_groups_farmer".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_cooperative".tr,
                    onTap: () => addCoopGroup(context),
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 34.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_financial_services".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 332.h,
                    margin: EdgeInsets.only(
                      top: 16.v,
                      right: 11.h,
                    ),
                    child: Text(
                      "msg_where_do_you_access".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_financial_services".tr,
                    onTap: () => addFinancial(context),
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 37.v,
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
      AddFinancialandservicesOneModel? primaryFarmHoldingOneModel) {
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
              content: AddFinancialandservicesThreeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addCoopGroup(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesFourScreen.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addFinancial(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesFiveScreen.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
