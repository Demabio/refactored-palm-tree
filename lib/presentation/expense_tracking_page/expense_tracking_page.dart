import 'bloc/expense_tracking_bloc.dart';
import 'models/expense_tracking_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class ExpenseTrackingPage extends StatefulWidget {
  const ExpenseTrackingPage({Key? key})
      : super(
          key: key,
        );

  @override
  ExpenseTrackingPageState createState() => ExpenseTrackingPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ExpenseTrackingBloc>(
      create: (context) => ExpenseTrackingBloc(ExpenseTrackingState(
        expenseTrackingModelObj: ExpenseTrackingModel(),
      ))
        ..add(ExpenseTrackingInitialEvent()),
      child: ExpenseTrackingPage(),
    );
  }
}

class ExpenseTrackingPageState extends State<ExpenseTrackingPage>
    with AutomaticKeepAliveClientMixin<ExpenseTrackingPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ExpenseTrackingBloc, ExpenseTrackingState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray5001,
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 21.v,
                        right: 16.h,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9.h,
                              vertical: 15.v,
                            ),
                            decoration: AppDecoration.fillBlueA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5.v),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.h),
                                        child: Text(
                                          "lbl_total_expense".tr,
                                          style:
                                              CustomTextStyles.bodyLargeInter16,
                                        ),
                                      ),
                                      SizedBox(height: 12.v),
                                      Text(
                                        "lbl_2145_00".tr,
                                        style: CustomTextStyles
                                            .displaySmallInterWhiteA700,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.h,
                                          top: 14.v,
                                        ),
                                        child: Text(
                                          "msg_30_from_transfer".tr,
                                          style:
                                              CustomTextStyles.bodyLargeInter16,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.h,
                                          top: 11.v,
                                        ),
                                        child: Text(
                                          "lbl_70_from_salary".tr,
                                          style:
                                              CustomTextStyles.bodyLargeInter16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 8.v,
                                    right: 15.h,
                                    bottom: 7.v,
                                  ),
                                  child: SizedBox(
                                    height: 131.adaptSize,
                                    width: 131.adaptSize,
                                    child: CircularProgressIndicator(
                                      value: 0.5,
                                      backgroundColor:
                                          appTheme.whiteA700.withOpacity(0.4),
                                      color: appTheme.whiteA700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 28.v),
                          SizedBox(
                            height: 531.v,
                            width: 396.h,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 99.h,
                                    margin: EdgeInsets.only(left: 29.h),
                                    child: Text(
                                      "msg_recent_transaction".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .bodyLargeInterBlack900
                                          .copyWith(
                                        height: 1.61,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomIconButton(
                                            height: 56.adaptSize,
                                            width: 56.adaptSize,
                                            padding: EdgeInsets.all(16.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlueTL5,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowgrowthsolid,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 5.v,
                                              bottom: 2.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_salary".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeInterOnPrimaryContainer,
                                                ),
                                                SizedBox(height: 9.v),
                                                Text(
                                                  "lbl_may_16_2022".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumInterBluegray400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 16.v,
                                              bottom: 17.v,
                                            ),
                                            child: Text(
                                              "lbl_20002".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterGreen600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomIconButton(
                                            height: 56.adaptSize,
                                            width: 56.adaptSize,
                                            padding: EdgeInsets.all(16.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlueTL5,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowgrowthsolidRed700,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 5.v,
                                              bottom: 2.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_light_bill".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeInterOnPrimaryContainer,
                                                ),
                                                SizedBox(height: 9.v),
                                                Text(
                                                  "lbl_may_14_2022".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumInterBluegray400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 16.v,
                                              bottom: 17.v,
                                            ),
                                            child: Text(
                                              "lbl_180".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterRed700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomIconButton(
                                            height: 56.adaptSize,
                                            width: 56.adaptSize,
                                            padding: EdgeInsets.all(16.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlueTL5,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowgrowthsolidRed700,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 4.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_house_rent".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeInterOnPrimaryContainer,
                                                ),
                                                SizedBox(height: 11.v),
                                                Text(
                                                  "lbl_may_10_2022".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumInterBluegray400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 16.v,
                                              bottom: 17.v,
                                            ),
                                            child: Text(
                                              "lbl_550".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterRed700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomIconButton(
                                            height: 56.adaptSize,
                                            width: 56.adaptSize,
                                            padding: EdgeInsets.all(16.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlueTL5,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowgrowthsolidRed700,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 5.v,
                                              bottom: 2.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_loan_interests".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeInterOnPrimaryContainer,
                                                ),
                                                SizedBox(height: 9.v),
                                                Text(
                                                  "lbl_may_04_2022".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumInterBluegray400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 16.v,
                                              bottom: 17.v,
                                            ),
                                            child: Text(
                                              "lbl_240".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterRed700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomIconButton(
                                            height: 56.adaptSize,
                                            width: 56.adaptSize,
                                            padding: EdgeInsets.all(16.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlueTL5,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowgrowthsolidGreen600,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 5.v,
                                              bottom: 2.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_salary".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeInterOnPrimaryContainer,
                                                ),
                                                SizedBox(height: 9.v),
                                                Text(
                                                  "lbl_march_18_2022".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumInterBluegray400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 16.v,
                                              bottom: 17.v,
                                            ),
                                            child: Text(
                                              "lbl_20002".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterGreen600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomIconButton(
                                            height: 56.adaptSize,
                                            width: 56.adaptSize,
                                            padding: EdgeInsets.all(16.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlueTL5,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowgrowthsolidRed700,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 4.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_house_rent".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeInterOnPrimaryContainer,
                                                ),
                                                SizedBox(height: 11.v),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "lbl_march_10_2022".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumInterBluegray400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 16.v,
                                              bottom: 17.v,
                                            ),
                                            child: Text(
                                              "lbl_550".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterRed700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomIconButton(
                                            height: 56.adaptSize,
                                            width: 56.adaptSize,
                                            padding: EdgeInsets.all(16.h),
                                            decoration: IconButtonStyleHelper
                                                .fillBlueTL5,
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowgrowthsolidRed700,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 5.v,
                                              bottom: 3.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_loan_interests".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeInterOnPrimaryContainer,
                                                ),
                                                SizedBox(height: 8.v),
                                                Text(
                                                  "lbl_march_04_2022".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumInterBluegray400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 16.v,
                                              bottom: 17.v,
                                            ),
                                            child: Text(
                                              "lbl_240".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterRed700,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
