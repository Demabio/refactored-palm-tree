import 'bloc/primary_farm_holding_bloc.dart';
import 'models/primary_farm_holding_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class PrimaryFarmHoldingScreen extends StatelessWidget {
  const PrimaryFarmHoldingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PrimaryFarmHoldingBloc>(
        create: (context) => PrimaryFarmHoldingBloc(PrimaryFarmHoldingState(
            primaryFarmHoldingModelObj: PrimaryFarmHoldingModel()))
          ..add(PrimaryFarmHoldingInitialEvent()),
        child: PrimaryFarmHoldingScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<PrimaryFarmHoldingBloc, PrimaryFarmHoldingState>(
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
                  title: AppbarSubtitle1(text: "msg_primary_farm_holding".tr),
                  actions: [
                    AppbarImage1(
                        svgPath: ImageConstant.imgFrame33,
                        margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                        onTap: () {
                          onTapImage(context);
                        })
                  ],
                  styleType: Style.bgFill),
              body: SizedBox(
                  width: mediaQueryData.size.width,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 20.h, right: 14.h, bottom: 5.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text("lbl_farmer_info".tr,
                                      style:
                                          CustomTextStyles.labelMediumPrimary),
                                  Padding(
                                      padding: EdgeInsets.only(left: 21.h),
                                      child: Text("msg_farmer_felix_faro".tr,
                                          style: theme.textTheme.labelMedium))
                                ]),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 1.h, top: 7.v),
                                    child: Text("msg_main_farm_enterprises".tr,
                                        style: CustomTextStyles
                                            .titleMediumSemiBold)),
                                Container(
                                    height: 691.v,
                                    width: 340.h,
                                    margin:
                                        EdgeInsets.only(left: 1.h, top: 22.v),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4.h,
                                                      vertical: 46.v),
                                                  decoration: AppDecoration
                                                      .outlinePrimary1
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 1
                                                                              .v),
                                                                  child: Text(
                                                                      "lbl_total_acreage"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Text("lbl_10".tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium)
                                                            ]),
                                                        SizedBox(height: 28.v),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "lbl_area_unit"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .labelMediumPrimary),
                                                              Text(
                                                                  "lbl_acre".tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium)
                                                            ]),
                                                        SizedBox(height: 29.v),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: 156.h,
                                                                  child: Text(
                                                                      "msg_size_of_land_under"
                                                                          .tr,
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          18.v),
                                                                  child: Text(
                                                                      "lbl_4"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelMedium))
                                                            ]),
                                                        SizedBox(height: 10.v),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: 156.h,
                                                                  child: Text(
                                                                      "msg_total_land_area"
                                                                          .tr,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          16.v),
                                                                  child: Text(
                                                                      "lbl_3"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelMedium))
                                                            ]),
                                                        SizedBox(height: 14.v),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: 161.h,
                                                                  child: Text(
                                                                      "msg_size_of_land_leased"
                                                                          .tr,
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          18.v),
                                                                  child: Text(
                                                                      "lbl_1"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelMedium))
                                                            ]),
                                                        SizedBox(height: 10.v),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: 164.h,
                                                                  child: Text(
                                                                      "msg_size_of_land_lying"
                                                                          .tr,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          16.v),
                                                                  child: Text(
                                                                      "lbl_2"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelMedium))
                                                            ]),
                                                        SizedBox(height: 13.v),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "lbl_latitude"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .labelMediumPrimary),
                                                              Text(
                                                                  "lbl_3_31341"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium)
                                                            ]),
                                                        SizedBox(height: 30.v),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 1
                                                                              .v),
                                                                  child: Text(
                                                                      "lbl_longitude"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Text(
                                                                  "lbl_39_31874"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium)
                                                            ]),
                                                        SizedBox(height: 28.v),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 1
                                                                              .v),
                                                                  child: Text(
                                                                      "lbl_accuracy"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Text("lbl_11".tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium)
                                                            ]),
                                                        SizedBox(height: 27.v),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: 136.h,
                                                                  child: Text(
                                                                      "msg_lr_no_certificate_lease"
                                                                          .tr,
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          19.v),
                                                                  child: Text(
                                                                      "lbl_n_a"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelMedium))
                                                            ]),
                                                        SizedBox(height: 11.v),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  width: 147.h,
                                                                  child: Text(
                                                                      "msg_do_you_have_another"
                                                                          .tr,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: CustomTextStyles
                                                                          .labelMediumPrimary)),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      bottom:
                                                                          15.v),
                                                                  child: Text(
                                                                      "lbl_yes"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelMedium))
                                                            ]),
                                                        SizedBox(height: 15.v),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "msg_legal_status_of"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .labelMediumPrimary),
                                                              Text(
                                                                  "lbl_owned_by_family"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium)
                                                            ]),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 34.h,
                                                                    top: 29.v,
                                                                    bottom:
                                                                        15.v),
                                                            child: Text(
                                                                "msg_enterprises_on_this"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelMediumPrimary))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4.h),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "msg_descriptive_name"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .labelMediumPrimary),
                                                              Text(
                                                                  "lbl_fff_farm"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium)
                                                            ]),
                                                        SizedBox(height: 626.v),
                                                        Text(
                                                            "msg_growing_crops_for"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium),
                                                        SizedBox(height: 14.v),
                                                        Text(
                                                            "msg_growing_crops_for2"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)
                                                      ])))
                                        ]))
                              ]))))));
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
      AppRoutes.primaryFarmHoldingOneScreen,
    );
  }
}
