import '../main_landing_screen/widgets/main_landing_item_widget.dart';
import 'bloc/main_landing_bloc.dart';
import 'models/main_landing_item_model.dart';
import 'models/main_landing_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_3.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

class MainLandingScreen extends StatelessWidget {
  MainLandingScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<MainLandingBloc>(
      create: (context) => MainLandingBloc(MainLandingState(
        mainLandingModelObj: MainLandingModel(),
      ))
        ..add(MainLandingInitialEvent()),
      child: MainLandingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: 56.v,
          leadingWidth: 32.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgMenuBlack900,
            margin: EdgeInsets.only(
              left: 12.h,
              top: 17.v,
              bottom: 22.v,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle3(
            text: "lbl_shopsie".tr,
          ),
          actions: [
            AppbarImage1(
              svgPath: ImageConstant.imgSearchGray90001,
              margin: EdgeInsets.fromLTRB(15.h, 17.v, 20.h, 2.v),
            ),
            AppbarImage1(
              svgPath: ImageConstant.imgCart,
              margin: EdgeInsets.only(
                left: 9.h,
                top: 16.v,
                right: 20.h,
              ),
            ),
            AppbarImage1(
              svgPath: ImageConstant.imgUserGray90001,
              margin: EdgeInsets.fromLTRB(9.h, 17.v, 35.h, 2.v),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: 390.h,
            padding: EdgeInsets.symmetric(vertical: 4.v),
            child: Column(
              children: [
                SizedBox(height: 3.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: Column(
                        children: [
                          Container(
                            decoration: AppDecoration.fillGray20001,
                            child: Column(
                              children: [
                                SizedBox(height: 24.v),
                                SizedBox(
                                  height: 362.v,
                                  width: 360.h,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgImage61,
                                        height: 362.v,
                                        width: 360.h,
                                        radius: BorderRadius.vertical(
                                          top: Radius.circular(200.h),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 59.h,
                                            right: 59.h,
                                            bottom: 13.v,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "lbl_season_sale".tr,
                                                style: theme
                                                    .textTheme.displaySmall,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 4.v,
                                                  right: 10.h,
                                                ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "lbl_up_to".tr,
                                                        style: CustomTextStyles
                                                            .titleMediumLatoWhiteA700,
                                                      ),
                                                      TextSpan(
                                                        text: " ",
                                                      ),
                                                      TextSpan(
                                                        text: "lbl_60_off".tr,
                                                        style: CustomTextStyles
                                                            .displaySmallLatoGray20001,
                                                      ),
                                                    ],
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 32.v),
                                CustomImageView(
                                  svgPath: ImageConstant.imgUnion,
                                  height: 48.v,
                                  width: 134.h,
                                ),
                                SizedBox(height: 48.v),
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage60,
                                  height: 123.v,
                                  width: 390.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 68.v),
                          Text(
                            "lbl_trending_now".tr,
                            style: CustomTextStyles.bodyLargeLatoGray90001,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 32.v,
                                right: 53.h,
                              ),
                              child: Row(
                                children: [
                                  CustomElevatedButton(
                                    height: 32.v,
                                    width: 48.h,
                                    text: "lbl_all".tr,
                                    buttonStyle: CustomButtonStyles.fillIndigoA,
                                    buttonTextStyle:
                                        CustomTextStyles.bodyMediumWhiteA700_1,
                                  ),
                                  CustomElevatedButton(
                                    height: 32.v,
                                    width: 80.h,
                                    text: "lbl_dresses".tr,
                                    margin: EdgeInsets.only(left: 8.h),
                                    buttonStyle: CustomButtonStyles.fillGray,
                                    buttonTextStyle:
                                        theme.textTheme.bodyMedium!,
                                  ),
                                  CustomElevatedButton(
                                    height: 32.v,
                                    width: 103.h,
                                    text: "lbl_accessories".tr,
                                    margin: EdgeInsets.only(left: 8.h),
                                    buttonStyle: CustomButtonStyles.fillGray,
                                    buttonTextStyle:
                                        theme.textTheme.bodyMedium!,
                                  ),
                                  CustomElevatedButton(
                                    height: 32.v,
                                    width: 66.h,
                                    text: "lbl_dresses".tr,
                                    margin: EdgeInsets.only(left: 8.h),
                                    buttonStyle: CustomButtonStyles.fillGray,
                                    buttonTextStyle:
                                        theme.textTheme.bodyMedium!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                              left: 16.h,
                              top: 32.v,
                            ),
                            child: IntrinsicWidth(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgImage,
                                        height: 236.v,
                                        width: 6.h,
                                        radius: BorderRadius.circular(
                                          3.h,
                                        ),
                                        alignment: Alignment.centerRight,
                                      ),
                                      SizedBox(height: 11.v),
                                      Text(
                                        "msg_olive_plain_dress".tr,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                      SizedBox(height: 9.v),
                                      Text(
                                        "lbl_20_99".tr,
                                        style: CustomTextStyles
                                            .bodyMediumIndigoA200_1,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgImage236x1,
                                          height: 236.v,
                                          width: 1.h,
                                          radius: BorderRadius.circular(
                                            1.h,
                                          ),
                                          alignment: Alignment.centerRight,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 22.h,
                                            top: 10.v,
                                          ),
                                          child: Text(
                                            "lbl_shoes_on_heels".tr,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Text(
                                          "lbl_28_99".tr,
                                          style: CustomTextStyles
                                              .bodyMediumIndigoA200_1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgImage1,
                                          height: 236.v,
                                          width: 1.h,
                                          radius: BorderRadius.circular(
                                            1.h,
                                          ),
                                          alignment: Alignment.centerRight,
                                        ),
                                        SizedBox(height: 8.v),
                                        Text(
                                          "msg_olive_plain_dress".tr,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        SizedBox(height: 8.v),
                                        Text(
                                          "lbl_20_99".tr,
                                          style: CustomTextStyles
                                              .bodyMediumIndigoA200_1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 63.v),
                          Text(
                            "msg_actual_categories".tr,
                            style: CustomTextStyles.bodyLargeLatoGray90001,
                          ),
                          SizedBox(height: 32.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle7,
                            height: 386.v,
                            width: 358.h,
                          ),
                          SizedBox(height: 24.v),
                          Text(
                            "lbl_outerwear".tr,
                            style: CustomTextStyles.bodyMedium15,
                          ),
                          SizedBox(height: 10.v),
                          Text(
                            "msg_raincoats_sweaters".tr,
                            style: CustomTextStyles.bodySmallLatoGray50001,
                          ),
                          SizedBox(height: 24.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle7386x358,
                            height: 386.v,
                            width: 358.h,
                          ),
                          SizedBox(height: 24.v),
                          Text(
                            "lbl_leather_shoes".tr,
                            style: CustomTextStyles.bodyMedium15,
                          ),
                          SizedBox(height: 10.v),
                          Text(
                            "msg_shoes_sandals".tr,
                            style: CustomTextStyles.bodySmallLatoGray50001,
                          ),
                          SizedBox(height: 24.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle8,
                            height: 386.v,
                            width: 358.h,
                          ),
                          SizedBox(height: 25.v),
                          Text(
                            "lbl_light_dresses".tr,
                            style: CustomTextStyles.bodyMedium15,
                          ),
                          SizedBox(height: 9.v),
                          Text(
                            "msg_evening_casual".tr,
                            style: CustomTextStyles.bodySmallLatoGray50001,
                          ),
                          SizedBox(height: 49.v),
                          Text(
                            "msg_only_trusted_brands".tr,
                            style: CustomTextStyles.bodyLargeLatoGray90001,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 63.h,
                              top: 36.v,
                              right: 63.h,
                            ),
                            child: BlocSelector<MainLandingBloc,
                                MainLandingState, MainLandingModel?>(
                              selector: (state) => state.mainLandingModelObj,
                              builder: (context, mainLandingModelObj) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 59.v,
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 12.h,
                                    crossAxisSpacing: 12.h,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: mainLandingModelObj
                                          ?.mainLandingItemList.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    MainLandingItemModel model =
                                        mainLandingModelObj
                                                ?.mainLandingItemList[index] ??
                                            MainLandingItemModel();
                                    return MainLandingItemWidget(
                                      model,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 45.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 19.h,
                              vertical: 40.v,
                            ),
                            decoration: AppDecoration.fillOnPrimary,
                            child: Column(
                              children: [
                                SizedBox(height: 49.v),
                                Text(
                                  "lbl_new_arrival".tr,
                                  style: CustomTextStyles.displaySmallGray400,
                                ),
                                SizedBox(height: 6.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "lbl_fall_2021".tr,
                                    style: CustomTextStyles
                                        .bodyMediumBluegray10003,
                                  ),
                                ),
                                SizedBox(height: 69.v),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18.h),
                                  decoration:
                                      AppDecoration.outlineBlueGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderTL279,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 15.v),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.h),
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderTL279,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 8.v),
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgRectangle1381,
                                              height: 354.v,
                                              width: 292.h,
                                              radius: BorderRadius.vertical(
                                                top: Radius.circular(279.h),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.v),
                                CustomElevatedButton(
                                  height: 48.v,
                                  width: 174.h,
                                  text: "lbl_explore".tr,
                                  buttonStyle: CustomButtonStyles.fillWhiteA,
                                  buttonTextStyle:
                                      CustomTextStyles.bodyMediumIndigoA200_1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 44.v),
                          Text(
                            "msg_recomended_looks".tr,
                            style: CustomTextStyles.bodyLargeLatoGray90001,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 43.v,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "lbl_gender".tr,
                                    style: CustomTextStyles
                                        .titleSmallLatoGray60002,
                                  ),
                                  BlocSelector<MainLandingBloc,
                                      MainLandingState, MainLandingModel?>(
                                    selector: (state) =>
                                        state.mainLandingModelObj,
                                    builder: (context, mainLandingModelObj) {
                                      return CustomDropDown(
                                        width: 57.h,
                                        margin: EdgeInsets.only(left: 10.h),
                                        hintText: "lbl_female".tr,
                                        items: mainLandingModelObj
                                                ?.dropdownItemList ??
                                            [],
                                        prefix: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 2.v),
                                          child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgChevronright2,
                                          ),
                                        ),
                                        prefixConstraints: BoxConstraints(
                                          maxHeight: 17.v,
                                        ),
                                        onChanged: (value) {
                                          context.read<MainLandingBloc>().add(
                                              ChangeDropDownEvent(
                                                  value: value));
                                        },
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 24.h),
                                    child: Text(
                                      "lbl_style".tr,
                                      style: CustomTextStyles
                                          .titleSmallLatoGray60002,
                                    ),
                                  ),
                                  BlocSelector<MainLandingBloc,
                                      MainLandingState, MainLandingModel?>(
                                    selector: (state) =>
                                        state.mainLandingModelObj,
                                    builder: (context, mainLandingModelObj) {
                                      return CustomDropDown(
                                        width: 63.h,
                                        icon: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              -39.h, 1.v, 24.h, 3.v),
                                          child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgChevronright2,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(left: 10.h),
                                        hintText: "lbl_partywear".tr,
                                        items: mainLandingModelObj
                                                ?.dropdownItemList1 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<MainLandingBloc>().add(
                                              ChangeDropDown1Event(
                                                  value: value));
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 7.v,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.v),
                                    child: Text(
                                      "lbl_price_range".tr,
                                      style: CustomTextStyles
                                          .titleSmallLatoGray60002,
                                    ),
                                  ),
                                  BlocSelector<MainLandingBloc,
                                      MainLandingState, MainLandingModel?>(
                                    selector: (state) =>
                                        state.mainLandingModelObj,
                                    builder: (context, mainLandingModelObj) {
                                      return CustomDropDown(
                                        width: 31.h,
                                        icon: Container(
                                          margin: EdgeInsets.only(left: 2.h),
                                          child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgChevronright2,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(left: 10.h),
                                        hintText: "lbl_all".tr,
                                        items: mainLandingModelObj
                                                ?.dropdownItemList2 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<MainLandingBloc>().add(
                                              ChangeDropDown2Event(
                                                  value: value));
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 16.h,
                              top: 21.v,
                              right: 16.h,
                            ),
                            padding: EdgeInsets.all(6.h),
                            decoration: AppDecoration.outlineGray,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgRectangle1385,
                                  height: 407.v,
                                  width: 346.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 31.v,
                                  ),
                                  child: Text(
                                    "lbl_in_this_look".tr,
                                    style: CustomTextStyles.bodyMedium14,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 35.v,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgImage56x56,
                                        height: 56.adaptSize,
                                        width: 56.adaptSize,
                                        radius: BorderRadius.circular(
                                          28.h,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 16.h,
                                          top: 7.v,
                                          bottom: 7.v,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_43_90".tr,
                                              style:
                                                  CustomTextStyles.bodyMedium_1,
                                            ),
                                            SizedBox(height: 9.v),
                                            Text(
                                              "msg_cotton_black_dress".tr,
                                              style: CustomTextStyles
                                                  .bodySmallLatoGray60001,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 12.v),
                                    child: Divider(
                                      color: appTheme.gray20001,
                                      indent: 82.h,
                                      endIndent: 21.h,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 11.v,
                                    right: 80.h,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgImage3,
                                        height: 56.adaptSize,
                                        width: 56.adaptSize,
                                        radius: BorderRadius.circular(
                                          28.h,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 7.v,
                                            bottom: 7.v,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "lbl_12_50".tr,
                                                style: CustomTextStyles
                                                    .bodyMedium_1,
                                              ),
                                              SizedBox(height: 10.v),
                                              Text(
                                                "msg_saddle_shoulder".tr,
                                                style: CustomTextStyles
                                                    .bodySmallLatoGray60001,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 12.v),
                                    child: Divider(
                                      color: appTheme.gray20001,
                                      indent: 82.h,
                                      endIndent: 21.h,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 11.v,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgImage4,
                                        height: 56.adaptSize,
                                        width: 56.adaptSize,
                                        radius: BorderRadius.circular(
                                          28.h,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 16.h,
                                          top: 7.v,
                                          bottom: 7.v,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_99_30".tr,
                                              style:
                                                  CustomTextStyles.bodyMedium_1,
                                            ),
                                            SizedBox(height: 9.v),
                                            Text(
                                              "lbl_leather_shoes".tr,
                                              style: CustomTextStyles
                                                  .bodySmallLatoGray60001,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 12.v),
                                    child: Divider(
                                      color: appTheme.gray20001,
                                      indent: 82.h,
                                      endIndent: 21.h,
                                    ),
                                  ),
                                ),
                                CustomOutlinedButton(
                                  height: 48.v,
                                  text: "lbl_buy_it_now".tr,
                                  margin: EdgeInsets.fromLTRB(
                                      10.h, 19.v, 10.h, 18.v),
                                  buttonStyle:
                                      CustomButtonStyles.outlineIndigoA,
                                  buttonTextStyle:
                                      CustomTextStyles.bodyMediumIndigoA200_1,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 49.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowleftGray60002,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightGray60002,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(left: 32.h),
                              ),
                            ],
                          ),
                          SizedBox(height: 64.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 32.v,
                            ),
                            decoration: AppDecoration.fillOnErrorContainer,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 8.v),
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage14,
                                  height: 204.v,
                                  width: 231.h,
                                  radius: BorderRadius.circular(
                                    12.h,
                                  ),
                                ),
                                SizedBox(height: 42.v),
                                Text(
                                  "lbl_get_20_off".tr,
                                  style:
                                      CustomTextStyles.bodyLargeLatoGray90001,
                                ),
                                SizedBox(height: 15.v),
                                Text(
                                  "msg_leave_your_email".tr,
                                  style: CustomTextStyles.bodyMediumGray600,
                                ),
                                SizedBox(height: 28.v),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BlocSelector<
                                        MainLandingBloc,
                                        MainLandingState,
                                        TextEditingController?>(
                                      selector: (state) =>
                                          state.emailController,
                                      builder: (context, emailController) {
                                        return CustomTextFormField(
                                          width: 234.h,
                                          controller: emailController,
                                          hintText: "lbl_email2".tr,
                                          hintStyle: CustomTextStyles
                                              .bodyMediumBluegray40002,
                                          textInputAction: TextInputAction.done,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidEmail(value,
                                                    isRequired: true))) {
                                              return "Please enter valid email";
                                            }
                                            return null;
                                          },
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillWhiteA,
                                          fillColor: appTheme.whiteA700,
                                        );
                                      },
                                    ),
                                    CustomElevatedButton(
                                      height: 40.v,
                                      width: 114.h,
                                      text: "lbl_subscribe".tr,
                                      buttonStyle:
                                          CustomButtonStyles.fillIndigoA,
                                      buttonTextStyle:
                                          CustomTextStyles.bodyMediumWhiteA700,
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
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            left: 16.h,
            right: 22.h,
            bottom: 46.v,
          ),
          decoration: AppDecoration.fillGray90001,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "lbl_2021_shopsie".tr,
                style: CustomTextStyles.bodySmallLatoGray60001,
              ),
              Spacer(),
              Text(
                "msg_privacy_cookies".tr,
                style: CustomTextStyles.bodySmallLatoGray20001,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text(
                  "lbl_ts_cs".tr,
                  style: CustomTextStyles.bodySmallLatoGray20001,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
