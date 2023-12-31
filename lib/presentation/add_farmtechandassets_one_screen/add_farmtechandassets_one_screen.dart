import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_five_dialog/add_farmtechandassets_five_dialog.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_four_dialog/add_farmtechandassets_four_dialog.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_three_dialog/add_farmtechandassets_three_dialog.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_three_dialog/widgets/techassets_widget.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_two_dialog/add_farmtechandassets_two_dialog.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';

import 'bloc/add_farmtechandassets_one_bloc.dart';
import 'models/add_farmtechandassets_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AddFarmtechandassetsOneScreen extends StatelessWidget {
  AddFarmtechandassetsOneScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmtechandassetsOneBloc>(
      create: (context) =>
          AddFarmtechandassetsOneBloc(AddFarmtechandassetsOneState(
        addFarmtechandassetsOneModelObj: AddFarmtechandassetsOneModel(),
      ))
            ..add(AddFarmtechandassetsOneInitialEvent()),
      child: AddFarmtechandassetsOneScreen(),
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
        maintainBottomViewPadding: true,
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
              text: "msg_farm_technology3".tr,
            ),
            styleType: Style.bgFill,
          ),
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: DeviceExt((8 / 411) * 100).w),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: DeviceExt((16 / 841) * 100).h,
                    right: DeviceExt((16 / 841) * 100).h,
                    bottom: DeviceExt((5 / 411) * 100).w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocSelector<AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState, bool?>(
                          selector: (state) => state.checkedP,
                          builder: (context, checked) {
                            return Text(
                              "msg_source_of_power2".tr,
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      // Text(
                      //   "msg_source_of_power2".tr,
                      //   style: CustomTextStyles.labelMediumPrimary_1,
                      // ),
                      BlocSelector<
                              AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState,
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
                      SizedBox(height: DeviceExt((20 / 411) * 100).w),
                      CustomElevatedButton(
                        text: "msg_add_powersource".tr,
                        onTap: () => addPowerSource(context),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((33 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((33 / 411) * 100).w),
                      BlocSelector<AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState, bool?>(
                          selector: (state) => state.checkedL,
                          builder: (context, checked) {
                            return Text(
                              "lbl_labour_source2".tr,
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      BlocSelector<
                              AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState,
                              List<CheckBoxList>?>(
                          selector: (state) => state.l,
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
                      SizedBox(height: DeviceExt((20 / 411) * 100).w),
                      CustomElevatedButton(
                        text: "Add Laboursource".tr,
                        onTap: () => addLabourSource(context),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((33 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((33 / 411) * 100).w),
                      BlocSelector<AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState, bool?>(
                          selector: (state) => state.checkedA,
                          builder: (context, checked) {
                            return Text(
                              "msg_farmer_machinery2".tr,
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      // Text(
                      //   "msg_farmer_machinery2".tr,
                      //   style: CustomTextStyles.labelMediumPrimary_1,
                      // ),
                      BlocSelector<
                              AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState,
                              List<CheckBoxList>?>(
                          selector: (state) => state.a,
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

                                    return TechtemWidget(
                                      model,
                                      edit: () => addorEdit(
                                        context,
                                        1,
                                        int.parse(model.var1!),
                                      ),
                                      delete: () => delete(
                                          context, int.parse(model.var1!)),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                      CustomElevatedButton(
                        text: "msg_add_farmer_marchinery".tr,
                        onTap: () => addorEdit(
                          context,
                          0,
                          0,
                        ),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((33 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((33 / 411) * 100).w),
                      Text(
                        "msg_who_owns_most_of2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<
                          AddFarmtechandassetsOneBloc,
                          AddFarmtechandassetsOneState,
                          AddFarmtechandassetsOneModel?>(
                        selector: (state) =>
                            state.addFarmtechandassetsOneModelObj,
                        builder: (context, addFarmtechandassetsOneModelObj) {
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
                            val: addFarmtechandassetsOneModelObj
                                ?.selectedDropDownValue1,
                            items: addFarmtechandassetsOneModelObj
                                    ?.dropdownItemList1 ??
                                [],
                            onChanged: (value) {
                              context
                                  .read<AddFarmtechandassetsOneBloc>()
                                  .add(ChangeDropDown1Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((33 / 411) * 100).w),
                      BlocSelector<AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState, bool?>(
                          selector: (state) => state.checkedS,
                          builder: (context, checked) {
                            return Text(
                              "msg_which_farm_structures2".tr,
                              style: checked!
                                  ? CustomTextStyles.labelMediumPrimary_1red
                                  : CustomTextStyles.labelMediumPrimary_1,
                            );
                          }),
                      // Text(
                      //   "msg_which_farm_structures2".tr,
                      //   style: CustomTextStyles.labelMediumPrimary_1,
                      // ),
                      BlocSelector<
                              AddFarmtechandassetsOneBloc,
                              AddFarmtechandassetsOneState,
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
                        text: "Add Farm Structure".tr,
                        onTap: () => addFarmStructure(context),
                        margin: EdgeInsets.only(
                          left: DeviceExt((82 / 841) * 100).h,
                          top: DeviceExt((33 / 411) * 100).w,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: DeviceExt((34 / 411) * 100).w),
                      CustomElevatedButton(
                        onTap: () => saveDraft(context),
                        text: "lbl_save".tr,
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

  // _success(BuildContext context) {
  //   NavigatorService.popAndPushNamed(AppRoutes.farmtechandassetsScreen);
  // }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong, Kindly confirm all fields are filled.")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddFarmtechandassetsOneBloc>().add(
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

  addorEdit(BuildContext context, int id, int crop) {
    context.read<AddFarmtechandassetsOneBloc>().add(
          AddEditEvent(
            value: id,
            crop: crop,
            createSuccessful: () {
              addFarmMachinery(context);
            },
            createFailed: () {
              addFarmMachinery(context);
            },
          ),
        );
  }

  delete(BuildContext context, int id) async {
    String label = "Delete Asset Entry";
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
    context.read<AddFarmtechandassetsOneBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.farmtechandassetsScreen);
  }

  goBack(BuildContext context) {
    context.read<AddFarmtechandassetsOneBloc>().add(
          ClearEvent(),
        );
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.farmtechandassetsScreen);
  }

  goB(BuildContext context) {
    context.read<AddFarmtechandassetsOneBloc>().add(
          GoBackEvent(
            createFailed: () => null,
            createSuccessful: () => goBack(context),
          ),
        );
  }

  addPowerSource(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFarmtechandassetsTwoDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFarmtechandassetsOneBloc>().add(
          CheckOneEvent(),
        );
  }

  addLabourSource(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFarmtechandassetsFiveDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFarmtechandassetsOneBloc>().add(
          CheckFourEvent(),
        );
  }

  addFarmMachinery(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFarmtechandassetsThreeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddFarmtechandassetsOneBloc>().add(
          CheckTwoEvent(),
        );
  }

  addFarmStructure(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddFarmtechandassetsFourDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));

    context.read<AddFarmtechandassetsOneBloc>().add(
          CheckThreeEvent(),
        );
  }
}
