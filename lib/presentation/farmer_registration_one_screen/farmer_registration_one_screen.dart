import 'bloc/farmer_registration_one_bloc.dart';
import 'models/farmer_registration_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class FarmerRegistrationOneScreen extends StatelessWidget {
  const FarmerRegistrationOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmerRegistrationOneBloc>(
      create: (context) => FarmerRegistrationOneBloc(FarmerRegistrationOneState(
        farmerRegistrationOneModelObj: FarmerRegistrationOneModel(),
      ))
        ..add(FarmerRegistrationOneInitialEvent()),
      child: FarmerRegistrationOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<FarmerRegistrationOneBloc, FarmerRegistrationOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              height: 57.v,
              leadingWidth: 48.h,
              leading: AppbarImage(
                svgPath: ImageConstant.imgMenu,
                margin: EdgeInsets.only(
                  left: 24.h,
                  top: 12.v,
                  bottom: 21.v,
                ),
              ),
              centerTitle: true,
              title: AppbarSubtitle1(
                text: "msg_farmer_registration".tr,
              ),
            ),
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 14.v),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 22.h,
                    right: 10.h,
                    bottom: 5.v,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1308.v,
                        width: 343.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomIconButton(
                                              height: 31.v,
                                              width: 32.h,
                                              padding: EdgeInsets.all(9.h),
                                              decoration: IconButtonStyleHelper
                                                  .fillPrimary,
                                              child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCheckmark,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 13.h),
                                              child: SizedBox(
                                                height: 119.v,
                                                child: VerticalDivider(
                                                  width: 2.h,
                                                  thickness: 2.v,
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            bottom: 42.v,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "msg_farmers_identification".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBluegray90001,
                                              ),
                                              SizedBox(height: 51.v),
                                              CustomElevatedButton(
                                                height: 33.v,
                                                width: 177.h,
                                                text: "lbl_edit_details".tr,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .titleMediumWhiteA700,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomIconButton(
                                              height: 31.v,
                                              width: 32.h,
                                              padding: EdgeInsets.all(9.h),
                                              decoration: IconButtonStyleHelper
                                                  .fillPrimary,
                                              child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCheckmark,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 13.h),
                                              child: SizedBox(
                                                height: 119.v,
                                                child: VerticalDivider(
                                                  width: 2.h,
                                                  thickness: 2.v,
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 2.v,
                                            bottom: 42.v,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "msg_primary_farm_holding".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBluegray90001,
                                              ),
                                              SizedBox(height: 48.v),
                                              CustomElevatedButton(
                                                height: 33.v,
                                                width: 177.h,
                                                text: "lbl_edit_details".tr,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .titleMediumWhiteA700,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 40.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomIconButton(
                                                height: 31.v,
                                                width: 32.h,
                                                padding: EdgeInsets.all(9.h),
                                                decoration:
                                                    IconButtonStyleHelper
                                                        .fillPrimary,
                                                child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgCheckmark,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 13.h),
                                                child: SizedBox(
                                                  height: 119.v,
                                                  child: VerticalDivider(
                                                    width: 2.h,
                                                    thickness: 2.v,
                                                    color: theme
                                                        .colorScheme.primary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 2.v,
                                              bottom: 42.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "msg_add_other_farm_holdings"
                                                      .tr,
                                                  style: CustomTextStyles
                                                      .titleMediumBluegray90001,
                                                ),
                                                SizedBox(height: 48.v),
                                                CustomElevatedButton(
                                                  height: 33.v,
                                                  width: 177.h,
                                                  text: "lbl_edit_details".tr,
                                                  buttonTextStyle:
                                                      CustomTextStyles
                                                          .titleMediumWhiteA700,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomIconButton(
                                              height: 31.v,
                                              width: 32.h,
                                              padding: EdgeInsets.all(9.h),
                                              decoration: IconButtonStyleHelper
                                                  .fillPrimary,
                                              child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCheckmark,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 13.h),
                                              child: SizedBox(
                                                height: 119.v,
                                                child: VerticalDivider(
                                                  width: 2.h,
                                                  thickness: 2.v,
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 2.v,
                                            bottom: 42.v,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "msg_crop_agriculture".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBluegray90001,
                                              ),
                                              SizedBox(height: 48.v),
                                              CustomElevatedButton(
                                                height: 33.v,
                                                width: 177.h,
                                                text: "lbl_edit_details".tr,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .titleMediumWhiteA700,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomIconButton(
                                              height: 31.v,
                                              width: 32.h,
                                              padding: EdgeInsets.all(9.h),
                                              child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCheckmark,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 13.h),
                                              child: SizedBox(
                                                height: 119.v,
                                                child: VerticalDivider(
                                                  width: 2.h,
                                                  thickness: 2.v,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            bottom: 42.v,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "lbl_livestock".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBluegray90001,
                                              ),
                                              SizedBox(height: 51.v),
                                              CustomElevatedButton(
                                                height: 33.v,
                                                width: 177.h,
                                                text: "lbl_add_details".tr,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .titleMediumWhiteA700,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomIconButton(
                                              height: 31.v,
                                              width: 32.h,
                                              padding: EdgeInsets.all(9.h),
                                              child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCheckmark,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 13.h),
                                              child: SizedBox(
                                                height: 119.v,
                                                child: VerticalDivider(
                                                  width: 2.h,
                                                  thickness: 2.v,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 2.v,
                                            bottom: 42.v,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "lbl_aquaculture".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBluegray90001,
                                              ),
                                              SizedBox(height: 48.v),
                                              CustomElevatedButton(
                                                height: 33.v,
                                                width: 177.h,
                                                text: "lbl_add_details".tr,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .titleMediumWhiteA700,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 9.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomIconButton(
                                                height: 31.v,
                                                width: 32.h,
                                                padding: EdgeInsets.all(9.h),
                                                child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgCheckmark,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 13.h),
                                                child: SizedBox(
                                                  height: 119.v,
                                                  child: VerticalDivider(
                                                    width: 2.h,
                                                    thickness: 2.v,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 16.h,
                                                top: 2.v,
                                                bottom: 42.v,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "msg_farm_technology".tr,
                                                    style: CustomTextStyles
                                                        .titleMediumBluegray90001,
                                                  ),
                                                  SizedBox(height: 48.v),
                                                  CustomElevatedButton(
                                                    height: 33.v,
                                                    width: 177.h,
                                                    text: "lbl_add_details".tr,
                                                    buttonTextStyle:
                                                        CustomTextStyles
                                                            .titleMediumWhiteA700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomIconButton(
                                              height: 31.v,
                                              width: 32.h,
                                              padding: EdgeInsets.all(9.h),
                                              child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCheckmark,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 13.h),
                                              child: SizedBox(
                                                height: 119.v,
                                                child: VerticalDivider(
                                                  width: 2.h,
                                                  thickness: 2.v,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 2.v,
                                              bottom: 42.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "msg_land_and_water_management"
                                                      .tr,
                                                  style: CustomTextStyles
                                                      .titleMediumBluegray90001,
                                                ),
                                                SizedBox(height: 48.v),
                                                CustomElevatedButton(
                                                  height: 33.v,
                                                  width: 177.h,
                                                  text: "lbl_add_details".tr,
                                                  buttonTextStyle:
                                                      CustomTextStyles
                                                          .titleMediumWhiteA700,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomIconButton(
                                          height: 31.v,
                                          width: 32.h,
                                          margin: EdgeInsets.only(bottom: 77.v),
                                          padding: EdgeInsets.all(9.h),
                                          child: CustomImageView(
                                            svgPath: ImageConstant.imgCheckmark,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16.h),
                                          child: Column(
                                            children: [
                                              Text(
                                                "msg_financial_and_services".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBluegray90001,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  top: 51.v,
                                                  right: 4.h,
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 39.h,
                                                  vertical: 3.v,
                                                ),
                                                decoration: AppDecoration
                                                    .fillPrimary
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder10,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 1.v),
                                                    Text(
                                                      "lbl_add_details".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumWhiteA700,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomElevatedButton(
                              width: 343.h,
                              text: "lbl_save".tr,
                              margin: EdgeInsets.only(bottom: 10.v),
                              leftIcon: Container(
                                margin: EdgeInsets.only(right: 10.h),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgSaveWhiteA700,
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7.v),
                      CustomOutlinedButton(
                        text: "lbl_discard".tr,
                        leftIcon: Container(
                          margin: EdgeInsets.only(right: 10.h),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgTrashPrimary,
                          ),
                        ),
                        buttonStyle: CustomButtonStyles.outlinePrimary,
                        buttonTextStyle: CustomTextStyles.bodyLargePrimary_2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
