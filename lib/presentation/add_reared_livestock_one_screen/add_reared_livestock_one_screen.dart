import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/add_reared_livestock_dialog_one_dialog.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_three_dialog/add_reared_livestock_dialog_three_dialog.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/add_reared_livestock_dialog_two_dialog.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

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
import 'package:kiamis_app/widgets/custom_floating_text_field.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

import 'widgets/ages_widget.dart';
import 'widgets/feeds_widget.dart';

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
  FocusNode _thirdTextFieldFocus = FocusNode();
  FocusNode fouthTextFieldFocus = FocusNode();
  FocusNode fifthTextFieldFocus = FocusNode();
  FocusNode sixthTextFieldFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          title: AppbarSubtitle1(
            text: "msg_add_reared_livestock".tr,
          ),
          styleType: Style.bgFill,
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 4.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      right: 16.h,
                      bottom: 5.v,
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
                                      .add(SearchEventLivestock(value: value));
                                },
                                enabled: true,
                                margin: EdgeInsets.only(
                                  left: 15.h,
                                  right: 16.h,
                                ),
                                controller: searchController,
                                autofocus: false,
                                focusNode: _firstTextFieldFocus,
                                hintText: "msg_search_livestock".tr,
                                alignment: Alignment.center,
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      15.h, 12.v, 9.h, 12.v),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 40.v,
                                ),
                                suffix: Padding(
                                  padding: EdgeInsets.only(
                                    right: 15.h,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      searchController!.clear();
                                      context
                                          .read<AddRearedLivestockOneBloc>()
                                          .add(ReturnCommonEventLivestock());
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
                            left: 15.h,
                            top: 5.v,
                          ),
                          child: Text(
                            "msg_common_livestock".tr,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Align(
                          alignment: Alignment.center,
                          child: BlocSelector<
                              AddRearedLivestockOneBloc,
                              AddRearedLivestockOneState,
                              AddRearedLivestockOneModel?>(
                            selector: (state) =>
                                state.addRearedLivestockOneModelObj,
                            builder: (context, addRearedLivestockOneModelObj) {
                              return !addRearedLivestockOneModelObj!.search
                                  ? Wrap(
                                      runSpacing: 10.v,
                                      spacing: 10.h,
                                      children: List<Widget>.generate(
                                        addRearedLivestockOneModelObj
                                                ?.chipviewayrshiItemList
                                                .length ??
                                            0,
                                        (index) {
                                          ChipviewayrshiItemModel model =
                                              addRearedLivestockOneModelObj
                                                          ?.chipviewayrshiItemList[
                                                      index] ??
                                                  ChipviewayrshiItemModel();

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
                                      runSpacing: 10.v,
                                      spacing: 10.h,
                                      children: List<Widget>.generate(
                                        addRearedLivestockOneModelObj
                                                .searchResults?.length ??
                                            0,
                                        (index) {
                                          ChipviewayrshiItemModel model =
                                              addRearedLivestockOneModelObj
                                                      .searchResults?[index] ??
                                                  ChipviewayrshiItemModel();

                                          return ChipviewayrshiItemWidget(
                                            model,
                                            onSelectedChipView: (value) {
                                              _firstTextFieldFocus.unfocus();
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
                        SizedBox(height: 20.v),
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
                          builder: (context, addRearedLivestockOneModelObj) {
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
                                }
                              },
                              val: addRearedLivestockOneModelObj
                                  ?.selectedCategory,
                              items: addRearedLivestockOneModelObj!
                                      .categories.isEmpty
                                  ? []
                                  : addRearedLivestockOneModelObj.categories,
                              onChanged: (value) {
                                context.read<AddRearedLivestockOneBloc>().add(
                                    ChangeDropDownEventCategory(value: value));
                              },
                            );
                          },
                        ),
                        SizedBox(height: 16.v),
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
                          builder: (context, addRearedLivestockOneModelObj) {
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
                                }
                              },
                              val: addRearedLivestockOneModelObj
                                  ?.selectedSubCategory,
                              items: addRearedLivestockOneModelObj!
                                      .subcategories.isEmpty
                                  ? []
                                  : addRearedLivestockOneModelObj.subcategories,
                              onChanged: (value) {
                                context.read<AddRearedLivestockOneBloc>().add(
                                    ChangeDropDownEventSubCategory(
                                        value: value));
                              },
                            );
                          },
                        ),
                        SizedBox(height: 15.v),
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
                          builder: (context, addRearedLivestockOneModelObj) {
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
                                }
                              },
                              val: addRearedLivestockOneModelObj
                                  ?.selectedLivestock,
                              items: addRearedLivestockOneModelObj!
                                      .livestock.isEmpty
                                  ? []
                                  : addRearedLivestockOneModelObj.livestock,
                              onChanged: (value) {
                                context.read<AddRearedLivestockOneBloc>().add(
                                    ChangeDropDownEventLivestock(value: value));
                              },
                            );
                          },
                        ),
                        CustomElevatedButton(
                          height: 47.v,
                          text: "msg_add_livestock_age".tr,
                          margin: EdgeInsets.only(
                            left: 15.h,
                            top: 15.v,
                            right: 15.h,
                          ),
                          alignment: Alignment.center,
                          onTap: () {
                            addAgeGroup(context);
                          },
                        ),
                        SizedBox(height: 35.v),
                        Text(
                          "msg_livestock_age_group".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 18.v),
                        BlocSelector<
                                AddRearedLivestockOneBloc,
                                AddRearedLivestockOneState,
                                List<AgeGroupModel>?>(
                            selector: (state) => state.ageGroupMapList,
                            builder: (context, ages) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: 15.v,
                                  right: 16.h,
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
                        SizedBox(height: 18.v),
                        Text(
                          "msg_what_are_your_main".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 18.v),
                        BlocSelector<AddRearedLivestockOneBloc,
                                AddRearedLivestockOneState, List<FeedsModel>?>(
                            selector: (state) => state.feedsdlist,
                            builder: (context, feeds) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: 15.v,
                                  right: 16.h,
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
                        SizedBox(height: 65.v),
                        CustomElevatedButton(
                          width: 152.h,
                          onTap: () => addFeed(context),
                          text: "lbl_add_feed".tr,
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: 34.v),
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
                          builder: (context, addRearedLivestockOneModelObj) {
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
                                    .add(ChangeDropDown1Event(value: value));
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
        bottomNavigationBar: CustomElevatedButton(
          text: "lbl_save".tr,
          onTap: () => saveDraft(context),
          margin: EdgeInsets.only(
            left: 16.h,
            right: 16.h,
            bottom: 20.v,
          ),
          leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
              svgPath: ImageConstant.imgSaveWhiteA700,
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong, Kindly confirm all fields are filled.")));
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

  addAgeGroup(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddRearedLivestockDialogTwoDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addFeed(BuildContext context) async {
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

    // addAgeGroup(context);
  }
}
