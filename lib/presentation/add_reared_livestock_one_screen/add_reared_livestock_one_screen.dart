import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_bee_dialog/add_reared_livestock_dialog_bee_dialog.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/add_reared_livestock_dialog_one_dialog.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/add_reared_livestock_dialog_two_dialog.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import '../add_reared_livestock_one_screen/widgets/chipviewayrshi_item_widget.dart';
import 'bloc/add_reared_livestock_one_bloc.dart';
import 'models/add_reared_livestock_one_model.dart';
import 'models/chipviewayrshi_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

import 'widgets/ages_widget.dart';
import 'widgets/feeds_widget.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AddRearedLivestockOneScreen extends StatelessWidget {
  AddRearedLivestockOneScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockOneBloc>(
      create: (context) => AddRearedLivestockOneBloc(AddRearedLivestockOneState(
        addRearedLivestockOneModelObj: AddRearedLivestockOneModel(),
      ))
        ..add(AddRearedLivestockOneInitialEvent()),
      child: AddRearedLivestockOneScreen(),
    );
  }

  FocusNode _firstTextFieldFocus = FocusNode();
  FocusNode _secondTextFieldFocus = FocusNode();
  // FocusNode _thirdTextFieldFocus = FocusNode();
  FocusNode fouthTextFieldFocus = FocusNode();
  FocusNode fifthTextFieldFocus = FocusNode();
  FocusNode sixthTextFieldFocus = FocusNode();
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
            leadingWidth: DeviceExt((60 / 841) * 100).h,
            leading: AppbarImage(
              onTap: () => goBack(context),
              svgPath: ImageConstant.imgSort,
              margin: EdgeInsets.only(
                left: DeviceExt((16 / 841) * 100).h,
                top: DeviceExt((3 / 411) * 100).w,
                bottom: DeviceExt((11 / 411) * 100).w,
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle1(
              text: "msg_add_reared_livestock".tr,
            ),
            styleType: Style.bgFill,
          ),
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: DeviceExt((4 / 411) * 100).w),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: DeviceExt((16 / 841) * 100).h,
                          right: DeviceExt((16 / 841) * 100).h,
                          bottom: DeviceExt((5 / 411) * 100).w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: BlocSelector<
                                  AddRearedLivestockOneBloc,
                                  AddRearedLivestockOneState,
                                  TextEditingController?>(
                                selector: (state) => state.searchController,
                                builder: (context, searchController) {
                                  return CustomSearchView(
                                    onChanged: (value) {
                                      context
                                          .read<AddRearedLivestockOneBloc>()
                                          .add(SearchEventLivestock(
                                              value: value));
                                    },
                                    enabled: true,
                                    margin: EdgeInsets.only(
                                      left: DeviceExt((15 / 841) * 100).h,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    controller: searchController,
                                    autofocus: false,
                                    focusNode: _firstTextFieldFocus,
                                    hintText: "msg_search_livestock".tr,
                                    alignment: Alignment.center,
                                    prefix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          DeviceExt((15 / 841) * 100).h,
                                          DeviceExt((12 / 411) * 100).w,
                                          DeviceExt((9 / 841) * 100).h,
                                          DeviceExt((12 / 411) * 100).w),
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgSearch,
                                      ),
                                    ),
                                    prefixConstraints: BoxConstraints(
                                      maxHeight: DeviceExt((40 / 411) * 100).w,
                                    ),
                                    suffix: Padding(
                                      padding: EdgeInsets.only(
                                        right: DeviceExt((15 / 841) * 100).h,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          searchController!.clear();
                                          context
                                              .read<AddRearedLivestockOneBloc>()
                                              .add(
                                                  ReturnCommonEventLivestock());
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: DeviceExt((15 / 841) * 100).h,
                                top: DeviceExt((5 / 411) * 100).w,
                              ),
                              child: Text(
                                "msg_common_livestock".tr,
                                style: CustomTextStyles.labelMediumPrimary_1,
                              ),
                            ),
                            SizedBox(height: DeviceExt((20 / 411) * 100).w),
                            Align(
                              alignment: Alignment.center,
                              child: BlocSelector<
                                  AddRearedLivestockOneBloc,
                                  AddRearedLivestockOneState,
                                  AddRearedLivestockOneModel?>(
                                selector: (state) =>
                                    state.addRearedLivestockOneModelObj,
                                builder:
                                    (context, addRearedLivestockOneModelObj) {
                                  return !addRearedLivestockOneModelObj!.search
                                      ? Wrap(
                                          runSpacing:
                                              DeviceExt((10 / 411) * 100).w,
                                          spacing:
                                              DeviceExt((10 / 841) * 100).h,
                                          children: List<Widget>.generate(
                                            addRearedLivestockOneModelObj
                                                .chipviewayrshiItemList.length,
                                            (index) {
                                              ChipviewayrshiItemModel model =
                                                  addRearedLivestockOneModelObj
                                                          .chipviewayrshiItemList[
                                                      index];

                                              return ChipviewayrshiItemWidget(
                                                model,
                                                onSelectedChipView: (value) {
                                                  context
                                                      .read<
                                                          AddRearedLivestockOneBloc>()
                                                      .add(UpdateChipViewEvent(
                                                          index: index,
                                                          isSelected: value,
                                                          model: model));
                                                },
                                              );
                                            },
                                          ),
                                        )
                                      : Wrap(
                                          runSpacing:
                                              DeviceExt((10 / 411) * 100).w,
                                          spacing:
                                              DeviceExt((10 / 841) * 100).h,
                                          children: List<Widget>.generate(
                                            addRearedLivestockOneModelObj
                                                    .searchResults?.length ??
                                                0,
                                            (index) {
                                              ChipviewayrshiItemModel model =
                                                  addRearedLivestockOneModelObj
                                                              .searchResults?[
                                                          index] ??
                                                      ChipviewayrshiItemModel();

                                              return ChipviewayrshiItemWidget(
                                                model,
                                                onSelectedChipView: (value) {
                                                  _firstTextFieldFocus
                                                      .unfocus();
                                                  context
                                                      .read<
                                                          AddRearedLivestockOneBloc>()
                                                      .add(UpdateChipViewEvent(
                                                          index: index,
                                                          isSelected: value,
                                                          model: model));
                                                },
                                              );
                                            },
                                          ),
                                        );
                                },
                              ),
                            ),
                            SizedBox(height: DeviceExt((20 / 411) * 100).w),
                            Text(
                              "Category (*)".tr,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                            BlocSelector<
                                AddRearedLivestockOneBloc,
                                AddRearedLivestockOneState,
                                AddRearedLivestockOneModel?>(
                              selector: (state) =>
                                  state.addRearedLivestockOneModelObj,
                              builder:
                                  (context, addRearedLivestockOneModelObj) {
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
                                      svgPath:
                                          ImageConstant.imgArrowdownPrimary,
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
                                  val: addRearedLivestockOneModelObj
                                      ?.selectedCategory,
                                  items: addRearedLivestockOneModelObj!
                                          .categories.isEmpty
                                      ? []
                                      : addRearedLivestockOneModelObj
                                          .categories,
                                  onChanged: (value) {
                                    context
                                        .read<AddRearedLivestockOneBloc>()
                                        .add(ChangeDropDownEventCategory(
                                            value: value));
                                  },
                                );
                              },
                            ),
                            SizedBox(height: DeviceExt((16 / 411) * 100).w),
                            Text(
                              "SubCategory (*)".tr,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                            BlocSelector<
                                AddRearedLivestockOneBloc,
                                AddRearedLivestockOneState,
                                AddRearedLivestockOneModel?>(
                              selector: (state) =>
                                  state.addRearedLivestockOneModelObj,
                              builder:
                                  (context, addRearedLivestockOneModelObj) {
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
                                      svgPath:
                                          ImageConstant.imgArrowdownPrimary,
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
                                  val: addRearedLivestockOneModelObj
                                      ?.selectedSubCategory,
                                  items: addRearedLivestockOneModelObj!
                                          .subcategories.isEmpty
                                      ? []
                                      : addRearedLivestockOneModelObj
                                          .subcategories,
                                  onChanged: (value) {
                                    context
                                        .read<AddRearedLivestockOneBloc>()
                                        .add(ChangeDropDownEventSubCategory(
                                            value: value));
                                  },
                                );
                              },
                            ),
                            SizedBox(height: DeviceExt((15 / 411) * 100).w),
                            Text(
                              "lbl_livestock3".tr,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                            BlocSelector<
                                AddRearedLivestockOneBloc,
                                AddRearedLivestockOneState,
                                AddRearedLivestockOneModel?>(
                              selector: (state) =>
                                  state.addRearedLivestockOneModelObj,
                              builder:
                                  (context, addRearedLivestockOneModelObj) {
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
                                      svgPath:
                                          ImageConstant.imgArrowdownPrimary,
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
                                  val: addRearedLivestockOneModelObj
                                      ?.selectedLivestock,
                                  items: addRearedLivestockOneModelObj!
                                          .livestock.isEmpty
                                      ? []
                                      : addRearedLivestockOneModelObj.livestock,
                                  onChanged: (value) {
                                    context
                                        .read<AddRearedLivestockOneBloc>()
                                        .add(ChangeDropDownEventLivestock(
                                            value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddRearedLivestockOneBloc,
                                AddRearedLivestockOneState,
                                AddRearedLivestockOneState>(
                              selector: (state) => state,
                              builder: (context, state) {
                                return Visibility(
                                  visible: state.addRearedLivestockOneModelObj
                                              ?.selectedLivestock?.title ==
                                          "Bees" ||
                                      state.addRearedLivestockOneModelObj
                                              ?.selectedLivestock?.title ==
                                          "Bee",
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height:
                                                DeviceExt((35 / 411) * 100).w),
                                        Text(
                                          "Number of Bee Hives".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary_1,
                                        ),
                                        SizedBox(
                                            height:
                                                DeviceExt((10 / 411) * 100).w),
                                        CustomTextFormField(
                                            autofocus: false,
                                            focusNode: _secondTextFieldFocus,
                                            validator: (value) {
                                              if (!isNumeric(
                                                value,
                                              )) {
                                                return "Invalid Input";
                                              } else {
                                                return null;
                                              }
                                            },
                                            textInputType: TextInputType.number,
                                            controller: state.hives,
                                            hintText: "Number".tr,
                                            textInputAction:
                                                TextInputAction.done),
                                        SizedBox(
                                            height:
                                                DeviceExt((17 / 411) * 100).w),
                                        Text(
                                          "Beehive types".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary_1,
                                        ),
                                        SizedBox(
                                            height:
                                                DeviceExt((17 / 411) * 100).w),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: DeviceExt((15 / 411) * 100).w,
                                            right:
                                                DeviceExt((16 / 841) * 100).h,
                                          ),
                                          child: Column(
                                            children: List<Widget>.generate(
                                              state.bees?.length ?? 0,
                                              (index) {
                                                FeedsModel model =
                                                    state.bees![index];

                                                return FeedItemWidget(
                                                  model,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                DeviceExt((17 / 411) * 100).w),
                                        CustomElevatedButton(
                                          width: DeviceExt((152 / 841) * 100).h,
                                          alignment: Alignment.centerRight,
                                          height: DeviceExt((47 / 411) * 100).w,
                                          text: "Add Type".tr,
                                          margin: EdgeInsets.only(
                                            left: DeviceExt((15 / 841) * 100).h,
                                            top: DeviceExt((15 / 411) * 100).w,
                                            right:
                                                DeviceExt((15 / 841) * 100).h,
                                          ),
                                          onTap: () {
                                            addBee(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: DeviceExt((35 / 411) * 100).w),
                            CustomElevatedButton(
                              height: DeviceExt((47 / 411) * 100).w,
                              text: "msg_add_livestock_age".tr,
                              margin: EdgeInsets.only(
                                left: DeviceExt((15 / 841) * 100).h,
                                top: DeviceExt((15 / 411) * 100).w,
                                right: DeviceExt((15 / 841) * 100).h,
                              ),
                              alignment: Alignment.center,
                              onTap: () {
                                addAgeGroup(context);
                              },
                            ),
                            SizedBox(height: DeviceExt((35 / 411) * 100).w),
                            Text(
                              "msg_livestock_age_group".tr,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                            SizedBox(height: DeviceExt((18 / 411) * 100).w),
                            BlocSelector<
                                    AddRearedLivestockOneBloc,
                                    AddRearedLivestockOneState,
                                    List<AgeGroupModel>?>(
                                selector: (state) => state.ageGroupMapList,
                                builder: (context, ages) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: DeviceExt((15 / 411) * 100).w,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        ages?.length ?? 0,
                                        (index) {
                                          AgeGroupModel model = ages![index];

                                          return AgeItemWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(height: DeviceExt((18 / 411) * 100).w),
                            BlocSelector<AddRearedLivestockOneBloc,
                                    AddRearedLivestockOneState, bool?>(
                                selector: (state) => state.checkedF,
                                builder: (context, checked) {
                                  return Text(
                                    "msg_what_are_your_main".tr,
                                    style: checked!
                                        ? CustomTextStyles
                                            .labelMediumPrimary_1red
                                        : CustomTextStyles.labelMediumPrimary_1,
                                  );
                                }),
                            SizedBox(height: DeviceExt((18 / 411) * 100).w),
                            BlocSelector<
                                    AddRearedLivestockOneBloc,
                                    AddRearedLivestockOneState,
                                    List<FeedsModel>?>(
                                selector: (state) => state.feedsdlist,
                                builder: (context, feeds) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: DeviceExt((15 / 411) * 100).w,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        feeds?.length ?? 0,
                                        (index) {
                                          FeedsModel model = feeds![index];

                                          return FeedItemWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(height: DeviceExt((65 / 411) * 100).w),
                            CustomElevatedButton(
                              width: DeviceExt((152 / 841) * 100).h,
                              onTap: () => addFeed(context),
                              text: "lbl_add_feed".tr,
                              alignment: Alignment.centerRight,
                            ),
                            SizedBox(height: DeviceExt((34 / 411) * 100).w),
                            Text(
                              "msg_farming_production2".tr,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                            BlocSelector<
                                AddRearedLivestockOneBloc,
                                AddRearedLivestockOneState,
                                AddRearedLivestockOneModel?>(
                              selector: (state) =>
                                  state.addRearedLivestockOneModelObj,
                              builder:
                                  (context, addRearedLivestockOneModelObj) {
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
                                      svgPath:
                                          ImageConstant.imgArrowdownPrimary,
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
                                  val: addRearedLivestockOneModelObj
                                      ?.selectedDropDownValue1,
                                  items: addRearedLivestockOneModelObj
                                          ?.dropdownItemList1 ??
                                      [],
                                  onChanged: (value) {
                                    context
                                        .read<AddRearedLivestockOneBloc>()
                                        .add(
                                            ChangeDropDown1Event(value: value));
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomElevatedButton(
            text: "lbl_save".tr,
            onTap: () => saveDraft(context),
            margin: EdgeInsets.only(
              left: DeviceExt((16 / 841) * 100).h,
              right: DeviceExt((16 / 841) * 100).h,
              bottom: DeviceExt((20 / 411) * 100).w,
            ),
            leftIcon: Container(
              margin: EdgeInsets.only(right: DeviceExt((10 / 841) * 100).h),
              child: CustomImageView(
                svgPath: ImageConstant.imgSaveWhiteA700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  nextPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddRearedLivestockOneBloc>().add(
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
    NavigatorService.popAndPushNamed(AppRoutes.livestockOneTabContainerScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong.")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddRearedLivestockOneBloc>().add(
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

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(
        context, AppRoutes.livestockOneTabContainerScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(
        context, AppRoutes.livestockOneTabContainerScreen);
  }

  addAgeGroup(BuildContext context) async {
    context.read<AddRearedLivestockOneBloc>().add(
          AddEditAgeEvent(),
        );

    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddRearedLivestockDialogTwoDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddRearedLivestockOneBloc>().add(
          CheckAgeEvent(),
        );
  }

  addFeed(BuildContext context) async {
    context.read<AddRearedLivestockOneBloc>().add(
          AddEditFeedEvent(),
        );
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddRearedLivestockDialogOneDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddRearedLivestockOneBloc>().add(
          CheckFeedEvent(),
        );
    // addAgeGroup(context);
  }

  addBee(BuildContext context) async {
    context.read<AddRearedLivestockOneBloc>().add(
          AddEditBeeEvent(),
        );
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddRearedLivestockDialogBeeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<AddRearedLivestockOneBloc>().add(
          CheckBeeEvent(),
        );
    // addAgeGroup(context);
  }
}
