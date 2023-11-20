import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/presentation/side_menu_draweritem/side_menu_draweritem.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(farmtechandassetsModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
            drawer: SideMenuDraweritem(),
            key: _scaffoldKey,
            appBar: CustomAppBar(
                height: ((47 / 411) * 100).w,
                leadingWidth: DeviceExt((48 / 841) * 100).h,
                leading: AppbarImage(
                  onTap: () {
                    onTapMenuone(context);
                  },
                  svgPath: ImageConstant.imgMenu,
                  margin: EdgeInsets.only(
                    left: DeviceExt((24 / 841) * 100).h,
                    top: ((8 / 411) * 100).w,
                    bottom: ((15 / 411) * 100).w,
                  ),
                ),
                centerTitle: true,
                title: AppbarSubtitle4(text: "Profile".tr),
                styleType: Style.bgFill),
            body: SizedBox(
              width: mediaQueryData.size.width,
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
                              "Name:".tr,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                              ),
                            ),
                            Spacer(),
                            Text(
                              state.name ?? "",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ])),
                      SizedBox(height: ((50 / 411) * 100).w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DeviceExt((7 / 841) * 100).h,
                            vertical: ((11 / 411) * 100).w),
                        decoration: AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "Enumerator Code:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.id ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "ID Number:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.idNo ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "Mobile Number:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.mobile ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "Enumeration Area Number:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.eAN ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "Status:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.status ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "County:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.county ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "SubCounty:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.subCounty ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "SubLocation:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.sublocation ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "Ward:".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Spacer(),
                                      Text(
                                        state.ward ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      )
                                    ])),
                          ],
                        ),
                      ),
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
                        text: "Back".tr,
                        onTap: () => NavigatorService.popAndPushNamed(
                            AppRoutes.homeScreen),
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

  onTapMenuone(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
  }

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addFarmtechandassetsOneScreen,
    );
  }
}
