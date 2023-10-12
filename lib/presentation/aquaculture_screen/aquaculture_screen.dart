import 'bloc/aquaculture_bloc.dart';
import 'models/aquaculture_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class AquacultureScreen extends StatelessWidget {
  const AquacultureScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AquacultureBloc>(
        create: (context) => AquacultureBloc(
            AquacultureState(aquacultureModelObj: AquacultureModel()))
          ..add(AquacultureInitialEvent()),
        child: AquacultureScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AquacultureBloc, AquacultureState>(
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
                  title: AppbarSubtitle1(text: "lbl_aquaculture".tr),
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
                              left: 15.h, right: 15.h, bottom: 5.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Row(children: [
                                      Text("lbl_farmer_info".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary),
                                      Padding(
                                          padding: EdgeInsets.only(left: 21.h),
                                          child: Text(
                                              "msg_farmer_felix_faro".tr,
                                              style:
                                                  theme.textTheme.labelMedium))
                                    ])),
                                SizedBox(height: 15.v),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.h, vertical: 20.v),
                                    decoration: AppDecoration.outlinePrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 4.h),
                                              child: Text(
                                                  "msg_aquaculture_type".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 3.v),
                                              child: Text(
                                                  "msg_what_types_of_aquaculture"
                                                      .tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Text("lbl_brackish".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 15.v),
                                              child: Text("lbl_fresh_water".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 4.v),
                                              child: Text(
                                                  "msg_production_system2".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 3.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_production_system2"
                                                            .tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_cages".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 8.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_no_of_active_units"
                                                            .tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 10.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_active_volume_m3"
                                                            .tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 9.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_no_of_inactive_units"
                                                            .tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 10.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_inactive_volume_m3"
                                                            .tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Container(
                                              width: 313.h,
                                              margin: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 3.v,
                                                  right: 16.h),
                                              child: Text(
                                                  "msg_does_the_household".tr,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 5.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "lbl_fish_type".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)),
                                                    Text("lbl_catfish".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 8.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "lbl_fish_category"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 8.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "msg_production_system2"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 8.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "msg_estimated_no_of"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 3.v),
                                              child: Text(
                                                  "msg_what_are_your_main2".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 3.v),
                                              child: Text("lbl_fingerlings".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 13.v),
                                              child: Text("lbl_fertilizers".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 4.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_do_you_utilize_fertilizers"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 4.h,
                                                      top: 17.v,
                                                      right: 12.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 1.v),
                                                            child: Text(
                                                                "msg_which_is_your_production"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelMediumPrimary)),
                                                        Text("lbl_intensive".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)
                                                      ]))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 17.v),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 197.h,
                                                        child: Text(
                                                            "msg_have_you_benefited"
                                                                .tr,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 18.v),
                                                        child: Text(
                                                            "lbl_yes".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium))
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, bottom: 15.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_do_you_insure_your"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ]))
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
      AppRoutes.addAquacultureOneScreen,
    );
  }
}
