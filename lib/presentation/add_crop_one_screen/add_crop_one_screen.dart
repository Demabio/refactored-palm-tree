import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';

import '../add_crop_one_screen/widgets/chipviewalbert_item_widget.dart';
import 'bloc/add_crop_one_bloc.dart';
import 'models/add_crop_one_model.dart';
import 'models/chipviewalbert_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AddCropOneScreen extends StatelessWidget {
  AddCropOneScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddCropOneBloc>(
        create: (context) => AddCropOneBloc(
            AddCropOneState(addCropOneModelObj: AddCropOneModel()))
          ..add(AddCropOneInitialEvent()),
        child: AddCropOneScreen());
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
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "lbl_add_new_crop".tr),
                  styleType: Style.bgFill),
              body: Form(
                key: _formKey,
                child: SizedBox(
                    width: mediaQueryData.size.width,
                    child: SingleChildScrollView(
                        padding:
                            EdgeInsets.only(top: DeviceExt((5 / 411) * 100).w),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: DeviceExt((16 / 841) * 100).h,
                                right: DeviceExt((16 / 841) * 100).h,
                                bottom: DeviceExt((5 / 411) * 100).w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocSelector<AddCropOneBloc, AddCropOneState,
                                          AddCropOneModel?>(
                                      selector: (state) =>
                                          state.addCropOneModelObj,
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
                                                    .caProgressDB!);
                                          },
                                          direction: Axis.horizontal,
                                          unreachedStepIconColor:
                                              theme.colorScheme.secondary,
                                          finishedStepIconColor: Colors.orange,
                                          activeStepTextColor: Colors.black87,
                                          finishedStepTextColor: Colors.black87,
                                          internalPadding: 0,
                                          showLoadingAnimation: true,
                                          stepRadius:
                                              DeviceExt((25 / 841) * 100).h,
                                          disableScroll: true,
                                          showStepBorder: true,
                                          alignment: Alignment.center,
                                          steps: [
                                            EasyStep(
                                              customStep: CircleAvatar(
                                                radius:
                                                    DeviceExt((35 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: DeviceExt(
                                                          (25 / 841) * 100)
                                                      .h,
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
                                                                fontSize:
                                                                    DeviceExt(
                                                                            1.8)
                                                                        .h,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.check,
                                                              size: DeviceExt(5)
                                                                  .h,
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
                                                radius:
                                                    DeviceExt((35 / 841) * 100)
                                                        .h,
                                                backgroundColor:
                                                    theme.colorScheme.primary,
                                                child: CircleAvatar(
                                                  radius: DeviceExt(
                                                          (25 / 841) * 100)
                                                      .h,
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
                                                                fontSize:
                                                                    DeviceExt(
                                                                            1.8)
                                                                        .h,
                                                              ),
                                                            )
                                                          : Icon(
                                                              Icons.check,
                                                              size: DeviceExt(5)
                                                                  .h,
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
                                  Align(
                                      alignment: Alignment.center,
                                      child: BlocSelector<
                                              AddCropOneBloc,
                                              AddCropOneState,
                                              TextEditingController?>(
                                          selector: (state) =>
                                              state.searchController,
                                          builder: (context, searchController) {
                                            return CustomSearchView(
                                                margin: EdgeInsets.only(
                                                    left: DeviceExt((13 / 841) * 100)
                                                        .h,
                                                    top: DeviceExt((7 / 411) * 100)
                                                        .w,
                                                    right:
                                                        DeviceExt((18 / 841) * 100)
                                                            .h),
                                                controller: searchController,
                                                enabled: true,
                                                autofocus: false,
                                                onChanged: (value) {
                                                  context
                                                      .read<AddCropOneBloc>()
                                                      .add(SearchEventCrop(
                                                          value: value));
                                                },
                                                focusNode: node1,
                                                hintText: "lbl_search_crop".tr,
                                                alignment: Alignment.center,
                                                prefix: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        DeviceExt((15 / 841) * 100)
                                                            .h,
                                                        DeviceExt((12 / 411) * 100)
                                                            .w,
                                                        DeviceExt((9 / 841) * 100)
                                                            .h,
                                                        DeviceExt((12 / 411) * 100)
                                                            .w),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant.imgSearch)),
                                                prefixConstraints: BoxConstraints(maxHeight: DeviceExt((40 / 411) * 100).w),
                                                suffix: Padding(
                                                    padding: EdgeInsets.only(right: DeviceExt((15 / 841) * 100).h),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          searchController!
                                                              .clear();
                                                          context
                                                              .read<
                                                                  AddCropOneBloc>()
                                                              .add(
                                                                  ReturnCommonEventCrop());
                                                        },
                                                        icon: Icon(Icons.clear, color: Colors.grey.shade600))));
                                          })),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((13 / 841) * 100).h,
                                          top: DeviceExt((7 / 411) * 100).w),
                                      child: Text("lbl_common_crops".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary_1)),
                                  SizedBox(
                                      height: DeviceExt((18 / 411) * 100).w),
                                  Align(
                                      alignment: Alignment.center,
                                      child: BlocSelector<
                                              AddCropOneBloc,
                                              AddCropOneState,
                                              AddCropOneModel?>(
                                          selector: (state) =>
                                              state.addCropOneModelObj,
                                          builder:
                                              (context, addCropOneModelObj) {
                                            return !addCropOneModelObj!.search
                                                ? Wrap(
                                                    runSpacing: DeviceExt(
                                                            (10 / 411) * 100)
                                                        .w,
                                                    spacing: DeviceExt(
                                                            (10 / 841) * 100)
                                                        .h,
                                                    children:
                                                        List<Widget>.generate(
                                                      addCropOneModelObj
                                                          .chipviewalbertItemList
                                                          .length,
                                                      (index) {
                                                        ChipviewalbertItemModel
                                                            model =
                                                            addCropOneModelObj
                                                                    .chipviewalbertItemList[
                                                                index];
                                                        return ChipviewalbertItemWidget(
                                                            model,
                                                            onSelectedChipView:
                                                                (value) {
                                                          context
                                                              .read<
                                                                  AddCropOneBloc>()
                                                              .add(
                                                                  UpdateChipViewEvent(
                                                                index: index,
                                                                isSelected:
                                                                    value,
                                                                model: model,
                                                              ));
                                                        });
                                                      },
                                                    ),
                                                  )
                                                : Wrap(
                                                    runSpacing: DeviceExt(
                                                            (10 / 411) * 100)
                                                        .w,
                                                    spacing: DeviceExt(
                                                            (10 / 841) * 100)
                                                        .h,
                                                    children:
                                                        List<Widget>.generate(
                                                      addCropOneModelObj
                                                              .searchValues
                                                              ?.length ??
                                                          0,
                                                      (index) {
                                                        ChipviewalbertItemModel
                                                            model =
                                                            addCropOneModelObj
                                                                        .searchValues?[
                                                                    index] ??
                                                                ChipviewalbertItemModel();
                                                        return ChipviewalbertItemWidget(
                                                            model,
                                                            onSelectedChipView:
                                                                (value) {
                                                          context
                                                              .read<
                                                                  AddCropOneBloc>()
                                                              .add(
                                                                  UpdateChipViewEvent(
                                                                index: index,
                                                                isSelected:
                                                                    value,
                                                                model: model,
                                                              ));
                                                        });
                                                      },
                                                    ),
                                                  );
                                          })),
                                  SizedBox(
                                      height: DeviceExt((24 / 411) * 100).w),
                                  Text("lbl_crop2".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropOneBloc, AddCropOneState,
                                          AddCropOneModel?>(
                                      selector: (state) =>
                                          state.addCropOneModelObj,
                                      builder: (context, addCropOneModelObj) {
                                        return CustomDropDown(
                                            icon: Container(
                                                margin: EdgeInsets.only(
                                                    left: DeviceExt(
                                                            (30 / 841) * 100)
                                                        .h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            DeviceExt((10 / 841) * 100)
                                                                .h)),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdownPrimary)),
                                            hintText: "lbl_select".tr,
                                            val: addCropOneModelObj
                                                ?.selectedCrop,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            items: addCropOneModelObj
                                                    ?.dropdownItemList ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropOneBloc>()
                                                  .add(ChangeDropDownEvent(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((9 / 411) * 100).w),
                                  Text("msg_total_acreage".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropOneBloc, AddCropOneState,
                                          AddCropOneState>(
                                      selector: (state) => state,
                                      builder: (context, state) {
                                        return CustomTextFormField(
                                            autofocus: false,
                                            focusNode: node2,
                                            validator: (value) {
                                              if (!isNumeric(value,
                                                  isRequired: true)) {
                                                return "Invalid Input";
                                              } else if (double.parse(
                                                      value ?? "0") >
                                                  state.addCropOneModelObj!
                                                      .area!) {
                                                return "Size can not be larger than stated crop farming size.";
                                              } else if (double.parse(
                                                          value ?? "0") +
                                                      state.addCropOneModelObj!
                                                          .area1! >
                                                  state.addCropOneModelObj!
                                                      .area!) {
                                                return "Combined crop sizes is larger than crop farming size.";
                                              } else if (!greaterthanone(value,
                                                  isRequired: true)) {
                                                return "Value must be greater than 1";
                                              } else {
                                                return null;
                                              }
                                            },
                                            textInputType: TextInputType.number,
                                            controller:
                                                state.areavalueoneController,
                                            hintText: "lbl_area".tr,
                                            textInputAction:
                                                TextInputAction.done);
                                      }),
                                  SizedBox(
                                      height: DeviceExt((9 / 411) * 100).w),
                                  Text("msg_unit_of_area".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropOneBloc, AddCropOneState,
                                          AddCropOneModel?>(
                                      selector: (state) =>
                                          state.addCropOneModelObj,
                                      builder: (context, addCropOneModelObj) {
                                        return CustomDropDown(
                                            icon: Container(
                                                margin: EdgeInsets.only(
                                                    left:
                                                        DeviceExt((30 / 841) * 100)
                                                            .h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            DeviceExt((10 / 841) * 100)
                                                                .h)),
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
                                            val: addCropOneModelObj
                                                ?.selectedDropDownValue1,
                                            items: addCropOneModelObj
                                                    ?.dropdownItemList1 ??
                                                [],
                                            focusNode: FocusNode(),
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropOneBloc>()
                                                  .add(ChangeDropDown1Event(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((9 / 411) * 100).w),
                                  Text("msg_use_of_certified".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropOneBloc, AddCropOneState,
                                          AddCropOneModel?>(
                                      selector: (state) =>
                                          state.addCropOneModelObj,
                                      builder: (context, addCropOneModelObj) {
                                        return CustomDropDown(
                                            icon: Container(
                                                margin: EdgeInsets.only(
                                                    left:
                                                        DeviceExt((30 / 841) * 100)
                                                            .h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            DeviceExt((10 / 841) * 100)
                                                                .h)),
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
                                            val: addCropOneModelObj
                                                ?.selectedDropDownValue2,
                                            items: addCropOneModelObj
                                                    ?.dropdownItemList2 ??
                                                [],
                                            onChanged: (value) {
                                              context
                                                  .read<AddCropOneBloc>()
                                                  .add(ChangeDropDown2Event(
                                                      value: value));
                                            });
                                      }),
                                  SizedBox(
                                      height: DeviceExt((10 / 411) * 100).w),
                                  CustomElevatedButton(
                                      text: "lbl_next".tr,
                                      onTap: () {
                                        nextPage(context);
                                      }),
                                  SizedBox(
                                      height: DeviceExt((12 / 411) * 100).w),
                                  CustomElevatedButton(
                                      text: "lbl_save".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(
                                              right: DeviceExt((10 / 841) * 100)
                                                  .h),
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
      context.read<AddCropOneBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.addCropTwoScreen);
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
      context.read<AddCropOneBloc>().add(
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

  _navToStep(int val, BuildContext context, CAProgress caProgress) {
    if (_formKey.currentState!.validate()) {
      if (val == 1 && caProgress.pageOne == 1) {
        Navigator.popAndPushNamed(context, AppRoutes.addCropTwoScreen);
      }
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(context, AppRoutes.cropAgricultureScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(context, AppRoutes.addCropOneScreen);
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }

  /// Navigates to the addCropTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropTwoScreen.
  onTapNext(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addCropTwoScreen,
    );
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  onTapSave(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }
}
