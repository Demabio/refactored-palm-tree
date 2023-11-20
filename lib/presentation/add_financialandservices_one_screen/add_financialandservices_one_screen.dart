import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_financialandservices_five_screen/add_financialandservices_five_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/add_financialandservices_four_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/widgets/coop_widget.dart';
import 'package:kiamis_app/presentation/add_financialandservices_six_dialog/add_financialandservices_six_dialog.dart';

import 'package:kiamis_app/presentation/add_financialandservices_three_dialog/add_financialandservices_three_dialog.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';
import 'package:kiamis_app/presentation/financialandservices_screen/widgets/inputs_widget.dart';

import 'bloc/add_financialandservices_one_bloc.dart';
import 'models/add_financialandservices_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
              text: "msg_financial_and_services2".tr,
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
                              stepRadius: DeviceExt((25 / 841) * 100).h,
                              disableScroll: true,
                              showStepBorder: true,
                              alignment: Alignment.center,
                              steps: [
                                EasyStep(
                                  customStep: CircleAvatar(
                                    radius: DeviceExt((35 / 841) * 100).h,
                                    backgroundColor: theme.colorScheme.primary,
                                    child: CircleAvatar(
                                      radius: DeviceExt((25 / 841) * 100).h,
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
                                                fontSize: DeviceExt(1.8).h,
                                              ),
                                            )
                                          : Icon(
                                              Icons.check,
                                              size: DeviceExt(5).h,
                                            ),
                                    ),
                                  ),
                                  customTitle: Text("Step 1".tr,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .titleMediumBlack90018),
                                ),
                                EasyStep(
                                  customStep: CircleAvatar(
                                    radius: DeviceExt((35 / 841) * 100).h,
                                    backgroundColor: theme.colorScheme.primary,
                                    child: CircleAvatar(
                                      radius: DeviceExt((25 / 841) * 100).h,
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
                                                fontSize: DeviceExt(1.8).h,
                                              ),
                                            )
                                          : Icon(
                                              Icons.check,
                                              size: DeviceExt(5).h,
                                            ),
                                    ),
                                  ),

                                  customTitle: Text("Step 2".tr,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .titleMediumBlack90018),
                                  //topTitle: true,
                                ),
                              ],
                            );
                          })),
                      SizedBox(height: DeviceExt((20 / 411) * 100).w),
                      Text(
                        "msg_financial_livelihood".tr,
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: theme.colorScheme.primary,
                          fontSize: DeviceExt(2).h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: DeviceExt((297 / 841) * 100).h,
                        margin: EdgeInsets.only(
                          top: DeviceExt((20 / 411) * 100).w,
                          right: DeviceExt((45 / 841) * 100).h,
                        ),
                        child: BlocSelector<AddFinancialandservicesOneBloc,
                                AddFinancialandservicesOneState, bool?>(
                            selector: (state) => state.checki,
                            builder: (context, checked) {
                              return Text(
                                "msg_what_are_your_main4".tr,
                                style: checked!
                                    ? CustomTextStyles.labelMediumPrimary_1red
                                    : CustomTextStyles.labelMediumPrimary_1,
                              );
                            }),
                      ),
                      BlocSelector<
                              AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState,
                              List<CheckBoxList>?>(
                          selector: (state) => state.i,
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

                                    return IncomesWidget(
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
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((42 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                        onTap: () => addSource(context),
                      ),
                      Container(
                        width: DeviceExt((306 / 841) * 100).h,
                        margin: EdgeInsets.only(
                          top: DeviceExt((17 / 411) * 100).w,
                          right: DeviceExt((36 / 841) * 100).h,
                        ),
                        child: Text(
                          "msg_percentage_of_household2".tr,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                      ),
                      SizedBox(height: DeviceExt((18 / 411) * 100).w),
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
                              } else if (!ispercent(value, isRequired: true)) {
                                return "Value must be between 0% and 100%";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.number,
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((18 / 411) * 100).w),
                      Text(
                        "msg_agricultural_info".tr,
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: theme.colorScheme.primary,
                          fontSize: DeviceExt(2).h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      BlocSelector<AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState, bool?>(
                          selector: (state) => state.checkp,
                          builder: (context, checked) {
                            return Text(
                              "What are your main sources of information on good agricultural practices (GAP)?(*)",
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      BlocSelector<
                              AddFinancialandservicesOneBloc,
                              AddFinancialandservicesOneState,
                              List<CheckBoxList>?>(
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
                        text: "Add Information Source".tr,
                        onTap: () => addInfoSource(context),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((9 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((18 / 411) * 100).w),

                      Text(
                        "msg_cooperative_groups".tr,
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: theme.colorScheme.primary,
                          fontSize: DeviceExt(2).h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: DeviceExt((270 / 841) * 100).h,
                        margin: EdgeInsets.only(
                          top: DeviceExt((17 / 411) * 100).w,
                          right: DeviceExt((72 / 841) * 100).h,
                        ),
                        child: Text(
                          "msg_do_you_belong_to2".tr,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                      ),
                      SizedBox(height: DeviceExt((3 / 411) * 100).w),
                      BlocSelector<
                          AddFinancialandservicesOneBloc,
                          AddFinancialandservicesOneState,
                          AddFinancialandservicesOneModel?>(
                        selector: (state) =>
                            state.addFinancialandservicesOneModelObj,
                        builder: (context, addFinancialandservicesOneModelObj) {
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
                                top: DeviceExt((15 / 411) * 100).w,
                                right: DeviceExt((16 / 841) * 100).h,
                              ),
                              child: Visibility(
                                visible: list?.selectedDropDownValue?.id == 1,
                                child: Column(
                                  children: [
                                    // Container(
                                    //   width: DeviceExt((302/841)*100).h,
                                    //   margin: EdgeInsets.only(
                                    //     top: DeviceExt(( 15/411)*100).w,
                                    //     right: DeviceExt((40/841)*100).h,
                                    //   ),
                                    //   child: Text(
                                    //     "msg_if_yes_which_groups_farmer".tr,
                                    //     maxLines: 10,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     style: CustomTextStyles.labelMediumPrimary_1,
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
                                        left: DeviceExt((82 / 841) * 100).h,
                                        top: DeviceExt((34 / 411) * 100).w,
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
                      //   width: DeviceExt((332/841)*100).h,
                      //   margin: EdgeInsets.only(
                      //     top: DeviceExt(( 16/411)*100).w,
                      //     right: DeviceExt((11/841)*100).h,
                      //   ),
                      //   child: Text(
                      //     "msg_where_do_you_access".tr,
                      //     maxLines: 10,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: CustomTextStyles.labelMediumPrimary_1,
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
                        text: "msg_add_financial_services".tr,
                        onTap: () => addFinancial(context),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((37 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((18 / 411) * 100).w),
                      CustomElevatedButton(
                        text: "lbl_next".tr,
                        onTap: () => nextPage(context),
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

  goB(BuildContext context) {
    context.read<AddFinancialandservicesOneBloc>().add(
          GoBackEvent(
            createFailed: () => null,
            createSuccessful: () => goBack(context),
          ),
        );
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

  addInfoSource(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFinancialandservicesSixDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFinancialandservicesOneBloc>().add(
          CheckFourEvent(),
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
