import 'bloc/add_financialandservices_four_bloc.dart';
import 'models/add_financialandservices_four_model.dart';
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

class AddFinancialandservicesFourScreen extends StatelessWidget {
  const AddFinancialandservicesFourScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesFourBloc>(
      create: (context) =>
          AddFinancialandservicesFourBloc(AddFinancialandservicesFourState(
        addFinancialandservicesFourModelObj: AddFinancialandservicesFourModel(),
      ))
            ..add(AddFinancialandservicesFourInitialEvent()),
      child: AddFinancialandservicesFourScreen(),
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
            text: "msg_financial_and_services2".tr,
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
                            "msg_financial_livelihood".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          Container(
                            width: 297.h,
                            margin: EdgeInsets.only(
                              top: 20.v,
                              right: 45.h,
                            ),
                            child: Text(
                              "msg_what_are_your_main4".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                          CustomElevatedButton(
                            text: "msg_add_financial_source".tr,
                            margin: EdgeInsets.only(
                              left: 82.h,
                              top: 42.v,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          Container(
                            width: 306.h,
                            margin: EdgeInsets.only(
                              top: 17.v,
                              right: 36.h,
                            ),
                            child: Text(
                              "msg_percentage_of_household2".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                          ),
                          SizedBox(height: 4.v),
                          Container(
                            width: 343.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 17.h,
                              vertical: 10.v,
                            ),
                            decoration: AppDecoration.outlinePrimary2.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 4.v),
                                Text(
                                  "lbl_select".tr,
                                  style:
                                      CustomTextStyles.titleMediumBluegray40003,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.v),
                          Text(
                            "msg_cooperative_groups".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          Container(
                            width: 270.h,
                            margin: EdgeInsets.only(
                              top: 17.v,
                              right: 72.h,
                            ),
                            child: Text(
                              "msg_do_you_belong_to2".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.labelMediumPrimary_1,
                            ),
                          ),
                          SizedBox(height: 3.v),
                          Container(
                            width: 343.h,
                            padding: EdgeInsets.symmetric(vertical: 10.v),
                            decoration: AppDecoration.outlinePrimary2.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: BlocSelector<
                                AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState,
                                AddFinancialandservicesFourModel?>(
                              selector: (state) =>
                                  state.addFinancialandservicesFourModelObj,
                              builder: (context,
                                  addFinancialandservicesFourModelObj) {
                                return CustomDropDown(
                                  icon: Container(
                                    margin: EdgeInsets.only(left: 30.h),
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
                                  margin: EdgeInsets.only(
                                    left: 17.h,
                                    bottom: 4.v,
                                  ),
                                  hintText: "lbl_select".tr,
                                  items: addFinancialandservicesFourModelObj
                                          ?.dropdownItemList ??
                                      [],
                                  onChanged: (value) {
                                    context
                                        .read<AddFinancialandservicesFourBloc>()
                                        .add(ChangeDropDownEvent(value: value));
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: 302.h,
                            margin: EdgeInsets.only(
                              top: 15.v,
                              right: 40.h,
                            ),
                            child: Text(
                              "msg_if_yes_which_groups_farmer".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 261.h,
                              margin: EdgeInsets.only(
                                left: 82.h,
                                top: 34.v,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.h,
                                vertical: 10.v,
                              ),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 2.v),
                                  Text(
                                    "msg_add_cooperative".tr,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 17.v),
                          Text(
                            "msg_financial_services".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          Container(
                            width: 332.h,
                            margin: EdgeInsets.only(
                              top: 18.v,
                              right: 11.h,
                            ),
                            child: Text(
                              "msg_where_do_you_access".tr,
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                          CustomElevatedButton(
                            text: "msg_add_financial_services".tr,
                            margin: EdgeInsets.only(
                              left: 82.h,
                              top: 39.v,
                            ),
                            alignment: Alignment.centerRight,
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
                                        child: Divider(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.v),
                              Text(
                                "lbl_step_1".tr,
                                style: CustomTextStyles.bodyLargeBluegray40003,
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
                                "msg_add_cooperative2".tr,
                                style: CustomTextStyles.titleMediumSemiBold,
                              ),
                            ),
                            BlocSelector<AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState, bool?>(
                              selector: (state) => state.trash,
                              builder: (context, trash) {
                                return CustomCheckboxButton(
                                  text: "msg_common_interest2".tr,
                                  value: trash,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 36.v,
                                    right: 85.h,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddFinancialandservicesFourBloc>()
                                        .add(ChangeCheckBoxEvent(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController,
                              builder: (context, balancehistoryController) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 3.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController,
                                  labelText: "msg_common_interest2".tr,
                                  labelStyle: theme.textTheme.titleMedium!,
                                  hintText: "msg_common_interest2".tr,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.h, 13.v, 16.h, 12.v),
                                );
                              },
                            ),
                            BlocSelector<AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState, bool?>(
                              selector: (state) => state.trashone,
                              builder: (context, trashone) {
                                return CustomCheckboxButton(
                                  text: "msg_community_based".tr,
                                  value: trashone,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 5.v,
                                    right: 18.h,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddFinancialandservicesFourBloc>()
                                        .add(
                                            ChangeCheckBox1Event(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController1,
                              builder: (context, balancehistoryController1) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 3.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController1,
                                  labelText: "msg_community_based".tr,
                                  labelStyle: theme.textTheme.titleMedium!,
                                  hintText: "msg_community_based".tr,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.h, 13.v, 16.h, 12.v),
                                );
                              },
                            ),
                            BlocSelector<AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState, bool?>(
                              selector: (state) => state.trashtwo,
                              builder: (context, trashtwo) {
                                return CustomCheckboxButton(
                                  text: "msg_faith_based_organizations".tr,
                                  value: trashtwo,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 5.v,
                                    right: 70.h,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddFinancialandservicesFourBloc>()
                                        .add(
                                            ChangeCheckBox2Event(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController2,
                              builder: (context, balancehistoryController2) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 3.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController2,
                                  labelText: "msg_faith_based_organizations".tr,
                                  labelStyle: theme.textTheme.titleMedium!,
                                  hintText: "msg_faith_based_organizations".tr,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.h, 13.v, 16.h, 12.v),
                                );
                              },
                            ),
                            BlocSelector<AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState, bool?>(
                              selector: (state) => state.trashthree,
                              builder: (context, trashthree) {
                                return CustomCheckboxButton(
                                  text: "lbl_marketing_group".tr,
                                  value: trashthree,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 5.v,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddFinancialandservicesFourBloc>()
                                        .add(
                                            ChangeCheckBox3Event(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController3,
                              builder: (context, balancehistoryController3) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 3.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController3,
                                  labelText: "lbl_marketing_group".tr,
                                  labelStyle: theme.textTheme.titleMedium!,
                                  hintText: "lbl_marketing_group".tr,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.h, 13.v, 16.h, 12.v),
                                );
                              },
                            ),
                            BlocSelector<AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState, bool?>(
                              selector: (state) => state.trashfour,
                              builder: (context, trashfour) {
                                return CustomCheckboxButton(
                                  text: "lbl_producer_group".tr,
                                  value: trashfour,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 5.v,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddFinancialandservicesFourBloc>()
                                        .add(
                                            ChangeCheckBox4Event(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController4,
                              builder: (context, balancehistoryController4) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 3.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController4,
                                  labelText: "lbl_producer_group".tr,
                                  labelStyle: theme.textTheme.titleMedium!,
                                  hintText: "lbl_producer_group".tr,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.h, 13.v, 16.h, 12.v),
                                );
                              },
                            ),
                            BlocSelector<AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState, bool?>(
                              selector: (state) => state.trashfive,
                              builder: (context, trashfive) {
                                return CustomCheckboxButton(
                                  text: "msg_table_banking_group".tr,
                                  value: trashfive,
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 5.v,
                                  ),
                                  onChange: (value) {
                                    context
                                        .read<AddFinancialandservicesFourBloc>()
                                        .add(
                                            ChangeCheckBox5Event(value: value));
                                  },
                                );
                              },
                            ),
                            BlocSelector<
                                AddFinancialandservicesFourBloc,
                                AddFinancialandservicesFourState,
                                TextEditingController?>(
                              selector: (state) =>
                                  state.balancehistoryController5,
                              builder: (context, balancehistoryController5) {
                                return CustomFloatingTextField(
                                  margin: EdgeInsets.only(
                                    left: 5.h,
                                    top: 3.v,
                                    right: 5.h,
                                  ),
                                  controller: balancehistoryController5,
                                  labelText: "msg_table_banking_group".tr,
                                  labelStyle: theme.textTheme.titleMedium!,
                                  hintText: "msg_table_banking_group".tr,
                                  textInputAction: TextInputAction.done,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.h, 13.v, 16.h, 12.v),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.h,
                                top: 5.v,
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
