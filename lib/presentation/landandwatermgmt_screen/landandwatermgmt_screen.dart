import 'bloc/landandwatermgmt_bloc.dart';
import 'models/landandwatermgmt_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class LandandwatermgmtScreen extends StatelessWidget {
  const LandandwatermgmtScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LandandwatermgmtBloc>(
        create: (context) => LandandwatermgmtBloc(LandandwatermgmtState(
            landandwatermgmtModelObj: LandandwatermgmtModel()))
          ..add(LandandwatermgmtInitialEvent()),
        child: LandandwatermgmtScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<LandandwatermgmtBloc, LandandwatermgmtState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: CustomAppBar(
                  leadingWidth: 60.h,
                  leading: AppbarImage(
                      svgPath: ImageConstant.imgSort,
                      margin:
                          EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                      onTap: () {
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title:
                      AppbarSubtitle4(text: "msg_land_and_water_management".tr),
                  actions: [
                    AppbarImage1(
                        svgPath: ImageConstant.imgFrame33,
                        margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                        onTap: () {
                          onTapImage(context);
                        })
                  ],
                  styleType: Style.bgFill),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 2.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Row(children: [
                              Text("lbl_farmer_info".tr,
                                  style: CustomTextStyles.labelMediumPrimary),
                              Padding(
                                  padding: EdgeInsets.only(left: 21.h),
                                  child: Text("msg_farmer_felix_faro".tr,
                                      style: theme.textTheme.labelMedium))
                            ])),
                        Container(
                            margin: EdgeInsets.only(
                                left: 2.h, top: 15.v, bottom: 5.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 15.v),
                            decoration: AppDecoration.outlinePrimary.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 239.h,
                                      margin: EdgeInsets.only(
                                          left: 4.h, top: 4.v, right: 90.h),
                                      child: Text("msg_what_sustainable".tr,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .labelMediumPrimary)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 6.v),
                                      child: Text("msg_biogas_production".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 13.v),
                                      child: Text("lbl_cambered_beds".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 7.v),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("msg_do_you_use_lime".tr,
                                                style: CustomTextStyles
                                                    .labelMediumPrimary),
                                            Text("lbl_yes".tr,
                                                style:
                                                    theme.textTheme.labelMedium)
                                          ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 21.v),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 182.h,
                                                child: Text(
                                                    "msg_have_you_done_soil".tr,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 18.v),
                                                child: Text("lbl_yes".tr,
                                                    style: theme
                                                        .textTheme.labelMedium))
                                          ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 4.v),
                                      child: Text("msg_what_is_the_main".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 7.v),
                                      child: Text("lbl_water_pan".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 14.v),
                                      child: Text("lbl_water_trucking".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 7.v),
                                      child: Text("lbl_irrigation".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 6.v),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("msg_do_you_undertake".tr,
                                                style: CustomTextStyles
                                                    .labelMediumPrimary),
                                            Text("lbl_yes".tr,
                                                style:
                                                    theme.textTheme.labelMedium)
                                          ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 22.v),
                                      child: Text("msg_if_yes_what_type".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 7.v),
                                      child: Text("lbl_flooding".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 13.v),
                                      child: Text("lbl_furrow_canal".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 8.v),
                                      child: Text("msg_type_and_name_of".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary)),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 4.h, top: 7.v, right: 9.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1.v),
                                                child: Text(
                                                    "msg_public_irrigation".tr,
                                                    style: theme.textTheme
                                                        .labelMedium)),
                                            Text("msg_faro_full_member".tr,
                                                style:
                                                    theme.textTheme.labelMedium)
                                          ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 8.v),
                                      child: Text(
                                          "msg_for_irrigation_schemes".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 6.v),
                                      child: Text("lbl_other".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 15.v),
                                      child: Text("lbl_self_private".tr,
                                          style: theme.textTheme.labelMedium)),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.h, top: 7.v, right: 13.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 1.v),
                                                    child: Text(
                                                        "lbl_total_accreage".tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary)),
                                                Text("lbl_2".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 4.h, top: 20.v, right: 2.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("lbl_unit_of_area2".tr,
                                                style: CustomTextStyles
                                                    .labelMediumPrimary),
                                            Text("lbl_acre".tr,
                                                style:
                                                    theme.textTheme.labelMedium)
                                          ]))
                                ]))
                      ]))));
    });
  }

  /// Navigates to the farmerRegistrationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmerRegistrationScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addLandandwatermgmtOneScreen,
    );
  }
}
