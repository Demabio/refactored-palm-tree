import 'bloc/farmtechandassets_bloc.dart';
import 'models/farmtechandassets_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class FarmtechandassetsScreen extends StatelessWidget {
  const FarmtechandassetsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmtechandassetsBloc>(
        create: (context) => FarmtechandassetsBloc(FarmtechandassetsState(
            farmtechandassetsModelObj: FarmtechandassetsModel()))
          ..add(FarmtechandassetsInitialEvent()),
        child: FarmtechandassetsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FarmtechandassetsBloc, FarmtechandassetsState>(
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
                  title: AppbarSubtitle4(text: "msg_farm_technology2".tr),
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
                                        horizontal: 7.h, vertical: 11.v),
                                    decoration: AppDecoration.outlinePrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 9.v),
                                              child: Text(
                                                  "msg_source_of_power".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 10.v),
                                              child: Text("lbl_animal_draft".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 16.v),
                                              child: Text(
                                                  "msg_grid_electricity".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 10.v),
                                              child: Text(
                                                  "lbl_labour_source".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h,
                                                  top: 11.v,
                                                  right: 7.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 1.v),
                                                        child: Text(
                                                            "lbl_labour_source2"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)),
                                                    Text(
                                                        "lbl_family_members".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 11.v),
                                              child: Text(
                                                  "msg_farmer_machinery".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h,
                                                  top: 12.v,
                                                  right: 7.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_asset_type".tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_crops".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h,
                                                  top: 8.v,
                                                  right: 7.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_asset".tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_tractor".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h,
                                                  top: 9.v,
                                                  right: 7.h),
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
                                                            "lbl_quantity".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)),
                                                    Text("lbl_2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h,
                                                  top: 8.v,
                                                  right: 7.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_usable_condition"
                                                            .tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 11.v),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 186.h,
                                                        child: Text(
                                                            "msg_who_owns_most_of"
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
                                                                left: 77.h,
                                                                bottom: 18.v),
                                                        child: Text(
                                                            "lbl_self_family"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium))
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 8.v),
                                              child: Text(
                                                  "msg_which_farm_structures"
                                                      .tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 10.v),
                                              child: Text("lbl_bee_house".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 15.v),
                                              child: Text("lbl_cattle_boma".tr,
                                                  style: theme
                                                      .textTheme.labelMedium))
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
      AppRoutes.addFarmtechandassetsOneScreen,
    );
  }
}
