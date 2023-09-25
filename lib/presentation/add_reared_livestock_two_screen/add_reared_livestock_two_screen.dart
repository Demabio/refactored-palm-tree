import '../add_reared_livestock_two_screen/widgets/chipviewayrshi2_item_widget.dart';
import 'bloc/add_reared_livestock_two_bloc.dart';
import 'models/add_reared_livestock_two_model.dart';
import 'models/chipviewayrshi2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_floating_text_field.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

class AddRearedLivestockTwoScreen extends StatelessWidget {
  const AddRearedLivestockTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockTwoBloc>(
      create: (context) => AddRearedLivestockTwoBloc(AddRearedLivestockTwoState(
        addRearedLivestockTwoModelObj: AddRearedLivestockTwoModel(),
      ))
        ..add(AddRearedLivestockTwoInitialEvent()),
      child: AddRearedLivestockTwoScreen(),
    );
  }

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
                              AddRearedLivestockTwoBloc,
                              AddRearedLivestockTwoState,
                              TextEditingController?>(
                            selector: (state) => state.searchController,
                            builder: (context, searchController) {
                              return CustomSearchView(
                                margin: EdgeInsets.only(
                                  left: 15.h,
                                  right: 16.h,
                                ),
                                controller: searchController,
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
                              AddRearedLivestockTwoBloc,
                              AddRearedLivestockTwoState,
                              AddRearedLivestockTwoModel?>(
                            selector: (state) =>
                                state.addRearedLivestockTwoModelObj,
                            builder: (context, addRearedLivestockTwoModelObj) {
                              return Wrap(
                                runSpacing: 123.v,
                                spacing: 123.h,
                                children: List<Widget>.generate(
                                  addRearedLivestockTwoModelObj
                                          ?.chipviewayrshi2ItemList.length ??
                                      0,
                                  (index) {
                                    Chipviewayrshi2ItemModel model =
                                        addRearedLivestockTwoModelObj
                                                    ?.chipviewayrshi2ItemList[
                                                index] ??
                                            Chipviewayrshi2ItemModel();

                                    return Chipviewayrshi2ItemWidget(
                                      model,
                                      onSelectedChipView: (value) {
                                        context
                                            .read<AddRearedLivestockTwoBloc>()
                                            .add(UpdateChipViewEvent(
                                                index: index,
                                                isSelected: value));
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.v),
                        BlocSelector<AddRearedLivestockTwoBloc,
                            AddRearedLivestockTwoState, TextEditingController?>(
                          selector: (state) => state.selectController,
                          builder: (context, selectController) {
                            return CustomFloatingTextField(
                              controller: selectController,
                              labelText: "lbl_category".tr,
                              labelStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              hintText: "lbl_category".tr,
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              suffix: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.h,
                                  ),
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPrimary,
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                maxHeight: 65.v,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 29.v),
                        BlocSelector<AddRearedLivestockTwoBloc,
                            AddRearedLivestockTwoState, TextEditingController?>(
                          selector: (state) => state.selectoneController,
                          builder: (context, selectoneController) {
                            return CustomFloatingTextField(
                              controller: selectoneController,
                              labelText: "lbl_sub_category".tr,
                              labelStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              hintText: "lbl_sub_category".tr,
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray40003,
                              textInputAction: TextInputAction.done,
                              suffix: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.h,
                                  ),
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPrimary,
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                maxHeight: 66.v,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 28.v),
                        Text(
                          "lbl_livestock3".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        BlocSelector<
                            AddRearedLivestockTwoBloc,
                            AddRearedLivestockTwoState,
                            AddRearedLivestockTwoModel?>(
                          selector: (state) =>
                              state.addRearedLivestockTwoModelObj,
                          builder: (context, addRearedLivestockTwoModelObj) {
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
                              items: addRearedLivestockTwoModelObj
                                      ?.dropdownItemList ??
                                  [],
                              onChanged: (value) {
                                context
                                    .read<AddRearedLivestockTwoBloc>()
                                    .add(ChangeDropDownEvent(value: value));
                              },
                            );
                          },
                        ),
                        CustomElevatedButton(
                          height: 47.v,
                          text: "msg_add_livestock_age".tr,
                          margin: EdgeInsets.only(
                            left: 15.h,
                            top: 28.v,
                            right: 15.h,
                          ),
                          alignment: Alignment.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.h,
                            top: 29.v,
                          ),
                          child: Text(
                            "msg_livestock_age_group".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16.h,
                              top: 10.v,
                              right: 16.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "lbl_1_2_years".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Spacer(),
                                Text(
                                  "lbl_males_30".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 49.h),
                                  child: Text(
                                    "lbl_female_35".tr,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 15.h,
                              top: 11.v,
                              right: 18.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "msg_less_than_3_weeks".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  "lbl_males_34".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                Text(
                                  "lbl_female_56".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 13.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "msg_what_are_your_main".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.h,
                            top: 16.v,
                          ),
                          child: Text(
                            "lbl_natural_pasture".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.h,
                            top: 6.v,
                          ),
                          child: Text(
                            "msg_purchased_fodder".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        CustomElevatedButton(
                          width: 152.h,
                          text: "lbl_add_feed".tr,
                          margin: EdgeInsets.only(
                            top: 11.v,
                            right: 8.h,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: 28.v),
                        Text(
                          "msg_farming_production2".tr,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                        BlocSelector<
                            AddRearedLivestockTwoBloc,
                            AddRearedLivestockTwoState,
                            AddRearedLivestockTwoModel?>(
                          selector: (state) =>
                              state.addRearedLivestockTwoModelObj,
                          builder: (context, addRearedLivestockTwoModelObj) {
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
                              items: addRearedLivestockTwoModelObj
                                      ?.dropdownItemList1 ??
                                  [],
                              onChanged: (value) {
                                context
                                    .read<AddRearedLivestockTwoBloc>()
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
            bottom: 56.v,
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
}
