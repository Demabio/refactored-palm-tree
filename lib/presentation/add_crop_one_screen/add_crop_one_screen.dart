import 'package:easy_stepper/easy_stepper.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';

import '../add_crop_one_screen/widgets/chipviewalbert_item_widget.dart';
import 'bloc/add_crop_one_bloc.dart';
import 'models/add_crop_one_model.dart';
import 'models/chipviewalbert_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

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
                  leadingWidth: 60.h,
                  leading: AppbarImage(
                      svgPath: ImageConstant.imgSort,
                      margin:
                          EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
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
                        padding: EdgeInsets.only(top: 5.v),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, bottom: 5.v),
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
                                                    left: 13.h,
                                                    top: 7.v,
                                                    right: 18.h),
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
                                                        15.h, 12.v, 9.h, 12.v),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgSearch)),
                                                prefixConstraints:
                                                    BoxConstraints(
                                                        maxHeight: 40.v),
                                                suffix: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 15.h),
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
                                                        icon: Icon(Icons.clear,
                                                            color: Colors.grey
                                                                .shade600))));
                                          })),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 13.h, top: 7.v),
                                      child: Text("lbl_common_crops".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary_1)),
                                  SizedBox(height: 18.v),
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
                                                    runSpacing: 10.v,
                                                    spacing: 10.h,
                                                    children:
                                                        List<Widget>.generate(
                                                      addCropOneModelObj
                                                              ?.chipviewalbertItemList
                                                              .length ??
                                                          0,
                                                      (index) {
                                                        ChipviewalbertItemModel
                                                            model =
                                                            addCropOneModelObj
                                                                        ?.chipviewalbertItemList[
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
                                                  )
                                                : Wrap(
                                                    runSpacing: 10.v,
                                                    spacing: 10.h,
                                                    children:
                                                        List<Widget>.generate(
                                                      addCropOneModelObj
                                                              .searchValues
                                                              ?.length ??
                                                          0,
                                                      (index) {
                                                        ChipviewalbertItemModel
                                                            model =
                                                            addCropOneModelObj!
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
                                  SizedBox(height: 24.v),
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
                                            val: addCropOneModelObj
                                                ?.selectedCrop,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Field is required";
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
                                  SizedBox(height: 9.v),
                                  Text("msg_total_acreage".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1),
                                  BlocSelector<AddCropOneBloc, AddCropOneState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.areavalueoneController,
                                      builder:
                                          (context, areavalueoneController) {
                                        return CustomTextFormField(
                                            autofocus: false,
                                            focusNode: node2,
                                            validator: (value) {
                                              if (!isNumeric(value,
                                                  isRequired: true)) {
                                                return "Invalid Input";
                                              }
                                            },
                                            textInputType: TextInputType.number,
                                            controller: areavalueoneController,
                                            hintText: "lbl_area".tr,
                                            textInputAction:
                                                TextInputAction.done);
                                      }),
                                  SizedBox(height: 9.v),
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
                                  SizedBox(height: 9.v),
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
                                  SizedBox(height: 10.v),
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
                                                    .outlinePrimaryTL10,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .bodyLargePrimary_1)),
                                        Expanded(
                                            child: CustomElevatedButton(
                                                text: "lbl_next".tr,
                                                margin:
                                                    EdgeInsets.only(left: 1.h),
                                                onTap: () {
                                                  nextPage(context);
                                                }))
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

  saveDraft(BuildContext context) {
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
    NavigatorService.pushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }

  /// Navigates to the addCropTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropTwoScreen.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addCropTwoScreen,
    );
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }
}
