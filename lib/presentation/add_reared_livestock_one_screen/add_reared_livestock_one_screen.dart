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

class AddRearedLivestockOneScreen extends StatelessWidget {
  AddRearedLivestockOneScreen({Key? key})
      : super(
          key: key,
        );

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

    return BlocBuilder<AddRearedLivestockOneBloc, AddRearedLivestockOneState>(
        builder: (context, state) {
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
                              builder:
                                  (context, addRearedLivestockOneModelObj) {
                                return Wrap(
                                  runSpacing: 10.v,
                                  spacing: 10.h,
                                  children: List<Widget>.generate(
                                    addRearedLivestockOneModelObj
                                            ?.chipviewayrshiItemList.length ??
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
                                              .read<AddRearedLivestockOneBloc>()
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
                                // val: state.selectedCategory == null
                                //     ? null // Handle the case when 'categories' is empty
                                //     : addRearedLivestockOneModelObj?.categories[
                                //         state.selectedCategory!.id! - 1],
                                items:
                                    addRearedLivestockOneModelObj?.categories ??
                                        [],
                                onChanged: (value) {
                                  context.read<AddRearedLivestockOneBloc>().add(
                                      ChangeDropDownEventCategory(
                                          value: value));
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
                                // val: state.selectedSubCategory == null
                                //     ? null // Handle the case when 'categories' is empty
                                //     : addRearedLivestockOneModelObj
                                //             ?.subcategories[
                                //         state.selectedSubCategory!.id! - 1],
                                items: addRearedLivestockOneModelObj
                                        ?.subcategories ??
                                    [],
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
                                // val: state.selectedLivestock == null
                                //     ? null // Handle the case when 'categories' is empty
                                //     : addRearedLivestockOneModelObj?.livestock[
                                //         state.selectedLivestock!.id! - 1],
                                items:
                                    addRearedLivestockOneModelObj?.livestock ??
                                        [],
                                onChanged: (value) {
                                  context.read<AddRearedLivestockOneBloc>().add(
                                      ChangeDropDownEventLivestock(
                                          value: value));
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
                          ),
                          SizedBox(height: 35.v),
                          Text(
                            "msg_livestock_age_group".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(height: 18.v),
                          Text(
                            "msg_what_are_your_main".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(height: 65.v),
                          CustomElevatedButton(
                            width: 152.h,
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
    });
  }
}
