import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_financialandservices_eight_dialog/add_financialandservices_eight_dialog.dart';
import 'package:kiamis_app/presentation/add_financialandservices_five_screen/add_financialandservices_five_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/add_financialandservices_four_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/widgets/coop_widget.dart';
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

// ignore: must_be_immutable
class AddFinancialandservicesOneScreen extends StatelessWidget {
  AddFinancialandservicesOneScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                              AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState,
                              AddFinancialandservicesOneModel?>(
                          selector: (state) =>
                              state.addFinancialandservicesOneModelObj,
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
                      BlocSelector<
                              AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState,
                              List<CheckBoxList>?>(
                          selector: (state) => state.i,
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
                      BlocSelector<
                          AddFinancialandservicesOneBloc,
                          AddFinancialandservicesOneState,
                          TextEditingController?>(
                        selector: (state) => state.selectvalueoneController,
                        builder: (context, selectvalueoneController) {
                          return CustomTextFormField(
                            controller: selectvalueoneController,
                            autofocus: false,
                            focusNode: FocusNode(),
                            hintText: "Percent".tr,
                            validator: (value) {
                              if (!isNumeric(value, isRequired: true)) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
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
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addFinancialandservicesOneModelObj
                                ?.selectedDropDownValue,
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
                      BlocSelector<
                              AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState,
                              AddFinancialandservicesOneModel?>(
                          selector: (state) =>
                              state.addFinancialandservicesOneModelObj,
                          builder: (context, list) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 15.v,
                                right: 16.h,
                              ),
                              child: Visibility(
                                visible: list?.selectedDropDownValue?.id == 1,
                                child: Column(
                                  children: [
                                    // Container(
                                    //   width: 302.h,
                                    //   margin: EdgeInsets.only(
                                    //     top: 15.v,
                                    //     right: 40.h,
                                    //   ),
                                    //   child: Text(
                                    //     "msg_if_yes_which_groups_farmer".tr,
                                    //     maxLines: 2,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     style: theme.textTheme.titleSmall,
                                    //   ),
                                    // ),
                                    BlocSelector<
                                            AddFinancialandservicesOneBloc,
                                            AddFinancialandservicesOneState,
                                            bool?>(
                                        selector: (state) => state.checka,
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
                                            AddFinancialandservicesOneBloc,
                                            AddFinancialandservicesOneState,
                                            List<CheckBoxList>?>(
                                        selector: (state) => state.c,
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

                                                  return CoopItemWidget(
                                                    model,
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }),
                                    CustomElevatedButton(
                                      text: "msg_add_cooperative".tr,
                                      onTap: () => addCoopGroup(context),
                                      margin: EdgeInsets.only(
                                        left: 82.h,
                                        top: 34.v,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      BlocSelector<AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState, bool?>(
                          selector: (state) => state.checkb,
                          builder: (context, checked) {
                            return Text(
                              "msg_where_do_you_access".tr,
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      // Container(
                      //   width: 332.h,
                      //   margin: EdgeInsets.only(
                      //     top: 16.v,
                      //     right: 11.h,
                      //   ),
                      //   child: Text(
                      //     "msg_where_do_you_access".tr,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: theme.textTheme.titleSmall,
                      //   ),
                      // ),

                      BlocSelector<
                              AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState,
                              List<CheckBoxList>?>(
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
      context.read<AddFinancialandservicesOneBloc>().add(
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
    NavigatorService.popAndPushNamed(
        AppRoutes.addFinancialandservicesTwoScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddFinancialandservicesOneBloc>().add(
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
    if (_formKey.currentState!.validate()) {
      if (val == 1 && pfProgress.pageOne == 1) {
        Navigator.popAndPushNamed(
            context, AppRoutes.addFinancialandservicesTwoScreen);
      }
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.financialandservicesScreen);
  }

  goBack(BuildContext context) {
    context.read<AddFinancialandservicesOneBloc>().add(
          ClearEvent(),
        );
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.financialandservicesScreen);
  }

  addSource(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesThreeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFinancialandservicesOneBloc>().add(
          CheckOneEvent(),
        );
  }

  addCoopGroup(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesFourScreen.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFinancialandservicesOneBloc>().add(
          CheckTwoEvent(),
        );
  }

  addFinancial(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesFiveScreen.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFinancialandservicesOneBloc>().add(
          CheckThreeEvent(),
        );
  }
}
