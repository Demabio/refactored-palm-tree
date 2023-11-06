import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/widgets/membership_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/landandwatermgmt_bloc.dart';
import 'models/landandwatermgmt_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

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
      return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
                height: Device.orientation == Orientation.portrait
                    ? 15.w
                    : DeviceExt(15).h,
                leadingWidth: DeviceExt((60 / 841) * 100).h,
                leading: CustomImageView(
                    svgPath: ImageConstant.imgSort,
                    height: Device.orientation == Orientation.portrait
                        ? DeviceExt(5).h
                        : 5.w,
                    width: Device.orientation == Orientation.portrait
                        ? DeviceExt(5).h
                        : 5.w,
                    onTap: () {
                      onTapSortone(context);
                    }),
                centerTitle: true,
                title:
                    AppbarSubtitle4(text: "msg_land_and_water_management".tr),
                actions: [
                  CustomImageView(
                      svgPath: ImageConstant.imgFrame33,
                      height: Device.orientation == Orientation.portrait
                          ? DeviceExt(5).h
                          : 5.w,
                      width: Device.orientation == Orientation.portrait
                          ? DeviceExt(5).h
                          : 5.w,
                      onTap: () {
                        onTapImage(context);
                      }),
                ],
                styleType: Style.bgFill),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                  horizontal: DeviceExt((14 / 841) * 100).h, vertical: 2.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: ((2 / 411) * 100).w),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: DeviceExt((15 / 841) * 100).h,
                      right: DeviceExt((15 / 841) * 100).h,
                      bottom: ((5 / 411) * 100).w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt((4 / 841) * 100).h),
                          child: Row(children: [
                            Text(
                              "lbl_farmer_info".tr,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((21 / 841) * 100).h),
                                child: Text(
                                  PrefUtils().getFarmerName(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.black,
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                  ),
                                ))
                          ])),
                      Container(
                        margin: EdgeInsets.only(
                            left: DeviceExt((2 / 841) * 100).h,
                            top: ((15 / 411) * 100).w,
                            bottom: ((5 / 411) * 100).w),
                        padding: EdgeInsets.symmetric(
                            horizontal: DeviceExt((5 / 841) * 100).h,
                            vertical: ((15 / 411) * 100).w),
                        decoration: AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((4 / 411) * 100).w,
                                    right: DeviceExt((90 / 841) * 100).h),
                                child: Text(
                                  "msg_what_sustainable".tr,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2.5).w,
                                  ),
                                )),
                            BlocSelector<LandandwatermgmtBloc,
                                    LandandwatermgmtState, List<CheckBoxList>?>(
                                selector: (state) => state.pp,
                                builder: (context, list) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: ((15 / 411) * 100).w,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        list?.length ?? 0,
                                        (index) {
                                          CheckBoxList model = list![index];

                                          return InputsWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((7 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_use_lime".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2.5).w,
                                        ),
                                      ),
                                      Text(
                                        state.farm?.limeUsage ?? false
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2.5).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((21 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((182 / 841) * 100).h,
                                          child: Text(
                                            "msg_have_you_done_soil".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2.5).w,
                                            ),
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 18.w),
                                          child: Text(
                                            state.soil?.soilTest == 1
                                                ? "Yes"
                                                : "No",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              color: Colors.black,
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2.5).w,
                                            ),
                                          ))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((4 / 411) * 100).w),
                                child: Text(
                                  "msg_what_is_the_main".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2.5).w,
                                  ),
                                )),
                            BlocSelector<LandandwatermgmtBloc,
                                    LandandwatermgmtState, List<CheckBoxList>?>(
                                selector: (state) => state.s,
                                builder: (context, list) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: ((15 / 411) * 100).w,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        list?.length ?? 0,
                                        (index) {
                                          CheckBoxList model = list![index];

                                          return InputsWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((6 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_undertake".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2.5).w,
                                        ),
                                      ),
                                      Text(
                                        state.farm?.irrigationUse ?? false
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2.5).w,
                                        ),
                                      )
                                    ])),
                            Visibility(
                              visible: state.farm?.irrigationUse ?? false,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((4 / 841) * 100).h,
                                          top: ((22 / 411) * 100).w),
                                      child: Text(
                                        "msg_if_yes_what_type".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2.5).w,
                                        ),
                                      )),
                                  BlocSelector<
                                          LandandwatermgmtBloc,
                                          LandandwatermgmtState,
                                          List<CheckBoxList>?>(
                                      selector: (state) => state.u,
                                      builder: (context, list) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: ((15 / 411) * 100).w,
                                            right:
                                                DeviceExt((16 / 841) * 100).h,
                                          ),
                                          child: Column(
                                            children: List<Widget>.generate(
                                              list?.length ?? 0,
                                              (index) {
                                                CheckBoxList model =
                                                    list![index];

                                                return InputsWidget(
                                                  model,
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((4 / 841) * 100).h,
                                          top: ((8 / 411) * 100).w),
                                      child: Text(
                                        "msg_type_and_name_of".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2.5).w,
                                        ),
                                      )),
                                  BlocSelector<
                                          LandandwatermgmtBloc,
                                          LandandwatermgmtState,
                                          List<CheckBoxList>?>(
                                      selector: (state) => state.p,
                                      builder: (context, list) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: ((15 / 411) * 100).w,
                                            right:
                                                DeviceExt((16 / 841) * 100).h,
                                          ),
                                          child: Column(
                                            children: List<Widget>.generate(
                                              list?.length ?? 0,
                                              (index) {
                                                CheckBoxList model =
                                                    list![index];

                                                return MembershipItemWidget(
                                                  model,
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((4 / 841) * 100).h,
                                          top: ((8 / 411) * 100).w),
                                      child: Text(
                                        "msg_for_irrigation_schemes".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2.5).w,
                                        ),
                                      )),
                                  BlocSelector<
                                          LandandwatermgmtBloc,
                                          LandandwatermgmtState,
                                          List<CheckBoxList>?>(
                                      selector: (state) => state.b,
                                      builder: (context, list) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: ((15 / 411) * 100).w,
                                            right:
                                                DeviceExt((16 / 841) * 100).h,
                                          ),
                                          child: Column(
                                            children: List<Widget>.generate(
                                              list?.length ?? 0,
                                              (index) {
                                                CheckBoxList model =
                                                    list![index];

                                                return InputsWidget(
                                                  model,
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  DeviceExt((4 / 841) * 100).h,
                                              top: ((7 / 411) * 100).w,
                                              right: DeviceExt((13 / 841) * 100)
                                                  .h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 1.w),
                                                    child: Text(
                                                      "lbl_total_accreage".tr,
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize:
                                                            Device.orientation ==
                                                                    Orientation
                                                                        .portrait
                                                                ? DeviceExt(1.8)
                                                                    .h
                                                                : DeviceExt(2.5)
                                                                    .w,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )),
                                                Text(
                                                    state.farm?.irrigationArea
                                                            .toString() ??
                                                        "N/A",
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((4 / 841) * 100).h,
                                          top: ((20 / 411) * 100).w,
                                          right: DeviceExt((2 / 841) * 100).h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "lbl_unit_of_area2".tr,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2.5).w,
                                              ),
                                            ),
                                            Text(
                                              "lbl_acre".tr,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                color: Colors.black,
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2.5).w,
                                              ),
                                            )
                                          ]))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ((20 / 411) * 100).w),
                      Visibility(
                        visible: state.done,
                        child: CustomElevatedButton(
                          height: Device.orientation == Orientation.portrait
                              ? DeviceExt(6).h
                              : 8.w,
                          width: DeviceExt((343 / 841) * 100).h,
                          buttonTextStyle:
                              theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(2).h
                                : DeviceExt(2.5).w,
                          ),
                          margin: Device.orientation == Orientation.portrait
                              ? EdgeInsets.fromLTRB(DeviceExt(0.36).h, 6.w,
                                  DeviceExt(0.2).h, 1.2.w)
                              : EdgeInsets.fromLTRB(
                                  DeviceExt(0.36).w,
                                  DeviceExt(6).h,
                                  DeviceExt(0.2).w,
                                  DeviceExt(1.2).h),
                          text: "Next Section".tr,
                          onTap: () {
                            if (PrefUtils().getFound()) {
                              NavigatorService.popAndPushNamed(
                                  AppRoutes.addFinancialandservicesTwoScreen);
                            } else {
                              NavigatorService.popAndPushNamed(
                                  AppRoutes.addFinancialandservicesOneScreen);
                            }
                          },
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      SizedBox(height: ((20 / 411) * 100).w),
                      CustomElevatedButton(
                        height: Device.orientation == Orientation.portrait
                            ? DeviceExt(6).h
                            : 8.w,
                        width: DeviceExt((343 / 841) * 100).h,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        margin: Device.orientation == Orientation.portrait
                            ? EdgeInsets.fromLTRB(
                                DeviceExt(0.36).h, 6.w, DeviceExt(0.2).h, 1.2.w)
                            : EdgeInsets.fromLTRB(
                                DeviceExt(0.36).w,
                                DeviceExt(6).h,
                                DeviceExt(0.2).w,
                                DeviceExt(1.2).h),
                        text: "Previous Section".tr,
                        onTap: () {
                          NavigatorService.popAndPushNamed(
                            AppRoutes.farmtechandassetsScreen,
                          );
                        },
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Navigates to the farmerRegistrationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmerRegistrationScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addLandandwatermgmtOneScreen,
    );
  }
}
