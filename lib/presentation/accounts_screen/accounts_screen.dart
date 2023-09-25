import '../accounts_screen/widgets/userbalance_item_widget.dart';
import 'bloc/accounts_bloc.dart';
import 'models/accounts_model.dart';
import 'models/userbalance_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_circleimage.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountsBloc>(
      create: (context) => AccountsBloc(AccountsState(
        accountsModelObj: AccountsModel(),
      ))
        ..add(AccountsInitialEvent()),
      child: AccountsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray100,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 7.v),
                decoration: AppDecoration.fillWhiteA,
                child: Column(
                  children: [
                    CustomAppBar(
                      height: 35.v,
                      leadingWidth: 48.h,
                      leading: AppbarImage(
                        svgPath: ImageConstant.imgMenuBlueGray900,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          top: 5.v,
                          bottom: 6.v,
                        ),
                      ),
                      centerTitle: true,
                      title: AppbarSubtitle(
                        text: "lbl_accounts".tr,
                      ),
                      actions: [
                        AppbarCircleimage(
                          imagePath: ImageConstant.imgEllipse37,
                          margin: EdgeInsets.symmetric(horizontal: 24.h),
                        ),
                      ],
                    ),
                    BlocSelector<AccountsBloc, AccountsState,
                        TextEditingController?>(
                      selector: (state) => state.searchController,
                      builder: (context, searchController) {
                        return CustomSearchView(
                          margin: EdgeInsets.fromLTRB(24.h, 20.v, 24.h, 13.v),
                          controller: searchController,
                          hintText: "msg_search_for_something".tr,
                          hintStyle:
                              CustomTextStyles.bodyMediumInterBluegray40003,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
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
                          contentPadding: EdgeInsets.only(
                            top: 12.v,
                            right: 30.h,
                            bottom: 12.v,
                          ),
                          borderDecoration:
                              SearchViewStyleHelper.fillPrimaryContainerTL20,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 24.h,
                      right: 24.h,
                      bottom: 5.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocSelector<AccountsBloc, AccountsState,
                            AccountsModel?>(
                          selector: (state) => state.accountsModelObj,
                          builder: (context, accountsModelObj) {
                            return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 86.v,
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.h,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: accountsModelObj
                                      ?.userbalanceItemList.length ??
                                  0,
                              itemBuilder: (context, index) {
                                UserbalanceItemModel model = accountsModelObj
                                        ?.userbalanceItemList[index] ??
                                    UserbalanceItemModel();
                                return UserbalanceItemWidget(
                                  model,
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(height: 22.v),
                        Text(
                          "msg_last_transaction".tr,
                          style: CustomTextStyles.titleMediumInterBluegray800,
                        ),
                        SizedBox(height: 16.v),
                        Container(
                          padding: EdgeInsets.all(20.h),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    decoration: IconButtonStyleHelper
                                        .fillPrimaryContainerTL12,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgRenew1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      top: 6.v,
                                      bottom: 3.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "msg_spotify_subscription".tr,
                                          style: CustomTextStyles
                                              .titleSmallInterBluegray900Medium,
                                        ),
                                        SizedBox(height: 2.v),
                                        Text(
                                          "lbl_25_jan_2021".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray40003,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 14.v,
                                    ),
                                    child: Text(
                                      "lbl_150".tr,
                                      style: CustomTextStyles
                                          .labelLargeInterRed700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    decoration: IconButtonStyleHelper
                                        .fillPrimaryContainerTL12,
                                    child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgSettingsIndigo600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      top: 5.v,
                                      bottom: 3.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_mobile_service".tr,
                                          style: CustomTextStyles
                                              .titleSmallInterBluegray900Medium,
                                        ),
                                        SizedBox(height: 3.v),
                                        Text(
                                          "lbl_25_jan_2021".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray40003,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 14.v,
                                    ),
                                    child: Text(
                                      "lbl_340".tr,
                                      style: CustomTextStyles
                                          .labelLargeInterRed700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    decoration: IconButtonStyleHelper
                                        .fillPrimaryContainerTL12,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgUser21,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      top: 6.v,
                                      bottom: 3.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_emilly_wilson".tr,
                                          style: CustomTextStyles
                                              .titleSmallInterBluegray900Medium,
                                        ),
                                        SizedBox(height: 2.v),
                                        Text(
                                          "lbl_25_jan_2021".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray40003,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 14.v,
                                    ),
                                    child: Text(
                                      "lbl_780".tr,
                                      style: CustomTextStyles
                                          .labelLargeInterGreen600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "lbl_my_card".tr,
                              style:
                                  CustomTextStyles.titleMediumInterBluegray900,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.v),
                              child: Text(
                                "lbl_see_all".tr,
                                style:
                                    CustomTextStyles.titleSmallInterBluegray900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.v),
                        Container(
                          decoration: AppDecoration.fillIndigo.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 23.h,
                                    top: 20.v,
                                    right: 27.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "lbl_balance".tr,
                                            style: CustomTextStyles
                                                .bodySmallWhiteA700,
                                          ),
                                          SizedBox(height: 1.v),
                                          Text(
                                            "lbl_5_756".tr,
                                            style: CustomTextStyles
                                                .bodyLargeInter_1,
                                          ),
                                        ],
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgChipcard,
                                        height: 33.adaptSize,
                                        width: 33.adaptSize,
                                        margin: EdgeInsets.only(bottom: 4.v),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 23.h,
                                  top: 23.v,
                                  right: 70.h,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_card_holder".tr,
                                          style: CustomTextStyles
                                              .bodySmallWhiteA70011,
                                        ),
                                        SizedBox(height: 1.v),
                                        Text(
                                          "lbl_eddy_cusuma".tr,
                                          style: CustomTextStyles
                                              .bodyMediumInterWhiteA700,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "lbl_valid_thru".tr,
                                            style: CustomTextStyles
                                                .bodySmallWhiteA70011,
                                          ),
                                          SizedBox(height: 1.v),
                                          Text(
                                            "lbl_12_22".tr,
                                            style: CustomTextStyles
                                                .bodyMediumInterWhiteA700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 18.v),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16.v),
                                decoration: AppDecoration.gradientWhiteAToWhiteA
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderBL15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3.v),
                                      child: Text(
                                        "msg_3778_1234".tr,
                                        style: CustomTextStyles.bodyLargeInter,
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgGroup17,
                                      height: 28.v,
                                      width: 41.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 22.v),
                        Text(
                          "msg_debit_credit_overview".tr,
                          style: CustomTextStyles.titleMediumInterBluegray900,
                        ),
                        SizedBox(height: 16.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 21.h,
                            vertical: 16.v,
                          ),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 1.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 12.adaptSize,
                                      width: 12.adaptSize,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 1.v),
                                      decoration: BoxDecoration(
                                        color: appTheme.indigo600,
                                        borderRadius: BorderRadius.circular(
                                          4.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text(
                                        "lbl_debit".tr,
                                        style: CustomTextStyles
                                            .bodySmallBluegray40003,
                                      ),
                                    ),
                                    Container(
                                      height: 12.adaptSize,
                                      width: 12.adaptSize,
                                      margin: EdgeInsets.only(
                                        left: 20.h,
                                        top: 1.v,
                                        bottom: 1.v,
                                      ),
                                      decoration: BoxDecoration(
                                        color: appTheme.indigo200,
                                        borderRadius: BorderRadius.circular(
                                          4.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text(
                                        "lbl_credit".tr,
                                        style: CustomTextStyles
                                            .bodySmallBluegray40003,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 16.v,
                                  right: 1.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgGroup514Indigo200,
                                        height: 153.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(right: 9.h),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgGroup514Indigo200,
                                        height: 120.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(
                                          left: 9.h,
                                          top: 33.v,
                                          right: 9.h,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgGroup516,
                                        height: 75.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(
                                          left: 9.h,
                                          top: 78.v,
                                          right: 9.h,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgGroup514Indigo200,
                                        height: 129.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(
                                          left: 9.h,
                                          top: 24.v,
                                          right: 9.h,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgGroup514Indigo200,
                                        height: 136.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(
                                          left: 9.h,
                                          top: 17.v,
                                          right: 9.h,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgGroup516,
                                        height: 96.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(
                                          left: 9.h,
                                          top: 57.v,
                                          right: 9.h,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgGroup514Indigo200,
                                        height: 143.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(
                                          left: 9.h,
                                          top: 10.v,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 3.h,
                                  top: 10.v,
                                  right: 7.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "lbl_sat".tr,
                                      style: CustomTextStyles
                                          .bodySmallBluegray40003,
                                    ),
                                    Text(
                                      "lbl_sun".tr,
                                      style: CustomTextStyles
                                          .bodySmallBluegray40003,
                                    ),
                                    Text(
                                      "lbl_mon".tr,
                                      style: CustomTextStyles
                                          .bodySmallBluegray40003,
                                    ),
                                    Text(
                                      "lbl_tue".tr,
                                      style: CustomTextStyles
                                          .bodySmallBluegray40003,
                                    ),
                                    Text(
                                      "lbl_wed".tr,
                                      style: CustomTextStyles
                                          .bodySmallBluegray40003,
                                    ),
                                    Text(
                                      "lbl_thu".tr,
                                      style: CustomTextStyles
                                          .bodySmallBluegray40003,
                                    ),
                                    Text(
                                      "lbl_fri".tr,
                                      style: CustomTextStyles
                                          .bodySmallBluegray40003,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 22.v),
                        Text(
                          "lbl_invoices_sent".tr,
                          style: CustomTextStyles.titleMediumInterBluegray900,
                        ),
                        SizedBox(height: 16.v),
                        Container(
                          padding: EdgeInsets.all(20.h),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    decoration: IconButtonStyleHelper
                                        .fillPrimaryContainerTL12,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgApple21,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      top: 6.v,
                                      bottom: 2.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_apple_store".tr,
                                          style: CustomTextStyles
                                              .titleSmallInterBluegray800,
                                        ),
                                        SizedBox(height: 3.v),
                                        Text(
                                          "lbl_5h_ago".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray40003,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 12.v,
                                    ),
                                    child: Text(
                                      "lbl_450".tr,
                                      style: CustomTextStyles
                                          .titleSmallInterIndigo600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    decoration: IconButtonStyleHelper
                                        .fillPrimaryContainerTL12,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgUser21,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      top: 5.v,
                                      bottom: 2.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_michael".tr,
                                          style: CustomTextStyles
                                              .titleSmallInterBluegray800,
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "lbl_2_days_ago".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray40003,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 12.v,
                                    ),
                                    child: Text(
                                      "lbl_160".tr,
                                      style: CustomTextStyles
                                          .titleSmallInterIndigo600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    decoration: IconButtonStyleHelper
                                        .fillPrimaryContainerTL12,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgPlaystation1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      top: 6.v,
                                      bottom: 2.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_playstation".tr,
                                          style: CustomTextStyles
                                              .titleSmallInterBluegray800,
                                        ),
                                        SizedBox(height: 3.v),
                                        Text(
                                          "lbl_5_days_ago".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray40003,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 12.v,
                                    ),
                                    child: Text(
                                      "lbl_1085".tr,
                                      style: CustomTextStyles
                                          .titleSmallInterIndigo600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomIconButton(
                                    height: 45.adaptSize,
                                    width: 45.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    decoration: IconButtonStyleHelper
                                        .fillPrimaryContainerTL12,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgUser21,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      top: 5.v,
                                      bottom: 2.v,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_william".tr,
                                          style: CustomTextStyles
                                              .titleSmallInterBluegray800,
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "lbl_10_days_ago".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray40003,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.v,
                                      bottom: 12.v,
                                    ),
                                    child: Text(
                                      "lbl_90".tr,
                                      style: CustomTextStyles
                                          .titleSmallInterIndigo600,
                                    ),
                                  ),
                                ],
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
    );
  }
}
