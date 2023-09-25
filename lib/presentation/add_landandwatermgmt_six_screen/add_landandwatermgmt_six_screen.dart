import 'bloc/add_landandwatermgmt_six_bloc.dart';
import 'models/add_landandwatermgmt_six_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_floating_text_field.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class AddLandandwatermgmtSixScreen extends StatelessWidget {
  const AddLandandwatermgmtSixScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtSixBloc>(
      create: (context) =>
          AddLandandwatermgmtSixBloc(AddLandandwatermgmtSixState(
        addLandandwatermgmtSixModelObj: AddLandandwatermgmtSixModel(),
      ))
            ..add(AddLandandwatermgmtSixInitialEvent()),
      child: AddLandandwatermgmtSixScreen(),
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
          title: AppbarSubtitle4(
            text: "msg_land_and_water_management2".tr,
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 768.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "msg_do_you_undertake2".tr,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.v),
                            decoration: AppDecoration.outlinePrimary2.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocSelector<
                                    AddLandandwatermgmtSixBloc,
                                    AddLandandwatermgmtSixState,
                                    AddLandandwatermgmtSixModel?>(
                                  selector: (state) =>
                                      state.addLandandwatermgmtSixModelObj,
                                  builder: (context,
                                      addLandandwatermgmtSixModelObj) {
                                    return CustomDropDown(
                                      width: 49.h,
                                      margin: EdgeInsets.only(
                                        left: 17.h,
                                        bottom: 4.v,
                                      ),
                                      hintText: "lbl_select".tr,
                                      items: addLandandwatermgmtSixModelObj
                                              ?.dropdownItemList ??
                                          [],
                                      onChanged: (value) {
                                        context
                                            .read<AddLandandwatermgmtSixBloc>()
                                            .add(ChangeDropDownEvent(
                                                value: value));
                                      },
                                    );
                                  },
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPrimary,
                                  height: 24.v,
                                  width: 27.h,
                                  radius: BorderRadius.circular(
                                    10.h,
                                  ),
                                  margin: EdgeInsets.only(bottom: 4.v),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 255.h,
                            margin: EdgeInsets.only(
                              top: 17.v,
                              right: 87.h,
                            ),
                            child: Text(
                              "msg_if_yes_what_type2".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 82.h,
                                top: 9.v,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 9.v,
                              ),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 3.v),
                                  BlocSelector<
                                      AddLandandwatermgmtSixBloc,
                                      AddLandandwatermgmtSixState,
                                      TextEditingController?>(
                                    selector: (state) =>
                                        state.continueController,
                                    builder: (context, continueController) {
                                      return CustomFloatingTextField(
                                        controller: continueController,
                                        labelText:
                                            "msg_add_undertaken_irrigation".tr,
                                        labelStyle: theme.textTheme.bodyLarge!,
                                        hintText:
                                            "msg_add_undertaken_irrigation".tr,
                                        borderDecoration:
                                            FloatingTextFormFieldStyleHelper
                                                .custom,
                                        filled: false,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 17.v),
                          Text(
                            "msg_type_and_name_of2".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          CustomElevatedButton(
                            text: "msg_add_irrigation_project".tr,
                            margin: EdgeInsets.only(
                              left: 82.h,
                              top: 31.v,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          Container(
                            width: 244.h,
                            margin: EdgeInsets.only(
                              top: 17.v,
                              right: 98.h,
                            ),
                            child: Text(
                              "msg_for_irrigation_schemes".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                          CustomElevatedButton(
                            text: "msg_add_implementing".tr,
                            margin: EdgeInsets.only(
                              left: 82.h,
                              top: 7.v,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          SizedBox(height: 17.v),
                          Text(
                            "msg_total_area_under".tr,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                          Container(
                            width: 343.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 17.h,
                              vertical: 12.v,
                            ),
                            decoration: AppDecoration.outlinePrimary2.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Text(
                              "lbl_area".tr,
                              style: CustomTextStyles.titleMediumBluegray40003,
                            ),
                          ),
                          SizedBox(height: 17.v),
                          Text(
                            "lbl_unit_of_area2".tr,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                          BlocSelector<
                              AddLandandwatermgmtSixBloc,
                              AddLandandwatermgmtSixState,
                              AddLandandwatermgmtSixModel?>(
                            selector: (state) =>
                                state.addLandandwatermgmtSixModelObj,
                            builder: (context, addLandandwatermgmtSixModelObj) {
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
                                items: addLandandwatermgmtSixModelObj
                                        ?.dropdownItemList1 ??
                                    [],
                                onChanged: (value) {
                                  context
                                      .read<AddLandandwatermgmtSixBloc>()
                                      .add(ChangeDropDown1Event(value: value));
                                },
                              );
                            },
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
                                  buttonTextStyle:
                                      CustomTextStyles.bodyLargePrimary_1,
                                ),
                              ),
                              Expanded(
                                child: CustomElevatedButton(
                                  text: "lbl_next".tr,
                                  margin: EdgeInsets.only(left: 1.h),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.v),
                          CustomElevatedButton(
                            text: "lbl_save".tr,
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 85.h,
                        top: 63.v,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomIconButton(
                                      height: 31.v,
                                      width: 32.h,
                                      padding: EdgeInsets.all(8.h),
                                      decoration:
                                          IconButtonStyleHelper.fillPrimary,
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgCheckmark,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 16.v,
                                        bottom: 13.v,
                                      ),
                                      child: SizedBox(
                                        width: 54.h,
                                        child: Divider(
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.v),
                              Text(
                                "lbl_step_1".tr,
                                style: CustomTextStyles.bodyLargeBluegray90001,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 16.v,
                                      bottom: 13.v,
                                    ),
                                    child: SizedBox(
                                      width: 54.h,
                                      child: Divider(),
                                    ),
                                  ),
                                  CustomIconButton(
                                    height: 31.v,
                                    width: 32.h,
                                    padding: EdgeInsets.all(8.h),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgCheckmark,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "lbl_step_2".tr,
                                  style:
                                      CustomTextStyles.bodyLargeBluegray40003,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      decoration: AppDecoration.fillBlack,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 1.h,
                          bottom: 22.v,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 11.h),
                        decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder6,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                "msg_add_irrigation_project2".tr,
                                style: CustomTextStyles.titleMediumSemiBold,
                              ),
                            ),
                            BlocSelector<AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState, bool?>(
                              selector: (state) => state.trash,
                              builder: (context, trash) {
                                return CustomCheckboxButton(
                                  text: "msg_public_irrigation".tr,
                                  value: trash,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 36.v,
                                    right: 84.h,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddLandandwatermgmtSixBloc>()
                                        .add(ChangeCheckBoxEvent(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController,
                              builder: (context, balancehistoryController) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 13.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController,
                                  labelText: "msg_public_irrigation".tr,
                                  labelStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  hintText: "msg_public_irrigation".tr,
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                );
                              },
                            ),
                            BlocSelector<
                                AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState,
                                TextEditingController?>(
                              selector: (state) => state.arrowdownController,
                              builder: (context, arrowdownController) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 15.v,
                                    right: 5.h,
                                  ),
                                  controller: arrowdownController,
                                  labelText: "msg_select_membership".tr,
                                  labelStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  hintText: "msg_select_membership".tr,
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  suffix: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10.h,
                                      ),
                                    ),
                                    child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowdownPrimary,
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    maxHeight: 66.v,
                                  ),
                                );
                              },
                            ),
                            BlocSelector<AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState, bool?>(
                              selector: (state) => state.communityScheme,
                              builder: (context, communityScheme) {
                                return CustomCheckboxButton(
                                  text: "msg_community_scheme".tr,
                                  value: communityScheme,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 14.v,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddLandandwatermgmtSixBloc>()
                                        .add(
                                            ChangeCheckBox1Event(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController1,
                              builder: (context, balancehistoryController1) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 13.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController1,
                                  labelText: "msg_community_scheme".tr,
                                  labelStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  hintText: "msg_community_scheme".tr,
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                );
                              },
                            ),
                            BlocSelector<
                                AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState,
                                TextEditingController?>(
                              selector: (state) => state.arrowdownoneController,
                              builder: (context, arrowdownoneController) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 15.v,
                                    right: 5.h,
                                  ),
                                  controller: arrowdownoneController,
                                  labelText: "msg_select_membership".tr,
                                  labelStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  hintText: "msg_select_membership".tr,
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  suffix: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10.h,
                                      ),
                                    ),
                                    child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowdownPrimary,
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    maxHeight: 66.v,
                                  ),
                                );
                              },
                            ),
                            BlocSelector<AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState, bool?>(
                              selector: (state) => state.trashone,
                              builder: (context, trashone) {
                                return CustomCheckboxButton(
                                  text: "msg_private_on_farm".tr,
                                  value: trashone,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 14.v,
                                    right: 84.h,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddLandandwatermgmtSixBloc>()
                                        .add(
                                            ChangeCheckBox2Event(value: value));
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.h,
                                top: 13.v,
                              ),
                              child: Text(
                                "msg_private_on_farm".tr,
                                style: CustomTextStyles.labelMediumPrimary_1,
                              ),
                            ),
                            BlocSelector<
                                AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState,
                                TextEditingController?>(
                              selector: (state) => state.schemevalueController,
                              builder: (context, schemevalueController) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                                  controller: schemevalueController,
                                  labelText: "lbl_scheme".tr,
                                  labelStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  hintText: "lbl_scheme".tr,
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                );
                              },
                            ),
                            BlocSelector<
                                AddLandandwatermgmtSixBloc,
                                AddLandandwatermgmtSixState,
                                TextEditingController?>(
                              selector: (state) => state.arrowdowntwoController,
                              builder: (context, arrowdowntwoController) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 15.v,
                                    right: 5.h,
                                  ),
                                  controller: arrowdowntwoController,
                                  labelText: "msg_select_membership".tr,
                                  labelStyle:
                                      CustomTextStyles.titleMediumBluegray40003,
                                  hintText: "msg_select_membership".tr,
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
                                      svgPath:
                                          ImageConstant.imgArrowdownPrimary,
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    maxHeight: 66.v,
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.h,
                                top: 14.v,
                                bottom: 31.v,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25.h,
                                      vertical: 12.v,
                                    ),
                                    decoration:
                                        AppDecoration.fillPrimary.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder6,
                                    ),
                                    child: Text(
                                      "lbl_reset".tr,
                                      style: CustomTextStyles.bodyLarge16,
                                    ),
                                  ),
                                  CustomElevatedButton(
                                    width: 95.h,
                                    text: "lbl_add".tr,
                                    buttonStyle:
                                        CustomButtonStyles.fillPrimaryTL6,
                                    buttonTextStyle:
                                        CustomTextStyles.bodyLarge16,
                                  ),
                                  CustomOutlinedButton(
                                    width: 95.h,
                                    text: "lbl_close".tr,
                                  ),
                                ],
                              ),
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
        ),
      ),
    );
  }
}
