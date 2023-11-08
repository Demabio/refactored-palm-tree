import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/progress_dialog_utils.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/add_aquaculture_five_dialog.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/widgets/fish_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_four_dialog/add_aquaculture_four_dialog.dart';
import 'package:kiamis_app/presentation/add_aquaculture_four_dialog/widgets/ProdSys_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/add_aquaculture_three_dialog.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/widgets/aqua_types_widget.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';

import 'bloc/add_aquaculture_one_bloc.dart';
import 'models/add_aquaculture_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AddAquacultureOneScreen extends StatelessWidget {
  const AddAquacultureOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureOneBloc>(
      create: (context) => AddAquacultureOneBloc(AddAquacultureOneState(
        addAquacultureOneModelObj: AddAquacultureOneModel(),
      ))
        ..add(AddAquacultureOneInitialEvent()),
      child: AddAquacultureOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AddAquacultureOneBloc, AddAquacultureOneState>(
      builder: (context, state) {
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
                title: AppbarSubtitle1(
                  text: "lbl_aquaculture2".tr,
                ),
                styleType: Style.bgFill,
              ),
              body: SizedBox(
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
                                AddAquacultureOneBloc,
                                AddAquacultureOneState,
                                AddAquacultureOneModel?>(
                            selector: (state) =>
                                state.addAquacultureOneModelObj,
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
                                      backgroundColor:
                                          theme.colorScheme.primary,
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
                                      backgroundColor:
                                          theme.colorScheme.primary,
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
                        Text(
                          "msg_aquaculture_type2".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        BlocSelector<AddAquacultureOneBloc,
                                AddAquacultureOneState, bool?>(
                            selector: (state) => state.checkedA,
                            builder: (context, checked) {
                              return Text(
                                "msg_what_types_of_aquaculture2".tr,
                                style: checked!
                                    ? CustomTextStyles.labelMediumPrimary_1red
                                    : CustomTextStyles.labelMediumPrimary_1,
                              );
                            }),
                        SizedBox(height: DeviceExt((18 / 411) * 100).w),

                        BlocSelector<AddAquacultureOneBloc,
                                AddAquacultureOneState, List<CheckBoxList>?>(
                            selector: (state) => state.aquatypes,
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

                                      return AquaTypeItemWidget(
                                        model,
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                        CustomElevatedButton(
                          text: "msg_add_aquaculture".tr,
                          onTap: () {
                            addAquaculturetype(context);
                          },
                          margin: EdgeInsets.only(
                            left: DeviceExt((82 / 841) * 100).h,
                            top: DeviceExt((65 / 411) * 100).w,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: DeviceExt((17 / 411) * 100).w),
                        // Text(
                        //   "msg_production_system3".tr,
                        //   style: CustomTextStyles.labelMediumPrimary_1,
                        // ),
                        BlocSelector<AddAquacultureOneBloc,
                                AddAquacultureOneState, bool?>(
                            selector: (state) => state.checkedP,
                            builder: (context, checked) {
                              return Text(
                                "msg_production_system3".tr,
                                style: checked!
                                    ? CustomTextStyles.labelMediumPrimary_1red
                                    : CustomTextStyles.labelMediumPrimary_1,
                              );
                            }),
                        SizedBox(height: DeviceExt((18 / 411) * 100).w),
                        BlocSelector<AddAquacultureOneBloc,
                                AddAquacultureOneState, List<CheckBoxList>?>(
                            selector: (state) => state.prodsyss,
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

                                      return ProdSysItemWidget(
                                        edit: () => addorEdit(
                                          context,
                                          1,
                                          int.parse(model.var5!),
                                        ),
                                        delete: () => delete(
                                            context, int.parse(model.var5!)),
                                        model,
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                        CustomElevatedButton(
                          text: "msg_add_production_system".tr,
                          onTap: () {
                            addorEdit(
                              context,
                              0,
                              0,
                            );
                          },
                          margin: EdgeInsets.only(
                            left: DeviceExt((82 / 841) * 100).h,
                            top: DeviceExt((30 / 411) * 100).w,
                          ),
                          alignment: Alignment.centerRight,
                        ),

                        BlocSelector<AddAquacultureOneBloc,
                                AddAquacultureOneState, bool?>(
                            selector: (state) => state.checkedF,
                            builder: (context, checked) {
                              return Container(
                                width: DeviceExt((316 / 841) * 100).h,
                                margin: EdgeInsets.only(
                                  top: DeviceExt((17 / 411) * 100).w,
                                  right: DeviceExt((26 / 841) * 100).h,
                                ),
                                child: Text(
                                  "msg_does_the_household2".tr,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: checked!
                                      ? CustomTextStyles.labelMediumPrimary_1red
                                      : CustomTextStyles.labelMediumPrimary_1,
                                ),
                              );
                            }),
                        SizedBox(height: DeviceExt((18 / 411) * 100).w),
                        BlocSelector<AddAquacultureOneBloc,
                                AddAquacultureOneState, List<CheckBoxList>?>(
                            selector: (state) => state.fish,
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

                                      return FishtemWidget(
                                        model,
                                        edit: () => addorEditF(
                                          context,
                                          1,
                                          int.parse(model.var4!),
                                        ),
                                        delete: () => deleteF(
                                            context, int.parse(model.var4!)),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                        CustomElevatedButton(
                          text: "msg_add_aquatic_species".tr,
                          onTap: () {
                            addorEditF(
                              context,
                              0,
                              0,
                            );
                          },
                          margin: EdgeInsets.only(
                            left: DeviceExt((82 / 841) * 100).h,
                            top: DeviceExt((41 / 411) * 100).w,
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
        );
      },
    );
  }

  addorEdit(BuildContext context, int id, int crop) {
    context.read<AddAquacultureOneBloc>().add(
          AddEditEvent(
            value: id,
            crop: crop,
            createSuccessful: () {
              addProductionType(context);
            },
            createFailed: () {
              addProductionType(context);
            },
          ),
        );
  }

  delete(BuildContext context, int id) async {
    String label = "Delete Production System Entry";
    String body = "Are you sure you want to perform this action?";

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
    context.read<AddAquacultureOneBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
  }

  addorEditF(BuildContext context, int id, int crop) {
    context.read<AddAquacultureOneBloc>().add(
          FAddEditEvent(
            value: id,
            crop: crop,
            createSuccessful: () {
              addAquaculturespecies(context);
            },
            createFailed: () {
              addAquaculturespecies(context);
            },
          ),
        );
  }

  deleteF(BuildContext context, int id) async {
    String label = "Delete Fish Entry";
    String body = "Are you sure you want to perform this action?";

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
    context.read<AddAquacultureOneBloc>().add(
          FDeleteEvent(
            value: id,
          ),
        );
  }

  nextPage(BuildContext context) {
    ProgressDialogUtils.showProgressDialog();

    context.read<AddAquacultureOneBloc>().add(
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

  _success(BuildContext context) {
    ProgressDialogUtils.hideProgressDialog();

    NavigatorService.popAndPushNamed(AppRoutes.addAquacultureTwoScreen);
  }

  void _failed(BuildContext context) {
    ProgressDialogUtils.hideProgressDialog();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }

  saveDraft(BuildContext context) async {
    ProgressDialogUtils.showProgressDialog();

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
    context.read<AddAquacultureOneBloc>().add(
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

  _navToStep(int val, BuildContext context, AQProgress pfProgress) {
    if (val == 1 && pfProgress.pageOne == 1) {
      Navigator.popAndPushNamed(context, AppRoutes.addAquacultureTwoScreen);
    }
  }

  _successSaved(BuildContext context) {
    ProgressDialogUtils.hideProgressDialog();

    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.aquacultureScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    context.read<AddAquacultureOneBloc>().add(
          ClearEvent(),
        );
    Navigator.popAndPushNamed(context, AppRoutes.aquacultureScreen);
  }

  goB(BuildContext context) {
    context.read<AddAquacultureOneBloc>().add(
          GoBackEvent(
            createFailed: () => null,
            createSuccessful: () => goBack(context),
          ),
        );
  }

  addAquaculturespecies(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddAquacultureFiveDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));

    context.read<AddAquacultureOneBloc>().add(
          CheckThreeEvent(),
        );
  }

  addAquaculturetype(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddAquacultureThreeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddAquacultureOneBloc>().add(
          CheckOneEvent(),
        );
  }

  addProductionType(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddAquacultureFourDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));

    context.read<AddAquacultureOneBloc>().add(
          CheckTwoEvent(),
        );
  }
}
